{
  description = "Squiggle CI";
  # Derived from https://gitlab.com/Silvers_Gw2/Stats_Frontend/-/blob/cc5d783abd54e95363410592c390ca6925462262/flake.nix

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
    flake-compat-ci.url = "github:hercules-ci/flake-compat-ci";
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, utils, flake-compat-ci, flake-compat, ... }:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [  ];
      };

      # set the node version here
      nodejs = pkgs.nodejs-16_x;

    in rec {

      herculesCI = { ... }: {
        onPush = {
          squiggle-lang = let

            # base mkYarnPackage config
            lang = pkgs.mkYarnPackage {
              name = "squiggle-lang";
              buildInputs = [
                nodejs pkgs.ninja
              ];
              src = ./.;
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
            name = "squiggle-lang";
            src = lang;
            installPhase = ''
              mkdir -p $out
              cp -R $src/libexec/squiggle-lang/deps/squiggle-lang/. $out
              rm $out/bin/node_modules
              cp -R $src/libexec/squiggle-lang/node_modules/. $out/node_modules
              cp -r $src/libexec/squiggle-lang/dist $out/dist
            '';
          };

          squiggle-components = pkgs.recurseIntoAttrs (let

            # base mkYarnPackage config
            components = pkgs.mkYarnPackage {
              name = "squiggle-components";
              buildInputs = [
                nodejs
              ];
              src = ./.;
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

          # mkYarnPackage puts the completed files in a really nestled directory
          in pkgs.stdenv.mkDerivation {
            name = "squiggle-components";
            src = components;
            buildPhase = "yarn all";
            installPhase = ''
              mkdir -p $out
              cp -R $src/libexec/squiggle-components/deps/squiggle-components/. $out
              rm $out/bin/node_modules
              cp -R $src/libexec/squiggle-components/node_modules/. $out/node_modules
            '';
          });

          squiggle-website = pkgs.recurseIntoAttrs (let
            # base mkYarnPackage config
            website = pkgs.mkYarnPackage {
              name = "squiggle-website";
              buildInputs = [
                nodejs
              ];
              src = ./.;
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
            name = "squiggle-website";
            src = website;
            installPhase = ''
              mkdir -p $out
              cp -R $ src/libexec/squiggle-website/deps/squiggle-website/. $out
              rm $out/bin/node_modules
              cp -R $src/libexec/squiggle-website/node_modules/. $out/node_modules
            '';
          });
        };
      };
      defaultPackage = herculesCI.onPush.squiggle-website;
      ciNix = flake-compat-ci.lib.recurseIntoFlakeWith {
        flake = self;

        # Optional. Systems for which to perform CI.
        # By default, every system attr in the flake will be built.
        # Example: [ "x86_64-darwin" "aarch64-linux" ];
        systems = [ "x86_64-linux" ];
      };
    };
}
