
builtins.mapAttrs (k: _v:
  let
    url = "https://github.com/NixOS/nixpkgs/archive/2255f292063ccbe184ff8f9b35ce475c04d5ae69.tar.gz";
    pkgs = import (builtins.fetchTarball url) { system = k; };
    squiggleMonorepo = import ./default.nix { inherit pkgs; }; 
  in
  pkgs.recurseIntoAttrs {
    sources = squiggleMonorepo.sources;  
    nodeDependencies = squiggleMonorepo.nodeDependencies;
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
