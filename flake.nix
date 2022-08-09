{
  description = "Squiggle CI";
  # Derived from https://gitlab.com/Silvers_Gw2/Stats_Frontend/-/blob/cc5d783abd54e95363410592c390ca6925462262/flake.nix

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    gentype = {
      url = "github:quinn-dougherty/genType";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hercules-ci-effects = {
      url = "github:hercules-ci/hercules-ci-effects";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, gentype, hercules-ci-effects, ... }:
    let
      # globals
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        overlays = [
          hercules-ci-effects.overlay
          (final: prev: {
            # set the node version here
            nodejs = prev.nodejs-16_x;
            # The override is the only way to get it into mkYarnModules
          })
        ];
      };
      buildInputsCommon = with pkgs; [ nodejs yarn ];
      prettierCommon = with pkgs.nodePackages; [ prettier ];
      pkgWhich = [ pkgs.which ];

      # To get prettier into later source trees
      monorepo-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-monorepo_source";
        src = ./.;
        packageJSON = ./package.json;
        yarnLock = ./yarn.lock;
      };

      # packages in subrepos
      lang-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-lang_source";
        src = ./packages/squiggle-lang;
        packageJSON = ./packages/squiggle-lang/package.json;
        yarnLock = ./yarn.lock;
        # extraBuildInputs = prettierCommon;
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
            buildInputs = pkgWhich; #  ++ (with pkgs; [ ocaml nodePackages.esy ocamlPackages.bisect_ppx ]);
            postInstall = ''
              echo "PATCHELF'ING BISECT_PPX EXECUTABLE"
              THE_LD=$(patchelf --print-interpreter $(which mkdir))
              patchelf --set-interpreter $THE_LD bin/linux/ppx
              patchelf --set-interpreter $THE_LD bin/linux/bisect-ppx-report
            '';
          };
          gentype = {
            postInstall = ''
              mv gentype.exe ELFLESS-gentype.exe
              cp ${gentype.outputs.defaultPackage."${system}"}/GenType.exe gentype.exe
            '';
          };
        };
      };
      lang-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-lint";
        src = lang-yarnPackage
          + "/libexec/@quri/squiggle-lang/deps/@quri/squiggle-lang";
        buildInputs = buildInputsCommon ++ prettierCommon;
        buildPhase = ''
          yarn lint:prettier
          yarn lint:rescript
        '';
        installPhase = "mkdir -p $out";
      };
      lang-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-build";
        # `peggy` is in the `node_modules` that's adjacent to `deps`.
        src = lang-yarnPackage + "/libexec/@quri/squiggle-lang";
        buildInputs = buildInputsCommon;
        buildPhase = ''
          mv node_modules deps
          pushd deps/@quri/squiggle-lang
          yarn --offline build:peggy
          yarn --offline build:rescript
          yarn --offline build:typescript

          # custom gitignore so that the flake keeps build artefacts
          mv .gitignore GITIGNORE
          sed -i /Reducer_Peggy_GeneratedParser.js/d GITIGNORE
          sed -i /\*.bs.js/d GITIGNORE
          sed -i /\*.gen.ts/d GITIGNORE
          sed -i /\*.gen.tsx/d GITIGNORE
          sed -i /\*.gen.js/d GITIGNORE
          sed -i /helpers.js/d GITIGNORE

          popd
        '';
        installPhase = ''
          mkdir -p $out
          # mkdir -p $out/node_modules
          mv deps/@quri/squiggle-lang/GITIGNORE deps/@quri/squiggle-lang/.gitignore

          # annoying hack because permissions on transitive dependencies later on
          mv deps/@quri/squiggle-lang/node_modules deps/@quri/squiggle-lang/NODE_MODULES
          mv deps/node_modules deps/@quri/squiggle-lang

          # the proper install phase
          cp -r deps/@quri/squiggle-lang/. $out
        '';
      };
      lang-test = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-test";
        src = lang-build;
        buildInputs = buildInputsCommon;
        buildPhase = ''
          yarn --offline test
        '';
        installPhase = ''
          mkdir -p $out
          cp -r . $out
        '';
      };
      lang-bundle = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-bundle";
        src = lang-test;
        buildInputs = buildInputsCommon;
        buildPhase = ''
          yarn --offline bundle
        '';
        installPhase = ''
          mkdir -p $out
          cp -r dist $out
          cp *.json $out/dist
        '';
      };

      components-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-components_source";
        buildInputs = buildInputsCommon;
        src = ./packages/components;
        packageJSON = ./packages/components/package.json;
        yarnLock = ./yarn.lock;
        # extraBuildInputs = prettierCommon;
        packageResolutions."@quri/squiggle-lang" = lang-build;
      };
      components-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-lint";
        src = components-yarnPackage
          + "/libexec/@quri/squiggle-components/deps/@quri/squiggle-components";
        buildInputs = buildInputsCommon ++ prettierCommon;
        buildPhase = "yarn lint";
        installPhase = "mkdir -p $out";
      };
      components-package-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-package-build";
        src = components-yarnPackage + "/libexec/@quri/squiggle-components";
        buildInputs = buildInputsCommon;
        buildPhase = ''
          cp -r node_modules/@quri/squiggle-lang deps/@quri
          pushd deps/@quri/squiggle-components

          yarn --offline build:cjs
          yarn --offline build:css
          popd
        '';
        installPhase = ''
          mkdir -p $out

          # annoying hack because permissions on transitive dependencies later on
          mv deps/@quri/squiggle-components/node_modules deps/@quri/squiggle-components/NODE_MODULES
          mv node_modules deps/@quri/squiggle-components

          # patching .gitignore so flake keeps build artefacts
          sed -i /dist/d deps/@quri/squiggle-components/.gitignore
          cp -r deps/@quri/squiggle-components/. $out
        '';
      };
      components-site-build = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-storybook";
        src = components-package-build;
        buildInputs = buildInputsCommon;
        buildPhase = "yarn build:storybook";
        installPhase = ''
          mkdir -p $out

          # patching .gitignore so flake keeps build artefacts
          sed -i /\build/d squiggle-components/.gitignore
          sed -i /storybook-tatic/d squiggle-components/.gitignore
        '';
      };

      website-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-website_source";
        src = ./packages/website;
        packageJSON = ./packages/website/package.json;
        yarnLock = ./yarn.lock;
        packageResolutions."@quri/squiggle-lang" = lang-build;
        packageResolutions."@quri/squiggle-components" = components-package-build;
      };
      website-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-website-lint";
        buildInputs = buildInputsCommon ++ prettierCommon;
        src = website-yarnPackage
          + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn lint";
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

      checks.${system} = {
        lang-lint = lang-lint;
        lang-test = lang-test;
        components-lint = components-lint;
        docusaurus-lint = website-lint;
      };
      packages.${system} = {
        default = website;
        lang-bundle = lang-bundle;
        components = components-package-build;
        docs-site = website;
       # tmp = {
       #   lang-build = lang-build;
       #   components-yarnPkg = components-yarnPackage;
       #   components-lint = components-lint;
       # };
      };

      # herc
      herculesCI.onPush = {
        lang.outputs = {
          squiggle-lang-lint = checks.${system}.lang-lint;
          squiggle-lang-test = checks.${system}.lang-test;
          squiggle-lang-build = lang-build;
          squiggle-lang-bundle = packages.${system}.lang-bundle;
        };
        components.outputs = {
          squiggle-components = packages.${system}.components;
          squiggle-components-lint = checks.${system}.components-lint;
        };
        docs-site.outputs = {
          squiggle-website = packages.${system}.docs-site;
          docusaurus-lint = checks.${system}.docusaurus-lint;
        };
      };
    };
}
