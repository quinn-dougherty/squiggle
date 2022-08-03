{
  description = "Squiggle CI";
  # Derived from https://gitlab.com/Silvers_Gw2/Stats_Frontend/-/blob/cc5d783abd54e95363410592c390ca6925462262/flake.nix

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hercules-ci-effects.url = "github:hercules-ci/hercules-ci-effects";
  };

  outputs = { self, nixpkgs, hercules-ci-effects, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        system = system;
        overlays = [ hercules-ci-effects.overlay ];
      };

      # set the node version here
      nodejs = pkgs.nodejs-16_x;
      commonBuildInputs = [ nodejs pkgs.yarn ];
      commonYarnFlags = [
                "--offline"
                "--frozen-lockfile"
                "--verbose"
                "--production=false"
      ];

      squiggle-lang-yarnPackage = pkgs.mkYarnPackage {
              name = "squiggle-lang_source";
              buildInputs = commonBuildInputs;
              # extraNativeBuildInputs = [ pkgs.which ];
              src = ./packages/squiggle-lang;
              packageJSON = ./packages/squiggle-lang/package.json;
              yarnLock = ./yarn.lock;
              yarnFlags = commonYarnFlags;
      };
      squiggle-lang-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-lang-lint";
        src = squiggle-lang-yarnPackage + "/libexec/@quri/squiggle-lang/deps/@quri/squiggle-lang";
        buildInputs = commonBuildInputs;
        # Can only do prettier because `.lint.sh` script for rescript doesn't work,
        # see https://stackoverflow.com/questions/18018359/all-newlines-are-removed-when-saving-cat-output-into-a-variable
        buildPhase = "yarn lint:prettier";
        installPhase = "mkdir -p $out";
      };
      squiggle-lang = pkgs.stdenv.mkDerivation {
            name = "squiggle-lang";
            src = squiggle-lang-yarnPackage + "/libexec/@quri/squiggle-lang/";
            buildInputs = commonBuildInputs; # ++ [ pkgs.patchelf pkgs.which ];
            # `peggy` is in the `node_modules` that's adjacent to `deps`.
            buildPhase = ''
              cd deps/@quri/squiggle-lang
              mkdir -p homeless_shelter/.yarn
              yarn pack
            '';
            installPhase = ''
              mkdir -p $out
              cp -r $src/libexec/@quri/squiggle-lang/deps/@quri/squiggle-lang/dist $out/dist
              cp -r $src/libexec/@quri/squiggle-lang/node_modules/ $out/node_modules
            '';
            # passthru to spoof that this is still a yarn package even tho it's a subsequent derivation
            workspaceDependencies = [];
            pname = "@quri/squiggle-lang";
            packageJSON = ./package.json;
      };

      squiggle-components-yarnPackage = pkgs.mkYarnPackage {
        name = "squiggle-components_source";
        buildInputs = commonBuildInputs;
        src = ./packages/components;
        packageJSON = ./packages/components/package.json;
        yarnLock = ./yarn.lock;
        workspaceDependencies = [ squiggle-lang ];
        yarnPreBuild = ''
          mkdir -p $src/node_modules/@quri/squiggle-lang
          cp -r ${squiggle-lang}/dist $src/node_modules/@quri/squiggle-lang
        '';

        yarnFlags = commonYarnFlags;
      };
      squiggle-components-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-components-lint";
        src = squiggle-components-yarnPackage + "/libexec/@quri/squiggle-components/deps/@quri/squiggle-components";
        buildPhase = "yarn lint";
        installPhase = "mkdir -p $out";
      };
      squiggle-components = pkgs.stdenv.mkDerivation {
            name = "squiggle-components";
            src = squiggle-components-yarnPackage + "/libexec/@quri/squiggle-components/"; # deps/@quri/squiggle-components";
            buildInputs = commonBuildInputs;
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

              # for testing
              yarnFlags = commonYarnFlags;
      };
      squiggle-website-lint = pkgs.stdenv.mkDerivation {
        name = "squiggle-website-lint";
        buildInputs = commonBuildInputs;
        src = squiggle-website-yarnPackage + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn lint";
        installPhase = "mkdir -p $out";
      };
      squiggle-website = pkgs.stdenv.mkDerivation {
        name = "squiggle-website";
        buildInputs = commonBuildInputs;
        src = squiggle-website-yarnPackage + "/libexec/squiggle-website/deps/squiggle-website";
        buildPhase = "yarn build";
        installPhase = ''
              mkdir -p $out
              cp -R $ src/libexec/squiggle-website/deps/squiggle-website/build $out
              rm $out/bin/node_modules
              cp -R $src/libexec/squiggle-website/node_modules/. $out/node_modules
        '';
      };
    in rec {


      herculesCI.onPush = {
          squiggle-lang.outputs = {
            squiggle-lang = squiggle-lang;
            squiggle-lang-lint = squiggle-lang-lint;
          };
          squiggle-components = {
            outputs = {
              squiggle-components = squiggle-components;
              squiggle-components-lint = squiggle-components-lint;
            };
            extraInputs.lang-package = "";
          };

          squiggle-website = {
            outputs = {
              squiggle-website = squiggle-website;
              squiggle-website-lint = squiggle-website-lint;
            };
            extraInputs.components-package = "";
          };
      };
      defaultPackage."${system}" = herculesCI.onPush.squiggle-components.outputs.squiggle-components-lint;

      };
}
