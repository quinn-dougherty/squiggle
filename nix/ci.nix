
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
    lang = pkgs.stdenv.mkDerivation {
      name = "squiggle-lang";
      src = ./../packages/squiggle-lang;
      buildInputs = squiggleLang.nodeDependencies + [ pkgs.yarn ];
      buildPhase = ''
        yarn build
        yarn bundle
      '';
      installPhase = ''
        mkdir -p $out
        cp -r dist $out
        '';

    };
    components = pkgs.stdenv.mkDerivation {
      name = "squiggle-components";
      src = ./../packages/components;
      buildInputs = squiggleComponents.nodeDependencies + [ pkgs.yarn ];
      buildPhase = ''
        yarn all
      '';
      installPhase = ''
        mkdir -p $out
        cp -r dist $out
        cp -r public $out
      '';
    };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
