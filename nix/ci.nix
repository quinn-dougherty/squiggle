
builtins.mapAttrs (k: _v:
  let
    url = "https://github.com/NixOS/nixpkgs/archive/2255f292063ccbe184ff8f9b35ce475c04d5ae69.tar.gz";
    pkgs = import (builtins.fetchTarball url) { system = k; };
    squiggleMonorepo = import ./compositionMonorepo.nix { inherit pkgs; };
    squiggleLang = import ./squiggle-lang/compositionLang.nix { inherit pkgs; };
    squiggleComponents = import ./components/compositionComponents.nix { inherit pkgs; };
    squiggleWebsite = import ./website/compositionWebsite.nix { inherit pkgs; };
    squiggleVscodeext = import ./vscode-ext/compositionVscodeext.nix { inherit pkgs; };
  in
  pkgs.recurseIntoAttrs {
    lint = let nodeDependencies = squiggleMonorepo.nodeDependencies;
      in pkgs.stdenv.mkDerivation {
        name = "squiggle-linting";
        src = ./..;
        buildInputs = [ pkgs.yarn ];
        buildPhase = ''
          mkdir -p ./node_modules
          ln -s ${nodeDependencies}/lib/node_modules ./node_modules
          export PATH="${nodeDependencies}/bin:$PATH"

          yarn --offline lint:all
        '';
        installPhase = "echo 'lint passed!'";
      };
    lang = let nodeDependencies = squiggleLang.nodeDependencies;
      in pkgs.stdenv.mkDerivation {
        name = "squiggle-lang";
        src = ./../packages/squiggle-lang;
        buildInputs = with pkgs; [ yarn patchelf python38 ninja ];
        buildPhase = ''
          mkdir -p ./node_modules
          ln -s ${nodeDependencies}/lib/node_modules ./node_modules
          export PATH="${nodeDependencies}/bin:$PATH"

#         # Long story
#         theLd=$(patchelf --print-interpreter $(which mkdir))
#         patchelf --set-interpreter $theLd ./node_modules/gentype/gentype.exe
#         patchelf --set-interpreter $theLd ./node_modules/rescript/linux/*.exe
#         patchelf --set-interpreter $theLd ./node_modules/bisect_ppx/ppx
#         patchelf --set-interpreter $theLd ./node_modules/bisect_ppx/bisect-ppx-report
#         theSo=$(find /nix/store/*/lib64 -name libstdc++.so.6 | head -n 1)
#         patchelf --replace-needed libstdc++.so.6 $theSo ./node_modules/rescript/linux/ninja.exe

          yarn --offline build
          yarn --offline bundle
        '';
        installPhase = ''
          mkdir -p $out
          cp -r dist $out/
        '';
    };
    components = let nodeDependencies = squiggleComponents.nodeDependencies;
        in pkgs.stdenv.mkDerivation {
          name = "squiggle-components";
          src = ./../packages/components;
          buildInputs = [ pkgs.yarn ];
          buildPhase = ''
            mkdir -p ./node_modules
            ln -s ${nodeDependencies}/lib/node_modules ./node_modules
            export PATH="${nodeDependencies}/bin:$PATH"

            yarn --offline bundle
            yarn --offline build
          '';
          installPhase = ''
            mkdir -p $out
            cp -r dist $out/
            cp -r public $out/
          '';
        };
    website = let nodeDependencies = squiggleWebsite.nodeDependencies;
        in pkgs.stdenv.mkDerivation {
          name = "squiggle-website";
          src = ./../packages/website;
          buildInputs = [ pkgs.yarn ];
          buildPhase = ''
            mkdir -p ./node_modules
            ln -s ${nodeDependencies}/lib/node_modules ./node_modules
            export PATH="${nodeDependencies}/bin:$PATH"

            yarn --offline build
          '';
          installPhase = ''
            mkdir -p $out
            cp -r build $out/
          '';
        };
    vscode-ext = let nodeDependencies = squiggleVscodeext.nodeDependencies;
        in pkgs.stdenv.mkDerivation {
          name = "squiggle-vscode";
          src = ./../packages/vscode-ext;
          buildInputs = [ pkgs.yarn ];
          buildPhase = ''
            mkdir -p ./node_modules
            ln -s ${nodeDependencies}/lib/node_modules ./node_modules
            export PATH="${nodeDependencies}/bin:$PATH"

            yarn --offline compile
          '';
          installPhase = ''
            mkdir -p $out
            cp -r media/vendor $out/
          '';
        };
  }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
}
