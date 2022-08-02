#! /usr/bin/env nix-shell
#! nix-shell -i bash -p node2nix

set -e 
set -x 

mkdir -p nix
mkdir -p nix/squiggle-lang
mkdir -p nix/components
mkdir -p nix/website 

node2nix --composition squiggleMonorepo.nix && mv *.nix nix/ 
cd packages/squiggle-lang && node2nix --composition squiggleLang.nix && mv *.nix ../../nix/squiggle-lang
cd ../components && node2nix --composition squiggleComponents.nix && mv *.nix ../../nix/components
cd ../website && node2nix --composition squiggleWebsite.nix && mv *.nix ../../nix/website


