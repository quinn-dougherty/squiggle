
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
        buildInputs = with pkgs; [ yarn patchelf ];
        buildPhase = ''
          ln -s ${nodeDependencies}/lib/node_modules ./node_modules
          export PATH="${nodeDependencies}/bin:$PATH"

          # Long story
          drvNamePart="squiggle-lang"
          theLd=$(patchelf --print-interpreter $(which mkdir))
          patchelf --set-interpreter $theLd ./node_modules/gentype/gentype.exe
          patchelf --set-interpreter $theLd ./node_modules/rescript/linux/*.exe
          patchelf --set-interpreter $theLd ./node_modules/bisect_ppx/ppx
          patchelf --set-interpreter $theLd ./node_modules/bisect_ppx/bisect-ppx-report
          # theSo=$(find /nix/store/*$drvNamePart*/lib64 -name libstdc++.so.6 | grep $drvNamePart | head -n 1)
          # patchelf --replace-needed libstdc++.so.6 $theSo ./node_modules/rescript/linux/ninja.exe

          yarn --offline build
          yarn --offline bundle
        '';
        installPhase = ''
          # mkdir -p $out
          # cp -r dist $out/
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
            # mkdir -p $out
            # cp -r dist $out/
            # cp -r public $out/
            echo "'installing' components"
          '';
        };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
