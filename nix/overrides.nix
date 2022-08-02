{pkgs ? import <nixpkgs> {
    inherit system;
}, system ? builtins.currentSystem}:

let
  nodeDependencies = (import ./squiggle-lang/compositionLang.nix {
    inherit pkgs system;
  }).nodeDependencies;
in
nodeDependencies // {
  rescript = nodeDependencies.rescript.override {
    buildInputs = [ pkgs.ninja ];
    dontNpmInstall = true;
  };
}
