{
  description = "Squiggle CI";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils,  ... }: utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [  ];
      };

      packageNameBase = "squiggle";

      # set the node version here
      nodejs = pkgs.nodejs-16_x;

    in rec {

      herculesCI = { ... }: {
        onPush."${packageNameBase}-lang" = let

            # base mkYarnPackage config
            lang = pkgs.mkYarnPackage rec {
              name = "${packageNameBase}-lang";
              buildInputs = [
                nodejs pkgs.ninja
              ];
              src = self;
              packageJSON = ./packages/squiggle-lang/package.json;
              yarnLock = ./yarn.lock;

              # this runs after the packages are installed
              pkgConfig.postInstall = "yarn build && yarn bundle";

              # for testing
              yarnFlags = [
                "--offline"
                "--frozen-lockfile"
                "--ignore-engines"
                "--ignore-scripts"
                "--verbose"
              ];
            };

          # mkYarnPackage puts teh compelted files in a really nestled directory
          in pkgs.stdenv.mkDerivation {
            name = "${packageNameBase}-lang";
            src = lang;
            installPhase = ''
              mkdir -p $out
              cp -R $src/libexec/${packageNameBase}-lang/deps/${packageNameBase}-lang/. $out
              rm $out/bin/node_modules
              cp -R $src/libexec/${packageNameBase}-lang/node_modules/. $out/node_modules
            '';
          };

        onPush."${packageNameBase}-components" = let

            # base mkYarnPackage config
            components = pkgs.mkYarnPackage rec {
              name = "${packageNameBase}-components";
              buildInputs = [
                nodejs pkgs.ninja
              ];
              src = self;
              packageJSON = ./packages/components/package.json;
              yarnLock = ./yarn.lock;

              # this runs after the packages are installed
              pkgConfig.postInstall = "yarn all";

              # for testing
              yarnFlags = [
                "--offline"
                "--frozen-lockfile"
                "--ignore-engines"
                "--ignore-scripts"
                "--verbose"
              ];
            };

          # mkYarnPackage puts teh compelted files in a really nestled directory
          in pkgs.stdenv.mkDerivation {
            name = "${packageNameBase}-components";
            src = components;
            installPhase = ''
              mkdir -p $out
              cp -R $src/libexec/${packageNameBase}-components/deps/${packageNameBase}-components/. $out
              rm $out/bin/node_modules
              cp -R $src/libexec/${packageNameBase}-components/node_modules/. $out/node_modules
            '';
          };

        onPush."${packageNameBase}-website" = let

            # base mkYarnPackage config
            website = pkgs.mkYarnPackage rec {
              name = "${packageNameBase}-website";
              buildInputs = [
                nodejs pkgs.ninja
              ];
              src = self;
              packageJSON = ./packages/website/package.json;
              yarnLock = ./yarn.lock;

              # this runs after the packages are installed
              pkgConfig.postInstall = "yarn build";

              # for testing
              yarnFlags = [
                "--offline"
                "--frozen-lockfile"
                "--ignore-engines"
                "--ignore-scripts"
                "--verbose"
              ];
            };

          # mkYarnPackage puts teh compelted files in a really nestled directory
          in pkgs.stdenv.mkDerivation {
            name = "${packageNameBase}-website";
            src = website;
            installPhase = ''
              mkdir -p $out
              cp -R $src/libexec/${packageNameBase}-website/deps/${packageNameBase}-website/. $out
              rm $out/bin/node_modules
              cp -R $src/libexec/${packageNameBase}-website/node_modules/. $out/node_modules
            '';
          };

        };
      }
    );
}
