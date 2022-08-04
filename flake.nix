{
  description = "Squiggle CI";
  # Derived from https://gitlab.com/Silvers_Gw2/Stats_Frontend/-/blob/cc5d783abd54e95363410592c390ca6925462262/flake.nix

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";
  };

  outputs = { self, nixpkgs, hercules-ci-effects, ... }:
    let
      # globals
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        overlays = [ hercules-ci-effects.overlay ];
      };

      # set the node version here
      nodejs = pkgs.nodejs-16_x;
      buildInputsCommon = [ nodejs pkgs.yarn ];
      yarnFlagsCommon = [
        "--offline"
        "--frozen-lockfile"
        # "--verbose"
        "--production=false"
      ];

      # packages in subrepos
      squiggle-lang-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-lang_source";
        # extraNativeBuildInputs = [ pkgs.which ];
        src = ./packages/squiggle-lang;
        packageJSON = ./packages/squiggle-lang/package.json;
        yarnLock = ./yarn.lock;
        yarnFlags = yarnFlagsCommon;
        # buildInputs = with pkgs; [ which patchelf ocaml ninja ocamlPackages.merlin ];
        pkgConfig = {
          rescript = {
            buildInputs = with pkgs; [ which gcc_multi ocaml ];
            postInstall = ''
              echo "PATCHELF'ING RESCRIPT EXECUTABLES (INCL NINJA)"
              # Patching interpreter for linux/*.exe's
              THE_LD=$(patchelf --print-interpreter $(which mkdir))
              patchelf --set-interpreter $THE_LD linux/*.exe && echo "- patched interpreter for linux/*.exe's"

              # Replacing needed shared library for linux/ninja.exe
              THE_SO=$(find /nix/store/*/lib64 -name libstdc++.so.6 | head -n 1)
              patchelf --replace-needed libstdc++.so.6 $THE_SO linux/ninja.exe && echo "- replaced needed for linux/ninja.exe"
            '';
          };
          bisect_ppx = {
            buildInputs = with pkgs; [ which ];
            postInstall = ''
              echo "PATCHELF'ING BISECT_PPX EXECUTABLE"
              THE_LD=$(patchelf --print-interpreter $(which mkdir))
              patchelf --set-interpreter $THE_LD bin/linux/ppx
            '';
          };
          gentype = {
            buildInputs = with pkgs; [ which ];
            postInstall = ''
              echo "PATCHELF'ING GENTYPE"
              THE_LD=$(patchelf --print-interpreter $(which mkdir))
              patchelf --set-interpreter $THE_LD vendor-linux/gentype.exe
            '';
          };
        };
      };
      squiggle-lang-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-lint";
        src = squiggle-lang-yarnPackage
          + "/libexec/@quri/squiggle-lang/deps/@quri/squiggle-lang";
        buildInputs = buildInputsCommon;
        # Can only do prettier because `.lint.sh` script for rescript doesn't work,
        # see https://stackoverflow.com/questions/18018359/all-newlines-are-removed-when-saving-cat-output-into-a-variable
        buildPhase = "yarn lint:prettier";
        installPhase = "mkdir -p $out";
      };
      squiggle-lang = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang";
        # `peggy` is in the `node_modules` that's adjacent to `deps`.
        src = squiggle-lang-yarnPackage + "/libexec/@quri/squiggle-lang/";
        buildInputs = buildInputsCommon;
        buildPhase = ''
          yarn --offline --cwd deps/@quri/squiggle-lang build
        '';
        installPhase = ''
          mkdir -p $out
          cp -r $src/libexec/@quri/squiggle-lang/deps/@quri/squiggle-lang/dist $out/dist
          cp -r $src/libexec/@quri/squiggle-lang/node_modules/ $out/node_modules
        '';
        # passthru to spoof that this is still a yarn package even tho it's a subsequent derivation
        workspaceDependencies = [ ];
        pname = "@quri/squiggle-lang";
        packageJSON = ./packages/squiggle-lang/package.json;
      };

      squiggle-components-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-components_source";
        buildInputs = buildInputsCommon;
        src = ./packages/components;
        packageJSON = ./packages/components/package.json;
        yarnLock = ./yarn.lock;
        workspaceDependencies = [ squiggle-lang ];
        yarnPreBuild = ''
          mkdir -p $src/node_modules/@quri/squiggle-lang
          cp -r ${squiggle-lang}/dist $src/node_modules/@quri/squiggle-lang
        '';

        yarnFlags = yarnFlagsCommon;
      };
      squiggle-components-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-lint";
        src = squiggle-components-yarnPackage
          + "/libexec/@quri/squiggle-components/deps/@quri/squiggle-components";
        buildPhase = "yarn lint";
        installPhase = "mkdir -p $out";
      };
      squiggle-components = pkgs.stdenv.mkDerivation {
        name = "squiggle-components";
        src = squiggle-components-yarnPackage
          + "/libexec/@quri/squiggle-components/"; # deps/@quri/squiggle-components";
        buildInputs = buildInputsCommon;
        buildPhase = ''
          cd deps/@quri/squiggle-components
          yarn all
        '';
        installPhase = ''
          mkdir -p $out
          cp -R $src/libexec/squiggle-components/deps/squiggle-components $out
          rm $out/bin/node_modules
          cp -R $src/libexec/squiggle-components/node_modules/. $out/node_modules
        '';
      };

      squiggle-website-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-website_source";
        src = ./packages/website;
        packageJSON = ./packages/website/package.json;
        yarnLock = ./yarn.lock;
        workspaceDependencies = [ squiggle-components-yarnPackage ];

        yarnFlags = yarnFlagsCommon;
      };
      squiggle-website-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-website-lint";
        buildInputs = buildInputsCommon;
        src = squiggle-website-yarnPackage
          + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn lint";
        installPhase = "mkdir -p $out";
      };
      squiggle-website = pkgs.stdenv.mkDerivation {
        name = "squiggle-website";
        buildInputs = buildInputsCommon;
        src = squiggle-website-yarnPackage
          + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn build";
        installPhase = ''
          mkdir -p $out
          cp -R $ src/libexec/squiggle-website/deps/squiggle-website/build $out
          rm $out/bin/node_modules
          cp -R $src/libexec/squiggle-website/node_modules/. $out/node_modules
        '';
      };
    in rec {

      checks."${system}" = {
        lang-lint = squiggle-lang-lint;
        components-lint = squiggle-components-lint;
        docusaurus-lint = squiggle-website-lint;
      };
      packages."${system}" = {
        default = squiggle-website;
        lang = squiggle-lang;
        components = squiggle-components;
        docs-site = squiggle-website;
      };

      # herc
      herculesCI.onPush = {
        squiggle-lang.outputs = {
          squiggle-lang = packages."${system}".lang;
          squiggle-lang-lint = checks."${system}".lang-lint;
        };
        squiggle-components.outputs = {
          squiggle-components = packages."${system}".components;
          squiggle-components-lint = checks."${system}".components-lint;
        };

        docs-site.outputs = {
          squiggle-website = packages."${system}".docs-site;
          docusaurus-lint = checks."${system}".docusaurus-lint;
        };
      };
    };
}
