
builtins.mapAttrs (k: _v:
  let
    url = "https://github.com/NixOS/nixpkgs/archive/2255f292063ccbe184ff8f9b35ce475c04d5ae69.tar.gz";
    pkgs = import (builtins.fetchTarball url) { system = k; };
    squiggleMonorepo = import ./squiggleMonorepo.nix { inherit pkgs; }; 
    squiggleLang = import ./squiggle-lang/squiggleLang.nix { inherit pkgs; }; 
    squiggleComponents = import ./components/squiggleComponents.nix { inherit pkgs; }; 
    squiggleWebsite = import ./website/squiggleWebsite.nix { inherit pkgs; }; 
  in
  pkgs.recurseIntoAttrs {
    lang = let nodeDependencies = squiggleLang.nodeDependencies;
      in pkgs.stdenv.mkDerivation {
        name = "squiggle-lang";
        src = ./../packages/squiggle-lang;
        buildInputs = [ pkgs.yarn ];
        buildPhase = ''
          ln -s ${nodeDependencies}/lib/node_modules ./node_modules
          export PATH="${nodeDependencies}/bin:$PATH"

          yarn --offline build
          yarn --offline bundle
        '';
        installPhase = ''
          echo "'installing' lang"
        '';
    };
    components = let nodeDependencies = squiggleComponents.nodeDependencies;
        in pkgs.stdenv.mkDerivation {
          name = "squiggle-components";
          src = ./../packages/components;
          buildInputs = [ pkgs.yarn ];
          buildPhase = ''
            ln -s ${nodeDependencies}/lib/node_modules ./node_modules
            export PATH="${nodeDependencies}/bin:$PATH"

            yarn --offline bundle
            yarn --offline build
          '';
          installPhase = ''
            echo "'installing' components"
          '';
        };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
