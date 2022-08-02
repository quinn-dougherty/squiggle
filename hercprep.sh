#! /usr/bin/env nix-shell
#! nix-shell -i bash -p node2nix

set -e 
set -x 

mkdir -p nix
mkdir -p nix/squiggle-lang
mkdir -p nix/components
mkdir -p nix/website 

node2nix --development --composition squiggleMonorepo.nix --pkg-name nodejs && mv *.nix nix/
cd packages/squiggle-lang && node2nix --development --composition squiggleLang.nix --pkg-name nodejs && mv *.nix ../../nix/squiggle-lang
cd ../components && node2nix --development --composition squiggleComponents.nix --pkg-name nodejs && mv *.nix ../../nix/components
cd ../website && node2nix --development --composition squiggleWebsite.nix --pkg-name nodejs && mv *.nix ../../nix/website
