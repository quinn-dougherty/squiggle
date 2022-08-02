#! /usr/bin/env nix-shell
#! nix-shell -i bash -p node2nix

set -e 
set -x 

rm nix/*/*
mkdir -p nix/squiggle-lang
mkdir -p nix/components
mkdir -p nix/website
mkdir -p nix/vscode-ext
mkdir -p nix/cli

node2nix \
    --development \
    -i package.json \
    -o nix/node-packages.nix \
    -e nix/node-env.nix \
    -c nix/compositionMonorepo.nix \
    --pkg-name nodejs
node2nix \
    --development \
    -i packages/squiggle-lang/package.json \
    -o nix/squiggle-lang/node-packages.nix \
    -e nix/squiggle-lang/node-env.nix \
    -c nix/squiggle-lang/compositionLang.nix \
    --pkg-name nodejs
node2nix \
    --development \
    -i packages/components/package.json \
    -o nix/components/node-packages.nix \
    -e nix/components/node-env.nix \
    -c nix/components/compositionComponents.nix \
    --pkg-name nodejs
node2nix \
    --development \
    -i packages/website/package.json \
    -o nix/website/node-packages.nix \
    -e nix/website/node-env.nix \
    -c nix/website/compositionWebsite.nix \
    --pkg-name nodejs
node2nix \
    --development \
    -i packages/vscode-ext/package.json \
    -o nix/vscode-ext/node-packages.nix \
    -e nix/vscode-ext/node-env.nix \
    -c nix/vscode-ext/compositionVscodeext.nix \
    --pkg-name nodejs
node2nix \
    --development \
    -i packages/cli/package.json \
    -o nix/cli/node-packages.nix \
    -e nix/cli/node-env.nix \
    -c nix/cli/compositionCli.nix \
    --pkg-name nodejs
