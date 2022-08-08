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
      pkgWhich = [ pkgs.which ];
      yarnFlagsCommon = [
        "--offline"
        "--frozen-lockfile"
        # "--verbose"
        "--production=false"
      ];

      # packages in subrepos
      lang-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-lang_source";
        # extraNativeBuildInputs = [ pkgs.which ];
        src = ./packages/squiggle-lang;
        packageJSON = ./packages/squiggle-lang/package.json;
        yarnLock = ./yarn.lock;
        yarnFlags = yarnFlagsCommon;
        pkgConfig = {
          rescript = {
            buildInputs = pkgWhich ++ [ pkgs.gcc_multi ];
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
            buildInputs = pkgWhich;
            postInstall = ''
              echo "PATCHELF'ING BISECT_PPX EXECUTABLE"
              THE_LD=$(patchelf --print-interpreter $(which mkdir))
              patchelf --set-interpreter $THE_LD bin/linux/ppx
            '';
          };
          gentype = {
            buildInputs = pkgWhich ++ (with pkgs; [ glibc ]);
            # preInstall = "export CC='musl-gcc -static'";
            postInstall = ''
              echo "PATCHELF'ING GENTYPE"
              THE_LD=$(patchelf --print-interpreter $(which mkdir))
              # patchelf --set-interpreter $THE_LD gentype.exe && echo "- patched interpreter for gentype.exe"
              patchelf --set-interpreter $THE_LD vendor-linux/gentype.exe && echo "- patched interpreter for vendor-linux/gentype.exe"
            '';
          };
        };
       # yarnPostBuild = ''
       #   echo "MORE PATCHELF'ING GENTYPE"
       #   THE_LD=$(patchelf --print-interpreter $(which mkdir))
       #   ls yarn_home/.cache/yarn/v6
       #   exit 1
       #   patchelf --set-interpreter $THE_LD ./.bin/gentype && echo "- patched interpreter for .bin/gentype"
       # '';
      };
      lang-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-lint";
        src = lang-yarnPackage
          + "/libexec/@quri/squiggle-lang/deps/@quri/squiggle-lang";
        buildInputs = buildInputsCommon;
        # Can only do prettier because `./lint.sh` script for rescript doesn't work,
        # see https://stackoverflow.com/questions/18018359/all-newlines-are-removed-when-saving-cat-output-into-a-variable
        buildPhase = "yarn lint:prettier";
        installPhase = "mkdir -p $out";
      };
      lang-rescript-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-rescript-build";
        # `peggy` is in the `node_modules` that's adjacent to `deps`.
        src = lang-yarnPackage + "/libexec/@quri/squiggle-lang/";
        buildInputs = buildInputsCommon;
        buildPhase = ''
          # A bad hack to keep the `bsconfig` consistent
          mkdir -p deps/node_modules
          mv node_modules/bisect_ppx deps/node_modules

          # build rescript
          yarn --offline --cwd deps/@quri/squiggle-lang build:rescript
        '';
        installPhase = ''
          mkdir -p $out
          cp -r $src/deps/@quri/squiggle-lang $out
          cp -r $src/node_modules $out/node_modules
        '';
      };
      lang-typescript-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-typescript-build";
        src = lang-rescript-build;
        buildInputs = buildInputsCommon;
        buildPhase = "yarn --offline --cwd=squiggle-lang build:typescript";
        installPhase = ''
          mkdir -p $out
          cp -r squiggle-lang $out
        '';
      };
      lang-test = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-test";
        src = lang-typescript-build;
        buildInputs = buildInputsCommon;
        buildPhase = "yarn --offline test";
        installPhase = ''
          mkdir -p $out
          cp -r . $out
        '';
      };
      lang-bundle = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-bundle";
        src = lang-test;
        buildInputs = buildInputsCommon;
        buildPhase = "yarn --offline bundle";
        installPhase = ''
          mkdir -p $out
          cp -r dist $out/dist
        '';
        # passthru to spoof that this is still a yarn package even tho it's a subsequent derivation
        workspaceDependencies = [ ];
        pname = "@quri/squiggle-lang";
        packageJSON = ./packages/squiggle-lang/package.json;
      };

      components-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-components_source";
        buildInputs = buildInputsCommon;
        src = ./packages/components;
        packageJSON = ./packages/components/package.json;
        yarnLock = ./yarn.lock;
        yarnFlags = yarnFlagsCommon;
        workspaceDependencies = [ lang-bundle ];
        yarnPreBuild = ''
          mkdir -p $src/node_modules/@quri/squiggle-lang
          cp -r ${lang-bundle}/dist $src/node_modules/@quri/squiggle-lang
          cp -r ${lang-bundle}/dist/node_modules/* $src/node_modules
        '';

      };
      components-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-lint";
        src = components-yarnPackage
          + "/libexec/@quri/squiggle-components/deps/@quri/squiggle-components";
        buildPhase = "yarn --offline lint";
        installPhase = "mkdir -p $out";
      };
      components-typescript-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-typescript-build";
        src = components-yarnPackage
          + "/libexec/@quri/squiggle-components/deps/@quri/squiggle-components";
        buildInputs = buildInputsCommon;
        buildPhase = ''
          yarn --offline build:cjs
        '';
        installPhase = ''
          mkdir -p $out
          cp -r $src $out
          cp -r ../../../node_modules $out
        '';
      };
      components-postcss-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-postcss-build";
        src = components-typescript-build;
        buildInputs = buildInputsCommon;
        buildPhase = "yarn --offline build:css";
        installPhase = ''
          mkdir -p $out
          cp -r $src $out
        '';
        # passthru to spoof that this is still a yarn package even tho it's a subsequent derivation
        workspaceDependencies = [ ];
        pname = "@quri/squiggle-components";
        packageJSON = ./packages/components/package.json;
      };

      website-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-website_source";
        src = ./packages/website;
        packageJSON = ./packages/website/package.json;
        yarnLock = ./yarn.lock;
        yarnFlags = yarnFlagsCommon;
        workspaceDependencies = [ components-postcss-build ];

      };
      website-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-website-lint";
        buildInputs = buildInputsCommon;
        src = website-yarnPackage
          + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn --offline lint";
        installPhase = "mkdir -p $out";
      };
      website = pkgs.stdenv.mkDerivation {
        name = "squiggle-website";
        buildInputs = buildInputsCommon;
        src = website-yarnPackage
          + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn --offline build";
        installPhase = ''
          mkdir -p $out
          cp -r $src/build $out
        '';
      };
    in rec {

      checks."${system}" = {
        lang-lint = lang-lint;
        lang-test = lang-test;
        components-lint = components-lint;
        docusaurus-lint = website-lint;
      };
      packages."${system}" = {
        default = website;
        lang-bundle = lang-bundle;
        components = components-typescript-build;
        docs-site = website;
      };

      # herc
      herculesCI.onPush = {
        lang-checks.outputs = {
          squiggle-lang-lint = checks."${system}".lang-lint;
          squiggle-lang-test = checks."${system}".lang-test;
        };
        lang.outputs = {
          squiggle-lang-rescript-build = lang-rescript-build;
          squiggle-lang-typescript-build = lang-typescript-build;
          squiggle-lang-bundle = packages."${system}".lang-bundle;
        };
        components.outputs = {
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
