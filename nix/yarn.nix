{ fetchurl, fetchgit }:
  self:
    super:
      let
        registries = {
          yarn = n:
            v:
              "https://registry.yarnpkg.com/${n}/-/${n}-${v}.tgz";
          npm = n:
            v:
              "https://registry.npmjs.org/${n}/-/${n}-${v}.tgz";
          };
        nodeFilePackage = key:
          version:
            registry:
              sha1:
                deps:
                  super._buildNodePackage {
                    inherit key version;
                    src = fetchurl {
                      url = registry key version;
                      inherit sha1;
                      };
                    nodeBuildInputs = deps;
                    };
        nodeFileLocalPackage = key:
          version:
            path:
              sha1:
                deps:
                  super._buildNodePackage {
                    inherit key version;
                    src = builtins.path { inherit path; };
                    nodeBuildInputs = deps;
                    };
        nodeGitPackage = key:
          version:
            url:
              rev:
                sha256:
                  deps:
                    super._buildNodePackage {
                      inherit key version;
                      src = fetchgit { inherit url rev sha256; };
                      nodeBuildInputs = deps;
                      };
        identityRegistry = url:
          _:
            _:
              url;
        scopedName = scope:
          name:
            { inherit scope name; };
        ir = identityRegistry;
        l = nodeFileLocalPackage;
        f = nodeFilePackage;
        g = nodeGitPackage;
        n = registries.npm;
        y = registries.yarn;
        sc = scopedName;
        s = self;
      in {
        "@algolia/autocomplete-core@1.7.1" = f (sc "algolia" "autocomplete-core") "1.7.1" (ir "https://registry.yarnpkg.com/@algolia/autocomplete-core/-/autocomplete-core-1.7.1.tgz") "025538b8a9564a9f3dd5bcf8a236d6951c76c7d1" [
          (s."@algolia/autocomplete-shared@1.7.1")
          ];
        "@algolia/autocomplete-preset-algolia@1.7.1" = f (sc "algolia" "autocomplete-preset-algolia") "1.7.1" (ir "https://registry.yarnpkg.com/@algolia/autocomplete-preset-algolia/-/autocomplete-preset-algolia-1.7.1.tgz") "7dadc5607097766478014ae2e9e1c9c4b3f957c8" [
          (s."@algolia/autocomplete-shared@1.7.1")
          ];
        "@algolia/autocomplete-shared@1.7.1" = f (sc "algolia" "autocomplete-shared") "1.7.1" (ir "https://registry.yarnpkg.com/@algolia/autocomplete-shared/-/autocomplete-shared-1.7.1.tgz") "95c3a0b4b78858fed730cf9c755b7d1cd0c82c74" [];
        "@algolia/cache-browser-local-storage@4.13.1" = f (sc "algolia" "cache-browser-local-storage") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/cache-browser-local-storage/-/cache-browser-local-storage-4.13.1.tgz") "ffacb9230119f77de1a6f163b83680be999110e4" [
          (s."@algolia/cache-common@4.13.1")
          ];
        "@algolia/cache-common@4.13.1" = f (sc "algolia" "cache-common") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/cache-common/-/cache-common-4.13.1.tgz") "c933fdec9f73b4f7c69d5751edc92eee4a63d76b" [];
        "@algolia/cache-in-memory@4.13.1" = f (sc "algolia" "cache-in-memory") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/cache-in-memory/-/cache-in-memory-4.13.1.tgz") "c19baa67b4597e1a93e987350613ab3b88768832" [
          (s."@algolia/cache-common@4.13.1")
          ];
        "@algolia/client-account@4.13.1" = f (sc "algolia" "client-account") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/client-account/-/client-account-4.13.1.tgz") "fea591943665477a23922ab31863ad0732e26c66" [
          (s."@algolia/client-common@4.13.1")
          (s."@algolia/client-search@4.13.1")
          (s."@algolia/transporter@4.13.1")
          ];
        "@algolia/client-analytics@4.13.1" = f (sc "algolia" "client-analytics") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/client-analytics/-/client-analytics-4.13.1.tgz") "5275956b2d0d16997148f2085f1701b6c39ecc32" [
          (s."@algolia/client-common@4.13.1")
          (s."@algolia/client-search@4.13.1")
          (s."@algolia/requester-common@4.13.1")
          (s."@algolia/transporter@4.13.1")
          ];
        "@algolia/client-common@4.13.1" = f (sc "algolia" "client-common") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/client-common/-/client-common-4.13.1.tgz") "3bf9e3586f20ef85bbb56ccca390f7dbe57c8f4f" [
          (s."@algolia/requester-common@4.13.1")
          (s."@algolia/transporter@4.13.1")
          ];
        "@algolia/client-personalization@4.13.1" = f (sc "algolia" "client-personalization") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/client-personalization/-/client-personalization-4.13.1.tgz") "438a1f58576ef19c4ad4addb8417bdacfe2fce2e" [
          (s."@algolia/client-common@4.13.1")
          (s."@algolia/requester-common@4.13.1")
          (s."@algolia/transporter@4.13.1")
          ];
        "@algolia/client-search@4.13.1" = f (sc "algolia" "client-search") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/client-search/-/client-search-4.13.1.tgz") "5501deed01e23c33d4aaa9f9eb96a849f0fce313" [
          (s."@algolia/client-common@4.13.1")
          (s."@algolia/requester-common@4.13.1")
          (s."@algolia/transporter@4.13.1")
          ];
        "@algolia/events@4.0.1" = f (sc "algolia" "events") "4.0.1" (ir "https://registry.yarnpkg.com/@algolia/events/-/events-4.0.1.tgz") "fd39e7477e7bc703d7f893b556f676c032af3950" [];
        "@algolia/events@^4.0.1" = s."@algolia/events@4.0.1";
        "@algolia/logger-common@4.13.1" = f (sc "algolia" "logger-common") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/logger-common/-/logger-common-4.13.1.tgz") "4221378e701e3f1eacaa051bcd4ba1f25ddfaf4d" [];
        "@algolia/logger-console@4.13.1" = f (sc "algolia" "logger-console") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/logger-console/-/logger-console-4.13.1.tgz") "423d358e4992dd4bceab0d9a4e99d1fd68107043" [
          (s."@algolia/logger-common@4.13.1")
          ];
        "@algolia/requester-browser-xhr@4.13.1" = f (sc "algolia" "requester-browser-xhr") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/requester-browser-xhr/-/requester-browser-xhr-4.13.1.tgz") "f8ea79233cf6f0392feaf31e35a6b40d68c5bc9e" [
          (s."@algolia/requester-common@4.13.1")
          ];
        "@algolia/requester-common@4.13.1" = f (sc "algolia" "requester-common") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/requester-common/-/requester-common-4.13.1.tgz") "daea143d15ab6ed3909c4c45877f1b6c36a16179" [];
        "@algolia/requester-node-http@4.13.1" = f (sc "algolia" "requester-node-http") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/requester-node-http/-/requester-node-http-4.13.1.tgz") "32c63d4c009f22d97e396406de7af9b66fb8e89d" [
          (s."@algolia/requester-common@4.13.1")
          ];
        "@algolia/transporter@4.13.1" = f (sc "algolia" "transporter") "4.13.1" (ir "https://registry.yarnpkg.com/@algolia/transporter/-/transporter-4.13.1.tgz") "509e03e9145102843d5be4a031c521f692d4e8d6" [
          (s."@algolia/cache-common@4.13.1")
          (s."@algolia/logger-common@4.13.1")
          (s."@algolia/requester-common@4.13.1")
          ];
        "@ampproject/remapping@2.2.0" = f (sc "ampproject" "remapping") "2.2.0" (ir "https://registry.yarnpkg.com/@ampproject/remapping/-/remapping-2.2.0.tgz") "56c133824780de3174aed5ab6834f3026790154d" [
          (s."@jridgewell/gen-mapping@^0.1.0")
          (s."@jridgewell/trace-mapping@^0.3.9")
          ];
        "@ampproject/remapping@^2.1.0" = s."@ampproject/remapping@2.2.0";
        "@apideck/better-ajv-errors@0.3.4" = f (sc "apideck" "better-ajv-errors") "0.3.4" (ir "https://registry.yarnpkg.com/@apideck/better-ajv-errors/-/better-ajv-errors-0.3.4.tgz") "f89924dd4efd04a51835db7eb549a7177e0ca727" [
          (s."json-schema@^0.4.0")
          (s."jsonpointer@^5.0.0")
          (s."leven@^3.1.0")
          ];
        "@apideck/better-ajv-errors@^0.3.1" = s."@apideck/better-ajv-errors@0.3.4";
        "@babel/code-frame@7.16.7" = f (sc "babel" "code-frame") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.16.7.tgz") "44416b6bd7624b998f5b1af5d470856c40138789" [
          (s."@babel/highlight@^7.16.7")
          ];
        "@babel/code-frame@7.18.6" = f (sc "babel" "code-frame") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/code-frame/-/code-frame-7.18.6.tgz") "3b25d38c89600baa2dcc219edfa88a74eb2c427a" [
          (s."@babel/highlight@^7.18.6")
          ];
        "@babel/code-frame@^7.0.0" = s."@babel/code-frame@7.16.7";
        "@babel/code-frame@^7.10.4" = s."@babel/code-frame@7.16.7";
        "@babel/code-frame@^7.12.13" = s."@babel/code-frame@7.16.7";
        "@babel/code-frame@^7.16.0" = s."@babel/code-frame@7.16.7";
        "@babel/code-frame@^7.16.7" = s."@babel/code-frame@7.16.7";
        "@babel/code-frame@^7.18.6" = s."@babel/code-frame@7.18.6";
        "@babel/code-frame@^7.5.5" = s."@babel/code-frame@7.16.7";
        "@babel/code-frame@^7.8.3" = s."@babel/code-frame@7.16.7";
        "@babel/compat-data@7.18.5" = f (sc "babel" "compat-data") "7.18.5" (ir "https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.18.5.tgz") "acac0c839e317038c73137fbb6ef71a1d6238471" [];
        "@babel/compat-data@7.18.8" = f (sc "babel" "compat-data") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/compat-data/-/compat-data-7.18.8.tgz") "2483f565faca607b8535590e84e7de323f27764d" [];
        "@babel/compat-data@^7.13.11" = s."@babel/compat-data@7.18.5";
        "@babel/compat-data@^7.17.10" = s."@babel/compat-data@7.18.5";
        "@babel/compat-data@^7.18.6" = s."@babel/compat-data@7.18.8";
        "@babel/core@7.12.9" = f (sc "babel" "core") "7.12.9" (ir "https://registry.yarnpkg.com/@babel/core/-/core-7.12.9.tgz") "fd450c4ec10cdbb980e2928b7aa7a28484593fc8" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/generator@^7.12.5")
          (s."@babel/helper-module-transforms@^7.12.1")
          (s."@babel/helpers@^7.12.5")
          (s."@babel/parser@^7.12.7")
          (s."@babel/template@^7.12.7")
          (s."@babel/traverse@^7.12.9")
          (s."@babel/types@^7.12.7")
          (s."convert-source-map@^1.7.0")
          (s."debug@^4.1.0")
          (s."gensync@^1.0.0-beta.1")
          (s."json5@^2.1.2")
          (s."lodash@^4.17.19")
          (s."resolve@^1.3.2")
          (s."semver@^5.4.1")
          (s."source-map@^0.5.0")
          ];
        "@babel/core@7.18.6" = f (sc "babel" "core") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/core/-/core-7.18.6.tgz") "54a107a3c298aee3fe5e1947a6464b9b6faca03d" [
          (s."@ampproject/remapping@^2.1.0")
          (s."@babel/code-frame@^7.18.6")
          (s."@babel/generator@^7.18.6")
          (s."@babel/helper-compilation-targets@^7.18.6")
          (s."@babel/helper-module-transforms@^7.18.6")
          (s."@babel/helpers@^7.18.6")
          (s."@babel/parser@^7.18.6")
          (s."@babel/template@^7.18.6")
          (s."@babel/traverse@^7.18.6")
          (s."@babel/types@^7.18.6")
          (s."convert-source-map@^1.7.0")
          (s."debug@^4.1.0")
          (s."gensync@^1.0.0-beta.2")
          (s."json5@^2.2.1")
          (s."semver@^6.3.0")
          ];
        "@babel/core@^7.1.0" = s."@babel/core@7.18.6";
        "@babel/core@^7.11.1" = s."@babel/core@7.18.6";
        "@babel/core@^7.12.10" = s."@babel/core@7.18.6";
        "@babel/core@^7.12.3" = s."@babel/core@7.18.6";
        "@babel/core@^7.15.5" = s."@babel/core@7.18.6";
        "@babel/core@^7.16.0" = s."@babel/core@7.18.6";
        "@babel/core@^7.18.6" = s."@babel/core@7.18.6";
        "@babel/core@^7.7.2" = s."@babel/core@7.18.6";
        "@babel/core@^7.7.5" = s."@babel/core@7.18.6";
        "@babel/core@^7.8.0" = s."@babel/core@7.18.6";
        "@babel/eslint-parser@7.18.2" = f (sc "babel" "eslint-parser") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/eslint-parser/-/eslint-parser-7.18.2.tgz") "e14dee36c010edfb0153cf900c2b0815e82e3245" [
          (s."eslint-scope@^5.1.1")
          (s."eslint-visitor-keys@^2.1.0")
          (s."semver@^6.3.0")
          ];
        "@babel/eslint-parser@^7.16.3" = s."@babel/eslint-parser@7.18.2";
        "@babel/generator@7.18.7" = f (sc "babel" "generator") "7.18.7" (ir "https://registry.yarnpkg.com/@babel/generator/-/generator-7.18.7.tgz") "2aa78da3c05aadfc82dbac16c99552fc802284bd" [
          (s."@babel/types@^7.18.7")
          (s."@jridgewell/gen-mapping@^0.3.2")
          (s."jsesc@^2.5.1")
          ];
        "@babel/generator@^7.12.11" = s."@babel/generator@7.18.7";
        "@babel/generator@^7.12.5" = s."@babel/generator@7.18.7";
        "@babel/generator@^7.18.6" = s."@babel/generator@7.18.7";
        "@babel/generator@^7.18.7" = s."@babel/generator@7.18.7";
        "@babel/generator@^7.7.2" = s."@babel/generator@7.18.7";
        "@babel/helper-annotate-as-pure@7.18.6" = f (sc "babel" "helper-annotate-as-pure") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.18.6.tgz") "eaa49f6f80d5a33f9a5dd2276e6d6e451be0a6bb" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-annotate-as-pure@^7.16.7" = s."@babel/helper-annotate-as-pure@7.18.6";
        "@babel/helper-annotate-as-pure@^7.18.6" = s."@babel/helper-annotate-as-pure@7.18.6";
        "@babel/helper-builder-binary-assignment-operator-visitor@7.18.6" = f (sc "babel" "helper-builder-binary-assignment-operator-visitor") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-builder-binary-assignment-operator-visitor/-/helper-builder-binary-assignment-operator-visitor-7.18.6.tgz") "f14d640ed1ee9246fb33b8255f08353acfe70e6a" [
          (s."@babel/helper-explode-assignable-expression@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-builder-binary-assignment-operator-visitor@^7.18.6" = s."@babel/helper-builder-binary-assignment-operator-visitor@7.18.6";
        "@babel/helper-compilation-targets@7.18.2" = f (sc "babel" "helper-compilation-targets") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.18.2.tgz") "67a85a10cbd5fc7f1457fec2e7f45441dc6c754b" [
          (s."@babel/compat-data@^7.17.10")
          (s."@babel/helper-validator-option@^7.16.7")
          (s."browserslist@^4.20.2")
          (s."semver@^6.3.0")
          ];
        "@babel/helper-compilation-targets@7.18.6" = f (sc "babel" "helper-compilation-targets") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-compilation-targets/-/helper-compilation-targets-7.18.6.tgz") "18d35bfb9f83b1293c22c55b3d576c1315b6ed96" [
          (s."@babel/compat-data@^7.18.6")
          (s."@babel/helper-validator-option@^7.18.6")
          (s."browserslist@^4.20.2")
          (s."semver@^6.3.0")
          ];
        "@babel/helper-compilation-targets@^7.13.0" = s."@babel/helper-compilation-targets@7.18.2";
        "@babel/helper-compilation-targets@^7.17.10" = s."@babel/helper-compilation-targets@7.18.2";
        "@babel/helper-compilation-targets@^7.18.6" = s."@babel/helper-compilation-targets@7.18.6";
        "@babel/helper-create-class-features-plugin@7.18.6" = f (sc "babel" "helper-create-class-features-plugin") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-create-class-features-plugin/-/helper-create-class-features-plugin-7.18.6.tgz") "6f15f8459f3b523b39e00a99982e2c040871ed72" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-function-name@^7.18.6")
          (s."@babel/helper-member-expression-to-functions@^7.18.6")
          (s."@babel/helper-optimise-call-expression@^7.18.6")
          (s."@babel/helper-replace-supers@^7.18.6")
          (s."@babel/helper-split-export-declaration@^7.18.6")
          ];
        "@babel/helper-create-class-features-plugin@^7.17.12" = s."@babel/helper-create-class-features-plugin@7.18.6";
        "@babel/helper-create-class-features-plugin@^7.18.0" = s."@babel/helper-create-class-features-plugin@7.18.6";
        "@babel/helper-create-class-features-plugin@^7.18.6" = s."@babel/helper-create-class-features-plugin@7.18.6";
        "@babel/helper-create-regexp-features-plugin@7.17.12" = f (sc "babel" "helper-create-regexp-features-plugin") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.17.12.tgz") "bb37ca467f9694bbe55b884ae7a5cc1e0084e4fd" [
          (s."@babel/helper-annotate-as-pure@^7.16.7")
          (s."regexpu-core@^5.0.1")
          ];
        "@babel/helper-create-regexp-features-plugin@7.18.6" = f (sc "babel" "helper-create-regexp-features-plugin") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-create-regexp-features-plugin/-/helper-create-regexp-features-plugin-7.18.6.tgz") "3e35f4e04acbbf25f1b3534a657610a000543d3c" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."regexpu-core@^5.1.0")
          ];
        "@babel/helper-create-regexp-features-plugin@^7.16.7" = s."@babel/helper-create-regexp-features-plugin@7.17.12";
        "@babel/helper-create-regexp-features-plugin@^7.17.12" = s."@babel/helper-create-regexp-features-plugin@7.17.12";
        "@babel/helper-create-regexp-features-plugin@^7.18.6" = s."@babel/helper-create-regexp-features-plugin@7.18.6";
        "@babel/helper-define-polyfill-provider@0.1.5" = f (sc "babel" "helper-define-polyfill-provider") "0.1.5" (ir "https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.1.5.tgz") "3c2f91b7971b9fc11fe779c945c014065dea340e" [
          (s."@babel/helper-compilation-targets@^7.13.0")
          (s."@babel/helper-module-imports@^7.12.13")
          (s."@babel/helper-plugin-utils@^7.13.0")
          (s."@babel/traverse@^7.13.0")
          (s."debug@^4.1.1")
          (s."lodash.debounce@^4.0.8")
          (s."resolve@^1.14.2")
          (s."semver@^6.1.2")
          ];
        "@babel/helper-define-polyfill-provider@0.3.1" = f (sc "babel" "helper-define-polyfill-provider") "0.3.1" (ir "https://registry.yarnpkg.com/@babel/helper-define-polyfill-provider/-/helper-define-polyfill-provider-0.3.1.tgz") "52411b445bdb2e676869e5a74960d2d3826d2665" [
          (s."@babel/helper-compilation-targets@^7.13.0")
          (s."@babel/helper-module-imports@^7.12.13")
          (s."@babel/helper-plugin-utils@^7.13.0")
          (s."@babel/traverse@^7.13.0")
          (s."debug@^4.1.1")
          (s."lodash.debounce@^4.0.8")
          (s."resolve@^1.14.2")
          (s."semver@^6.1.2")
          ];
        "@babel/helper-define-polyfill-provider@^0.1.5" = s."@babel/helper-define-polyfill-provider@0.1.5";
        "@babel/helper-define-polyfill-provider@^0.3.1" = s."@babel/helper-define-polyfill-provider@0.3.1";
        "@babel/helper-environment-visitor@7.18.2" = f (sc "babel" "helper-environment-visitor") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.18.2.tgz") "8a6d2dedb53f6bf248e31b4baf38739ee4a637bd" [];
        "@babel/helper-environment-visitor@7.18.6" = f (sc "babel" "helper-environment-visitor") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-environment-visitor/-/helper-environment-visitor-7.18.6.tgz") "b7eee2b5b9d70602e59d1a6cad7dd24de7ca6cd7" [];
        "@babel/helper-environment-visitor@^7.16.7" = s."@babel/helper-environment-visitor@7.18.2";
        "@babel/helper-environment-visitor@^7.18.2" = s."@babel/helper-environment-visitor@7.18.2";
        "@babel/helper-environment-visitor@^7.18.6" = s."@babel/helper-environment-visitor@7.18.6";
        "@babel/helper-explode-assignable-expression@7.18.6" = f (sc "babel" "helper-explode-assignable-expression") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-explode-assignable-expression/-/helper-explode-assignable-expression-7.18.6.tgz") "41f8228ef0a6f1a036b8dfdfec7ce94f9a6bc096" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-explode-assignable-expression@^7.18.6" = s."@babel/helper-explode-assignable-expression@7.18.6";
        "@babel/helper-function-name@7.17.9" = f (sc "babel" "helper-function-name") "7.17.9" (ir "https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.17.9.tgz") "136fcd54bc1da82fcb47565cf16fd8e444b1ff12" [
          (s."@babel/template@^7.16.7")
          (s."@babel/types@^7.17.0")
          ];
        "@babel/helper-function-name@7.18.6" = f (sc "babel" "helper-function-name") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-function-name/-/helper-function-name-7.18.6.tgz") "8334fecb0afba66e6d87a7e8c6bb7fed79926b83" [
          (s."@babel/template@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-function-name@^7.17.9" = s."@babel/helper-function-name@7.17.9";
        "@babel/helper-function-name@^7.18.6" = s."@babel/helper-function-name@7.18.6";
        "@babel/helper-hoist-variables@7.18.6" = f (sc "babel" "helper-hoist-variables") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-hoist-variables/-/helper-hoist-variables-7.18.6.tgz") "d4d2c8fb4baeaa5c68b99cc8245c56554f926678" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-hoist-variables@^7.18.6" = s."@babel/helper-hoist-variables@7.18.6";
        "@babel/helper-member-expression-to-functions@7.17.7" = f (sc "babel" "helper-member-expression-to-functions") "7.17.7" (ir "https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.17.7.tgz") "a34013b57d8542a8c4ff8ba3f747c02452a4d8c4" [
          (s."@babel/types@^7.17.0")
          ];
        "@babel/helper-member-expression-to-functions@7.18.6" = f (sc "babel" "helper-member-expression-to-functions") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-member-expression-to-functions/-/helper-member-expression-to-functions-7.18.6.tgz") "44802d7d602c285e1692db0bad9396d007be2afc" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-member-expression-to-functions@^7.17.7" = s."@babel/helper-member-expression-to-functions@7.17.7";
        "@babel/helper-member-expression-to-functions@^7.18.6" = s."@babel/helper-member-expression-to-functions@7.18.6";
        "@babel/helper-module-imports@7.16.7" = f (sc "babel" "helper-module-imports") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.16.7.tgz") "25612a8091a999704461c8a222d0efec5d091437" [
          (s."@babel/types@^7.16.7")
          ];
        "@babel/helper-module-imports@7.18.6" = f (sc "babel" "helper-module-imports") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-module-imports/-/helper-module-imports-7.18.6.tgz") "1e3ebdbbd08aad1437b428c50204db13c5a3ca6e" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-module-imports@^7.10.4" = s."@babel/helper-module-imports@7.16.7";
        "@babel/helper-module-imports@^7.12.13" = s."@babel/helper-module-imports@7.16.7";
        "@babel/helper-module-imports@^7.16.7" = s."@babel/helper-module-imports@7.16.7";
        "@babel/helper-module-imports@^7.18.6" = s."@babel/helper-module-imports@7.18.6";
        "@babel/helper-module-transforms@7.18.0" = f (sc "babel" "helper-module-transforms") "7.18.0" (ir "https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.18.0.tgz") "baf05dec7a5875fb9235bd34ca18bad4e21221cd" [
          (s."@babel/helper-environment-visitor@^7.16.7")
          (s."@babel/helper-module-imports@^7.16.7")
          (s."@babel/helper-simple-access@^7.17.7")
          (s."@babel/helper-split-export-declaration@^7.16.7")
          (s."@babel/helper-validator-identifier@^7.16.7")
          (s."@babel/template@^7.16.7")
          (s."@babel/traverse@^7.18.0")
          (s."@babel/types@^7.18.0")
          ];
        "@babel/helper-module-transforms@7.18.8" = f (sc "babel" "helper-module-transforms") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/helper-module-transforms/-/helper-module-transforms-7.18.8.tgz") "4f8408afead0188cfa48672f9d0e5787b61778c8" [
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-module-imports@^7.18.6")
          (s."@babel/helper-simple-access@^7.18.6")
          (s."@babel/helper-split-export-declaration@^7.18.6")
          (s."@babel/helper-validator-identifier@^7.18.6")
          (s."@babel/template@^7.18.6")
          (s."@babel/traverse@^7.18.8")
          (s."@babel/types@^7.18.8")
          ];
        "@babel/helper-module-transforms@^7.12.1" = s."@babel/helper-module-transforms@7.18.0";
        "@babel/helper-module-transforms@^7.18.6" = s."@babel/helper-module-transforms@7.18.8";
        "@babel/helper-optimise-call-expression@7.16.7" = f (sc "babel" "helper-optimise-call-expression") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.16.7.tgz") "a34e3560605abbd31a18546bd2aad3e6d9a174f2" [
          (s."@babel/types@^7.16.7")
          ];
        "@babel/helper-optimise-call-expression@7.18.6" = f (sc "babel" "helper-optimise-call-expression") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-optimise-call-expression/-/helper-optimise-call-expression-7.18.6.tgz") "9369aa943ee7da47edab2cb4e838acf09d290ffe" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-optimise-call-expression@^7.16.7" = s."@babel/helper-optimise-call-expression@7.16.7";
        "@babel/helper-optimise-call-expression@^7.18.6" = s."@babel/helper-optimise-call-expression@7.18.6";
        "@babel/helper-plugin-utils@7.10.4" = f (sc "babel" "helper-plugin-utils") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.10.4.tgz") "2f75a831269d4f677de49986dff59927533cf375" [];
        "@babel/helper-plugin-utils@7.18.6" = f (sc "babel" "helper-plugin-utils") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-plugin-utils/-/helper-plugin-utils-7.18.6.tgz") "9448974dd4fb1d80fefe72e8a0af37809cd30d6d" [];
        "@babel/helper-plugin-utils@^7.0.0" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.10.4" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.12.13" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.13.0" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.14.5" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.16.7" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.17.12" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.18.6" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.8.0" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-plugin-utils@^7.8.3" = s."@babel/helper-plugin-utils@7.18.6";
        "@babel/helper-remap-async-to-generator@7.18.6" = f (sc "babel" "helper-remap-async-to-generator") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-remap-async-to-generator/-/helper-remap-async-to-generator-7.18.6.tgz") "fa1f81acd19daee9d73de297c0308783cd3cfc23" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-wrap-function@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-remap-async-to-generator@^7.18.6" = s."@babel/helper-remap-async-to-generator@7.18.6";
        "@babel/helper-replace-supers@7.18.2" = f (sc "babel" "helper-replace-supers") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.18.2.tgz") "41fdfcc9abaf900e18ba6e5931816d9062a7b2e0" [
          (s."@babel/helper-environment-visitor@^7.18.2")
          (s."@babel/helper-member-expression-to-functions@^7.17.7")
          (s."@babel/helper-optimise-call-expression@^7.16.7")
          (s."@babel/traverse@^7.18.2")
          (s."@babel/types@^7.18.2")
          ];
        "@babel/helper-replace-supers@7.18.6" = f (sc "babel" "helper-replace-supers") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-replace-supers/-/helper-replace-supers-7.18.6.tgz") "efedf51cfccea7b7b8c0f00002ab317e7abfe420" [
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-member-expression-to-functions@^7.18.6")
          (s."@babel/helper-optimise-call-expression@^7.18.6")
          (s."@babel/traverse@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-replace-supers@^7.18.2" = s."@babel/helper-replace-supers@7.18.2";
        "@babel/helper-replace-supers@^7.18.6" = s."@babel/helper-replace-supers@7.18.6";
        "@babel/helper-simple-access@7.18.2" = f (sc "babel" "helper-simple-access") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.18.2.tgz") "4dc473c2169ac3a1c9f4a51cfcd091d1c36fcff9" [
          (s."@babel/types@^7.18.2")
          ];
        "@babel/helper-simple-access@7.18.6" = f (sc "babel" "helper-simple-access") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-simple-access/-/helper-simple-access-7.18.6.tgz") "d6d8f51f4ac2978068df934b569f08f29788c7ea" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-simple-access@^7.17.7" = s."@babel/helper-simple-access@7.18.2";
        "@babel/helper-simple-access@^7.18.6" = s."@babel/helper-simple-access@7.18.6";
        "@babel/helper-skip-transparent-expression-wrappers@7.16.0" = f (sc "babel" "helper-skip-transparent-expression-wrappers") "7.16.0" (ir "https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.16.0.tgz") "0ee3388070147c3ae051e487eca3ebb0e2e8bb09" [
          (s."@babel/types@^7.16.0")
          ];
        "@babel/helper-skip-transparent-expression-wrappers@7.18.6" = f (sc "babel" "helper-skip-transparent-expression-wrappers") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-skip-transparent-expression-wrappers/-/helper-skip-transparent-expression-wrappers-7.18.6.tgz") "7dff00a5320ca4cf63270e5a0eca4b268b7380d9" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-skip-transparent-expression-wrappers@^7.16.0" = s."@babel/helper-skip-transparent-expression-wrappers@7.16.0";
        "@babel/helper-skip-transparent-expression-wrappers@^7.18.6" = s."@babel/helper-skip-transparent-expression-wrappers@7.18.6";
        "@babel/helper-split-export-declaration@7.16.7" = f (sc "babel" "helper-split-export-declaration") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.16.7.tgz") "0b648c0c42da9d3920d85ad585f2778620b8726b" [
          (s."@babel/types@^7.16.7")
          ];
        "@babel/helper-split-export-declaration@7.18.6" = f (sc "babel" "helper-split-export-declaration") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.18.6.tgz") "7367949bc75b20c6d5a5d4a97bba2824ae8ef075" [
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-split-export-declaration@^7.16.7" = s."@babel/helper-split-export-declaration@7.16.7";
        "@babel/helper-split-export-declaration@^7.18.6" = s."@babel/helper-split-export-declaration@7.18.6";
        "@babel/helper-validator-identifier@7.16.7" = f (sc "babel" "helper-validator-identifier") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.16.7.tgz") "e8c602438c4a8195751243da9031d1607d247cad" [];
        "@babel/helper-validator-identifier@7.18.6" = f (sc "babel" "helper-validator-identifier") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-validator-identifier/-/helper-validator-identifier-7.18.6.tgz") "9c97e30d31b2b8c72a1d08984f2ca9b574d7a076" [];
        "@babel/helper-validator-identifier@^7.16.7" = s."@babel/helper-validator-identifier@7.16.7";
        "@babel/helper-validator-identifier@^7.18.6" = s."@babel/helper-validator-identifier@7.18.6";
        "@babel/helper-validator-option@7.16.7" = f (sc "babel" "helper-validator-option") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.16.7.tgz") "b203ce62ce5fe153899b617c08957de860de4d23" [];
        "@babel/helper-validator-option@7.18.6" = f (sc "babel" "helper-validator-option") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-validator-option/-/helper-validator-option-7.18.6.tgz") "bf0d2b5a509b1f336099e4ff36e1a63aa5db4db8" [];
        "@babel/helper-validator-option@^7.16.7" = s."@babel/helper-validator-option@7.16.7";
        "@babel/helper-validator-option@^7.18.6" = s."@babel/helper-validator-option@7.18.6";
        "@babel/helper-wrap-function@7.18.6" = f (sc "babel" "helper-wrap-function") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helper-wrap-function/-/helper-wrap-function-7.18.6.tgz") "ec44ea4ad9d8988b90c3e465ba2382f4de81a073" [
          (s."@babel/helper-function-name@^7.18.6")
          (s."@babel/template@^7.18.6")
          (s."@babel/traverse@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helper-wrap-function@^7.18.6" = s."@babel/helper-wrap-function@7.18.6";
        "@babel/helpers@7.18.2" = f (sc "babel" "helpers") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.18.2.tgz") "970d74f0deadc3f5a938bfa250738eb4ac889384" [
          (s."@babel/template@^7.16.7")
          (s."@babel/traverse@^7.18.2")
          (s."@babel/types@^7.18.2")
          ];
        "@babel/helpers@7.18.6" = f (sc "babel" "helpers") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/helpers/-/helpers-7.18.6.tgz") "4c966140eaa1fcaa3d5a8c09d7db61077d4debfd" [
          (s."@babel/template@^7.18.6")
          (s."@babel/traverse@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/helpers@^7.12.5" = s."@babel/helpers@7.18.2";
        "@babel/helpers@^7.18.6" = s."@babel/helpers@7.18.6";
        "@babel/highlight@7.17.12" = f (sc "babel" "highlight") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.17.12.tgz") "257de56ee5afbd20451ac0a75686b6b404257351" [
          (s."@babel/helper-validator-identifier@^7.16.7")
          (s."chalk@^2.0.0")
          (s."js-tokens@^4.0.0")
          ];
        "@babel/highlight@7.18.6" = f (sc "babel" "highlight") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/highlight/-/highlight-7.18.6.tgz") "81158601e93e2563795adcbfbdf5d64be3f2ecdf" [
          (s."@babel/helper-validator-identifier@^7.18.6")
          (s."chalk@^2.0.0")
          (s."js-tokens@^4.0.0")
          ];
        "@babel/highlight@^7.16.7" = s."@babel/highlight@7.17.12";
        "@babel/highlight@^7.18.6" = s."@babel/highlight@7.18.6";
        "@babel/parser@7.18.5" = f (sc "babel" "parser") "7.18.5" (ir "https://registry.yarnpkg.com/@babel/parser/-/parser-7.18.5.tgz") "337062363436a893a2d22faa60be5bb37091c83c" [];
        "@babel/parser@7.18.8" = f (sc "babel" "parser") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/parser/-/parser-7.18.8.tgz") "822146080ac9c62dac0823bb3489622e0bc1cbdf" [];
        "@babel/parser@^7.1.0" = s."@babel/parser@7.18.5";
        "@babel/parser@^7.12.11" = s."@babel/parser@7.18.5";
        "@babel/parser@^7.12.7" = s."@babel/parser@7.18.5";
        "@babel/parser@^7.14.7" = s."@babel/parser@7.18.5";
        "@babel/parser@^7.16.7" = s."@babel/parser@7.18.5";
        "@babel/parser@^7.18.6" = s."@babel/parser@7.18.8";
        "@babel/parser@^7.18.8" = s."@babel/parser@7.18.8";
        "@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression@7.18.6" = f (sc "babel" "plugin-bugfix-safari-id-destructuring-collision-in-function-expression") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression/-/plugin-bugfix-safari-id-destructuring-collision-in-function-expression-7.18.6.tgz") "da5b8f9a580acdfbe53494dba45ea389fb09a4d2" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression@^7.18.6" = s."@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression@7.18.6";
        "@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining@7.18.6" = f (sc "babel" "plugin-bugfix-v8-spread-parameters-in-optional-chaining") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining/-/plugin-bugfix-v8-spread-parameters-in-optional-chaining-7.18.6.tgz") "b4e4dbc2cd1acd0133479918f7c6412961c9adb8" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.18.6")
          (s."@babel/plugin-proposal-optional-chaining@^7.18.6")
          ];
        "@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining@^7.18.6" = s."@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining@7.18.6";
        "@babel/plugin-proposal-async-generator-functions@7.18.6" = f (sc "babel" "plugin-proposal-async-generator-functions") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-async-generator-functions/-/plugin-proposal-async-generator-functions-7.18.6.tgz") "aedac81e6fc12bb643374656dd5f2605bf743d17" [
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-remap-async-to-generator@^7.18.6")
          (s."@babel/plugin-syntax-async-generators@^7.8.4")
          ];
        "@babel/plugin-proposal-async-generator-functions@^7.18.6" = s."@babel/plugin-proposal-async-generator-functions@7.18.6";
        "@babel/plugin-proposal-class-properties@7.17.12" = f (sc "babel" "plugin-proposal-class-properties") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.17.12.tgz") "84f65c0cc247d46f40a6da99aadd6438315d80a4" [
          (s."@babel/helper-create-class-features-plugin@^7.17.12")
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-proposal-class-properties@7.18.6" = f (sc "babel" "plugin-proposal-class-properties") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-class-properties/-/plugin-proposal-class-properties-7.18.6.tgz") "b110f59741895f7ec21a6fff696ec46265c446a3" [
          (s."@babel/helper-create-class-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-proposal-class-properties@^7.12.1" = s."@babel/plugin-proposal-class-properties@7.17.12";
        "@babel/plugin-proposal-class-properties@^7.16.0" = s."@babel/plugin-proposal-class-properties@7.17.12";
        "@babel/plugin-proposal-class-properties@^7.18.6" = s."@babel/plugin-proposal-class-properties@7.18.6";
        "@babel/plugin-proposal-class-static-block@7.18.6" = f (sc "babel" "plugin-proposal-class-static-block") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-class-static-block/-/plugin-proposal-class-static-block-7.18.6.tgz") "8aa81d403ab72d3962fc06c26e222dacfc9b9020" [
          (s."@babel/helper-create-class-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-class-static-block@^7.14.5")
          ];
        "@babel/plugin-proposal-class-static-block@^7.18.6" = s."@babel/plugin-proposal-class-static-block@7.18.6";
        "@babel/plugin-proposal-decorators@7.18.2" = f (sc "babel" "plugin-proposal-decorators") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-decorators/-/plugin-proposal-decorators-7.18.2.tgz") "dbe4086d2d42db489399783c3aa9272e9700afd4" [
          (s."@babel/helper-create-class-features-plugin@^7.18.0")
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/helper-replace-supers@^7.18.2")
          (s."@babel/helper-split-export-declaration@^7.16.7")
          (s."@babel/plugin-syntax-decorators@^7.17.12")
          (s."charcodes@^0.2.0")
          ];
        "@babel/plugin-proposal-decorators@^7.12.12" = s."@babel/plugin-proposal-decorators@7.18.2";
        "@babel/plugin-proposal-decorators@^7.16.4" = s."@babel/plugin-proposal-decorators@7.18.2";
        "@babel/plugin-proposal-dynamic-import@7.18.6" = f (sc "babel" "plugin-proposal-dynamic-import") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-dynamic-import/-/plugin-proposal-dynamic-import-7.18.6.tgz") "72bcf8d408799f547d759298c3c27c7e7faa4d94" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-dynamic-import@^7.8.3")
          ];
        "@babel/plugin-proposal-dynamic-import@^7.18.6" = s."@babel/plugin-proposal-dynamic-import@7.18.6";
        "@babel/plugin-proposal-export-default-from@7.17.12" = f (sc "babel" "plugin-proposal-export-default-from") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-export-default-from/-/plugin-proposal-export-default-from-7.17.12.tgz") "df785e638618d8ffa14e08c78c44d9695d083b73" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/plugin-syntax-export-default-from@^7.16.7")
          ];
        "@babel/plugin-proposal-export-default-from@^7.12.1" = s."@babel/plugin-proposal-export-default-from@7.17.12";
        "@babel/plugin-proposal-export-namespace-from@7.18.6" = f (sc "babel" "plugin-proposal-export-namespace-from") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-export-namespace-from/-/plugin-proposal-export-namespace-from-7.18.6.tgz") "1016f0aa5ab383bbf8b3a85a2dcaedf6c8ee7491" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-export-namespace-from@^7.8.3")
          ];
        "@babel/plugin-proposal-export-namespace-from@^7.18.6" = s."@babel/plugin-proposal-export-namespace-from@7.18.6";
        "@babel/plugin-proposal-json-strings@7.18.6" = f (sc "babel" "plugin-proposal-json-strings") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-json-strings/-/plugin-proposal-json-strings-7.18.6.tgz") "7e8788c1811c393aff762817e7dbf1ebd0c05f0b" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-json-strings@^7.8.3")
          ];
        "@babel/plugin-proposal-json-strings@^7.18.6" = s."@babel/plugin-proposal-json-strings@7.18.6";
        "@babel/plugin-proposal-logical-assignment-operators@7.18.6" = f (sc "babel" "plugin-proposal-logical-assignment-operators") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-logical-assignment-operators/-/plugin-proposal-logical-assignment-operators-7.18.6.tgz") "3b9cac6f1ffc2aa459d111df80c12020dfc6b665" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-logical-assignment-operators@^7.10.4")
          ];
        "@babel/plugin-proposal-logical-assignment-operators@^7.18.6" = s."@babel/plugin-proposal-logical-assignment-operators@7.18.6";
        "@babel/plugin-proposal-nullish-coalescing-operator@7.17.12" = f (sc "babel" "plugin-proposal-nullish-coalescing-operator") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-nullish-coalescing-operator/-/plugin-proposal-nullish-coalescing-operator-7.17.12.tgz") "1e93079bbc2cbc756f6db6a1925157c4a92b94be" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.3")
          ];
        "@babel/plugin-proposal-nullish-coalescing-operator@7.18.6" = f (sc "babel" "plugin-proposal-nullish-coalescing-operator") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-nullish-coalescing-operator/-/plugin-proposal-nullish-coalescing-operator-7.18.6.tgz") "fdd940a99a740e577d6c753ab6fbb43fdb9467e1" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.3")
          ];
        "@babel/plugin-proposal-nullish-coalescing-operator@^7.12.1" = s."@babel/plugin-proposal-nullish-coalescing-operator@7.17.12";
        "@babel/plugin-proposal-nullish-coalescing-operator@^7.16.0" = s."@babel/plugin-proposal-nullish-coalescing-operator@7.17.12";
        "@babel/plugin-proposal-nullish-coalescing-operator@^7.18.6" = s."@babel/plugin-proposal-nullish-coalescing-operator@7.18.6";
        "@babel/plugin-proposal-numeric-separator@7.16.7" = f (sc "babel" "plugin-proposal-numeric-separator") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-numeric-separator/-/plugin-proposal-numeric-separator-7.16.7.tgz") "d6b69f4af63fb38b6ca2558442a7fb191236eba9" [
          (s."@babel/helper-plugin-utils@^7.16.7")
          (s."@babel/plugin-syntax-numeric-separator@^7.10.4")
          ];
        "@babel/plugin-proposal-numeric-separator@7.18.6" = f (sc "babel" "plugin-proposal-numeric-separator") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-numeric-separator/-/plugin-proposal-numeric-separator-7.18.6.tgz") "899b14fbafe87f053d2c5ff05b36029c62e13c75" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-numeric-separator@^7.10.4")
          ];
        "@babel/plugin-proposal-numeric-separator@^7.16.0" = s."@babel/plugin-proposal-numeric-separator@7.16.7";
        "@babel/plugin-proposal-numeric-separator@^7.18.6" = s."@babel/plugin-proposal-numeric-separator@7.18.6";
        "@babel/plugin-proposal-object-rest-spread@7.12.1" = f (sc "babel" "plugin-proposal-object-rest-spread") "7.12.1" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.12.1.tgz") "def9bd03cea0f9b72283dac0ec22d289c7691069" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.0")
          (s."@babel/plugin-transform-parameters@^7.12.1")
          ];
        "@babel/plugin-proposal-object-rest-spread@7.18.0" = f (sc "babel" "plugin-proposal-object-rest-spread") "7.18.0" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.18.0.tgz") "79f2390c892ba2a68ec112eb0d895cfbd11155e8" [
          (s."@babel/compat-data@^7.17.10")
          (s."@babel/helper-compilation-targets@^7.17.10")
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.3")
          (s."@babel/plugin-transform-parameters@^7.17.12")
          ];
        "@babel/plugin-proposal-object-rest-spread@7.18.6" = f (sc "babel" "plugin-proposal-object-rest-spread") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-object-rest-spread/-/plugin-proposal-object-rest-spread-7.18.6.tgz") "ec93bba06bfb3e15ebd7da73e953d84b094d5daf" [
          (s."@babel/compat-data@^7.18.6")
          (s."@babel/helper-compilation-targets@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.3")
          (s."@babel/plugin-transform-parameters@^7.18.6")
          ];
        "@babel/plugin-proposal-object-rest-spread@^7.12.1" = s."@babel/plugin-proposal-object-rest-spread@7.18.0";
        "@babel/plugin-proposal-object-rest-spread@^7.18.6" = s."@babel/plugin-proposal-object-rest-spread@7.18.6";
        "@babel/plugin-proposal-optional-catch-binding@7.18.6" = f (sc "babel" "plugin-proposal-optional-catch-binding") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-optional-catch-binding/-/plugin-proposal-optional-catch-binding-7.18.6.tgz") "f9400d0e6a3ea93ba9ef70b09e72dd6da638a2cb" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-optional-catch-binding@^7.8.3")
          ];
        "@babel/plugin-proposal-optional-catch-binding@^7.18.6" = s."@babel/plugin-proposal-optional-catch-binding@7.18.6";
        "@babel/plugin-proposal-optional-chaining@7.17.12" = f (sc "babel" "plugin-proposal-optional-chaining") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-optional-chaining/-/plugin-proposal-optional-chaining-7.17.12.tgz") "f96949e9bacace3a9066323a5cf90cfb9de67174" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.16.0")
          (s."@babel/plugin-syntax-optional-chaining@^7.8.3")
          ];
        "@babel/plugin-proposal-optional-chaining@7.18.6" = f (sc "babel" "plugin-proposal-optional-chaining") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-optional-chaining/-/plugin-proposal-optional-chaining-7.18.6.tgz") "46d4f2ffc20e87fad1d98bc4fa5d466366f6aa0b" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.18.6")
          (s."@babel/plugin-syntax-optional-chaining@^7.8.3")
          ];
        "@babel/plugin-proposal-optional-chaining@^7.12.7" = s."@babel/plugin-proposal-optional-chaining@7.17.12";
        "@babel/plugin-proposal-optional-chaining@^7.16.0" = s."@babel/plugin-proposal-optional-chaining@7.17.12";
        "@babel/plugin-proposal-optional-chaining@^7.18.6" = s."@babel/plugin-proposal-optional-chaining@7.18.6";
        "@babel/plugin-proposal-private-methods@7.17.12" = f (sc "babel" "plugin-proposal-private-methods") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.17.12.tgz") "c2ca3a80beb7539289938da005ad525a038a819c" [
          (s."@babel/helper-create-class-features-plugin@^7.17.12")
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-proposal-private-methods@7.18.6" = f (sc "babel" "plugin-proposal-private-methods") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-private-methods/-/plugin-proposal-private-methods-7.18.6.tgz") "5209de7d213457548a98436fa2882f52f4be6bea" [
          (s."@babel/helper-create-class-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-proposal-private-methods@^7.12.1" = s."@babel/plugin-proposal-private-methods@7.17.12";
        "@babel/plugin-proposal-private-methods@^7.16.0" = s."@babel/plugin-proposal-private-methods@7.17.12";
        "@babel/plugin-proposal-private-methods@^7.18.6" = s."@babel/plugin-proposal-private-methods@7.18.6";
        "@babel/plugin-proposal-private-property-in-object@7.18.6" = f (sc "babel" "plugin-proposal-private-property-in-object") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-private-property-in-object/-/plugin-proposal-private-property-in-object-7.18.6.tgz") "a64137b232f0aca3733a67eb1a144c192389c503" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."@babel/helper-create-class-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-private-property-in-object@^7.14.5")
          ];
        "@babel/plugin-proposal-private-property-in-object@^7.12.1" = s."@babel/plugin-proposal-private-property-in-object@7.18.6";
        "@babel/plugin-proposal-private-property-in-object@^7.18.6" = s."@babel/plugin-proposal-private-property-in-object@7.18.6";
        "@babel/plugin-proposal-unicode-property-regex@7.17.12" = f (sc "babel" "plugin-proposal-unicode-property-regex") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-unicode-property-regex/-/plugin-proposal-unicode-property-regex-7.17.12.tgz") "3dbd7a67bd7f94c8238b394da112d86aaf32ad4d" [
          (s."@babel/helper-create-regexp-features-plugin@^7.17.12")
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-proposal-unicode-property-regex@7.18.6" = f (sc "babel" "plugin-proposal-unicode-property-regex") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-proposal-unicode-property-regex/-/plugin-proposal-unicode-property-regex-7.18.6.tgz") "af613d2cd5e643643b65cded64207b15c85cb78e" [
          (s."@babel/helper-create-regexp-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-proposal-unicode-property-regex@^7.18.6" = s."@babel/plugin-proposal-unicode-property-regex@7.18.6";
        "@babel/plugin-proposal-unicode-property-regex@^7.4.4" = s."@babel/plugin-proposal-unicode-property-regex@7.17.12";
        "@babel/plugin-syntax-async-generators@7.8.4" = f (sc "babel" "plugin-syntax-async-generators") "7.8.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-async-generators/-/plugin-syntax-async-generators-7.8.4.tgz") "a983fb1aeb2ec3f6ed042a210f640e90e786fe0d" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-async-generators@^7.8.4" = s."@babel/plugin-syntax-async-generators@7.8.4";
        "@babel/plugin-syntax-bigint@7.8.3" = f (sc "babel" "plugin-syntax-bigint") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-bigint/-/plugin-syntax-bigint-7.8.3.tgz") "4c9a6f669f5d0cdf1b90a1671e9a146be5300cea" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-bigint@^7.8.3" = s."@babel/plugin-syntax-bigint@7.8.3";
        "@babel/plugin-syntax-class-properties@7.12.13" = f (sc "babel" "plugin-syntax-class-properties") "7.12.13" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-class-properties/-/plugin-syntax-class-properties-7.12.13.tgz") "b5c987274c4a3a82b89714796931a6b53544ae10" [
          (s."@babel/helper-plugin-utils@^7.12.13")
          ];
        "@babel/plugin-syntax-class-properties@^7.12.13" = s."@babel/plugin-syntax-class-properties@7.12.13";
        "@babel/plugin-syntax-class-properties@^7.8.3" = s."@babel/plugin-syntax-class-properties@7.12.13";
        "@babel/plugin-syntax-class-static-block@7.14.5" = f (sc "babel" "plugin-syntax-class-static-block") "7.14.5" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-class-static-block/-/plugin-syntax-class-static-block-7.14.5.tgz") "195df89b146b4b78b3bf897fd7a257c84659d406" [
          (s."@babel/helper-plugin-utils@^7.14.5")
          ];
        "@babel/plugin-syntax-class-static-block@^7.14.5" = s."@babel/plugin-syntax-class-static-block@7.14.5";
        "@babel/plugin-syntax-decorators@7.17.12" = f (sc "babel" "plugin-syntax-decorators") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-decorators/-/plugin-syntax-decorators-7.17.12.tgz") "02e8f678602f0af8222235271efea945cfdb018a" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-syntax-decorators@^7.17.12" = s."@babel/plugin-syntax-decorators@7.17.12";
        "@babel/plugin-syntax-dynamic-import@7.8.3" = f (sc "babel" "plugin-syntax-dynamic-import") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-dynamic-import/-/plugin-syntax-dynamic-import-7.8.3.tgz") "62bf98b2da3cd21d626154fc96ee5b3cb68eacb3" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-dynamic-import@^7.8.3" = s."@babel/plugin-syntax-dynamic-import@7.8.3";
        "@babel/plugin-syntax-export-default-from@7.16.7" = f (sc "babel" "plugin-syntax-export-default-from") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-export-default-from/-/plugin-syntax-export-default-from-7.16.7.tgz") "fa89cf13b60de2c3f79acdc2b52a21174c6de060" [
          (s."@babel/helper-plugin-utils@^7.16.7")
          ];
        "@babel/plugin-syntax-export-default-from@^7.16.7" = s."@babel/plugin-syntax-export-default-from@7.16.7";
        "@babel/plugin-syntax-export-namespace-from@7.8.3" = f (sc "babel" "plugin-syntax-export-namespace-from") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-export-namespace-from/-/plugin-syntax-export-namespace-from-7.8.3.tgz") "028964a9ba80dbc094c915c487ad7c4e7a66465a" [
          (s."@babel/helper-plugin-utils@^7.8.3")
          ];
        "@babel/plugin-syntax-export-namespace-from@^7.8.3" = s."@babel/plugin-syntax-export-namespace-from@7.8.3";
        "@babel/plugin-syntax-flow@7.17.12" = f (sc "babel" "plugin-syntax-flow") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-flow/-/plugin-syntax-flow-7.17.12.tgz") "23d852902acd19f42923fca9d0f196984d124e73" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-syntax-flow@^7.17.12" = s."@babel/plugin-syntax-flow@7.17.12";
        "@babel/plugin-syntax-import-assertions@7.18.6" = f (sc "babel" "plugin-syntax-import-assertions") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-import-assertions/-/plugin-syntax-import-assertions-7.18.6.tgz") "cd6190500a4fa2fe31990a963ffab4b63e4505e4" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-syntax-import-assertions@^7.18.6" = s."@babel/plugin-syntax-import-assertions@7.18.6";
        "@babel/plugin-syntax-import-meta@7.10.4" = f (sc "babel" "plugin-syntax-import-meta") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-import-meta/-/plugin-syntax-import-meta-7.10.4.tgz") "ee601348c370fa334d2207be158777496521fd51" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-import-meta@^7.8.3" = s."@babel/plugin-syntax-import-meta@7.10.4";
        "@babel/plugin-syntax-json-strings@7.8.3" = f (sc "babel" "plugin-syntax-json-strings") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-json-strings/-/plugin-syntax-json-strings-7.8.3.tgz") "01ca21b668cd8218c9e640cb6dd88c5412b2c96a" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-json-strings@^7.8.3" = s."@babel/plugin-syntax-json-strings@7.8.3";
        "@babel/plugin-syntax-jsx@7.12.1" = f (sc "babel" "plugin-syntax-jsx") "7.12.1" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.12.1.tgz") "9d9d357cc818aa7ae7935917c1257f67677a0926" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-jsx@7.17.12" = f (sc "babel" "plugin-syntax-jsx") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.17.12.tgz") "834035b45061983a491f60096f61a2e7c5674a47" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-syntax-jsx@7.18.6" = f (sc "babel" "plugin-syntax-jsx") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.18.6.tgz") "a8feef63b010150abd97f1649ec296e849943ca0" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-syntax-jsx@^7.17.12" = s."@babel/plugin-syntax-jsx@7.17.12";
        "@babel/plugin-syntax-jsx@^7.18.6" = s."@babel/plugin-syntax-jsx@7.18.6";
        "@babel/plugin-syntax-logical-assignment-operators@7.10.4" = f (sc "babel" "plugin-syntax-logical-assignment-operators") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-logical-assignment-operators/-/plugin-syntax-logical-assignment-operators-7.10.4.tgz") "ca91ef46303530448b906652bac2e9fe9941f699" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-logical-assignment-operators@^7.10.4" = s."@babel/plugin-syntax-logical-assignment-operators@7.10.4";
        "@babel/plugin-syntax-logical-assignment-operators@^7.8.3" = s."@babel/plugin-syntax-logical-assignment-operators@7.10.4";
        "@babel/plugin-syntax-nullish-coalescing-operator@7.8.3" = f (sc "babel" "plugin-syntax-nullish-coalescing-operator") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-nullish-coalescing-operator/-/plugin-syntax-nullish-coalescing-operator-7.8.3.tgz") "167ed70368886081f74b5c36c65a88c03b66d1a9" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-nullish-coalescing-operator@^7.8.3" = s."@babel/plugin-syntax-nullish-coalescing-operator@7.8.3";
        "@babel/plugin-syntax-numeric-separator@7.10.4" = f (sc "babel" "plugin-syntax-numeric-separator") "7.10.4" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-numeric-separator/-/plugin-syntax-numeric-separator-7.10.4.tgz") "b9b070b3e33570cd9fd07ba7fa91c0dd37b9af97" [
          (s."@babel/helper-plugin-utils@^7.10.4")
          ];
        "@babel/plugin-syntax-numeric-separator@^7.10.4" = s."@babel/plugin-syntax-numeric-separator@7.10.4";
        "@babel/plugin-syntax-numeric-separator@^7.8.3" = s."@babel/plugin-syntax-numeric-separator@7.10.4";
        "@babel/plugin-syntax-object-rest-spread@7.8.3" = f (sc "babel" "plugin-syntax-object-rest-spread") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-object-rest-spread/-/plugin-syntax-object-rest-spread-7.8.3.tgz") "60e225edcbd98a640332a2e72dd3e66f1af55871" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-object-rest-spread@^7.8.0" = s."@babel/plugin-syntax-object-rest-spread@7.8.3";
        "@babel/plugin-syntax-object-rest-spread@^7.8.3" = s."@babel/plugin-syntax-object-rest-spread@7.8.3";
        "@babel/plugin-syntax-optional-catch-binding@7.8.3" = f (sc "babel" "plugin-syntax-optional-catch-binding") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-optional-catch-binding/-/plugin-syntax-optional-catch-binding-7.8.3.tgz") "6111a265bcfb020eb9efd0fdfd7d26402b9ed6c1" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-optional-catch-binding@^7.8.3" = s."@babel/plugin-syntax-optional-catch-binding@7.8.3";
        "@babel/plugin-syntax-optional-chaining@7.8.3" = f (sc "babel" "plugin-syntax-optional-chaining") "7.8.3" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-optional-chaining/-/plugin-syntax-optional-chaining-7.8.3.tgz") "4f69c2ab95167e0180cd5336613f8c5788f7d48a" [
          (s."@babel/helper-plugin-utils@^7.8.0")
          ];
        "@babel/plugin-syntax-optional-chaining@^7.8.3" = s."@babel/plugin-syntax-optional-chaining@7.8.3";
        "@babel/plugin-syntax-private-property-in-object@7.14.5" = f (sc "babel" "plugin-syntax-private-property-in-object") "7.14.5" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-private-property-in-object/-/plugin-syntax-private-property-in-object-7.14.5.tgz") "0dc6671ec0ea22b6e94a1114f857970cd39de1ad" [
          (s."@babel/helper-plugin-utils@^7.14.5")
          ];
        "@babel/plugin-syntax-private-property-in-object@^7.14.5" = s."@babel/plugin-syntax-private-property-in-object@7.14.5";
        "@babel/plugin-syntax-top-level-await@7.14.5" = f (sc "babel" "plugin-syntax-top-level-await") "7.14.5" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-top-level-await/-/plugin-syntax-top-level-await-7.14.5.tgz") "c1cfdadc35a646240001f06138247b741c34d94c" [
          (s."@babel/helper-plugin-utils@^7.14.5")
          ];
        "@babel/plugin-syntax-top-level-await@^7.14.5" = s."@babel/plugin-syntax-top-level-await@7.14.5";
        "@babel/plugin-syntax-top-level-await@^7.8.3" = s."@babel/plugin-syntax-top-level-await@7.14.5";
        "@babel/plugin-syntax-typescript@7.17.12" = f (sc "babel" "plugin-syntax-typescript") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.17.12.tgz") "b54fc3be6de734a56b87508f99d6428b5b605a7b" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-syntax-typescript@7.18.6" = f (sc "babel" "plugin-syntax-typescript") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-syntax-typescript/-/plugin-syntax-typescript-7.18.6.tgz") "1c09cd25795c7c2b8a4ba9ae49394576d4133285" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-syntax-typescript@^7.18.6" = s."@babel/plugin-syntax-typescript@7.18.6";
        "@babel/plugin-syntax-typescript@^7.7.2" = s."@babel/plugin-syntax-typescript@7.17.12";
        "@babel/plugin-transform-arrow-functions@7.17.12" = f (sc "babel" "plugin-transform-arrow-functions") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.17.12.tgz") "dddd783b473b1b1537ef46423e3944ff24898c45" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-arrow-functions@7.18.6" = f (sc "babel" "plugin-transform-arrow-functions") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-arrow-functions/-/plugin-transform-arrow-functions-7.18.6.tgz") "19063fcf8771ec7b31d742339dac62433d0611fe" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-arrow-functions@^7.12.1" = s."@babel/plugin-transform-arrow-functions@7.17.12";
        "@babel/plugin-transform-arrow-functions@^7.18.6" = s."@babel/plugin-transform-arrow-functions@7.18.6";
        "@babel/plugin-transform-async-to-generator@7.18.6" = f (sc "babel" "plugin-transform-async-to-generator") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-async-to-generator/-/plugin-transform-async-to-generator-7.18.6.tgz") "ccda3d1ab9d5ced5265fdb13f1882d5476c71615" [
          (s."@babel/helper-module-imports@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-remap-async-to-generator@^7.18.6")
          ];
        "@babel/plugin-transform-async-to-generator@^7.18.6" = s."@babel/plugin-transform-async-to-generator@7.18.6";
        "@babel/plugin-transform-block-scoped-functions@7.18.6" = f (sc "babel" "plugin-transform-block-scoped-functions") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-block-scoped-functions/-/plugin-transform-block-scoped-functions-7.18.6.tgz") "9187bf4ba302635b9d70d986ad70f038726216a8" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-block-scoped-functions@^7.18.6" = s."@babel/plugin-transform-block-scoped-functions@7.18.6";
        "@babel/plugin-transform-block-scoping@7.18.4" = f (sc "babel" "plugin-transform-block-scoping") "7.18.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.18.4.tgz") "7988627b3e9186a13e4d7735dc9c34a056613fb9" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-block-scoping@7.18.6" = f (sc "babel" "plugin-transform-block-scoping") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-block-scoping/-/plugin-transform-block-scoping-7.18.6.tgz") "b5f78318914615397d86a731ef2cc668796a726c" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-block-scoping@^7.12.12" = s."@babel/plugin-transform-block-scoping@7.18.4";
        "@babel/plugin-transform-block-scoping@^7.18.6" = s."@babel/plugin-transform-block-scoping@7.18.6";
        "@babel/plugin-transform-classes@7.18.4" = f (sc "babel" "plugin-transform-classes") "7.18.4" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.18.4.tgz") "51310b812a090b846c784e47087fa6457baef814" [
          (s."@babel/helper-annotate-as-pure@^7.16.7")
          (s."@babel/helper-environment-visitor@^7.18.2")
          (s."@babel/helper-function-name@^7.17.9")
          (s."@babel/helper-optimise-call-expression@^7.16.7")
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/helper-replace-supers@^7.18.2")
          (s."@babel/helper-split-export-declaration@^7.16.7")
          (s."globals@^11.1.0")
          ];
        "@babel/plugin-transform-classes@7.18.8" = f (sc "babel" "plugin-transform-classes") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-classes/-/plugin-transform-classes-7.18.8.tgz") "7e85777e622e979c85c701a095280360b818ce49" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-function-name@^7.18.6")
          (s."@babel/helper-optimise-call-expression@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-replace-supers@^7.18.6")
          (s."@babel/helper-split-export-declaration@^7.18.6")
          (s."globals@^11.1.0")
          ];
        "@babel/plugin-transform-classes@^7.12.1" = s."@babel/plugin-transform-classes@7.18.4";
        "@babel/plugin-transform-classes@^7.18.6" = s."@babel/plugin-transform-classes@7.18.8";
        "@babel/plugin-transform-computed-properties@7.18.6" = f (sc "babel" "plugin-transform-computed-properties") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-computed-properties/-/plugin-transform-computed-properties-7.18.6.tgz") "5d15eb90e22e69604f3348344c91165c5395d032" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-computed-properties@^7.18.6" = s."@babel/plugin-transform-computed-properties@7.18.6";
        "@babel/plugin-transform-destructuring@7.18.0" = f (sc "babel" "plugin-transform-destructuring") "7.18.0" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.18.0.tgz") "dc4f92587e291b4daa78aa20cc2d7a63aa11e858" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-destructuring@7.18.6" = f (sc "babel" "plugin-transform-destructuring") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-destructuring/-/plugin-transform-destructuring-7.18.6.tgz") "a98b0e42c7ffbf5eefcbcf33280430f230895c6f" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-destructuring@^7.12.1" = s."@babel/plugin-transform-destructuring@7.18.0";
        "@babel/plugin-transform-destructuring@^7.18.6" = s."@babel/plugin-transform-destructuring@7.18.6";
        "@babel/plugin-transform-dotall-regex@7.16.7" = f (sc "babel" "plugin-transform-dotall-regex") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.16.7.tgz") "6b2d67686fab15fb6a7fd4bd895d5982cfc81241" [
          (s."@babel/helper-create-regexp-features-plugin@^7.16.7")
          (s."@babel/helper-plugin-utils@^7.16.7")
          ];
        "@babel/plugin-transform-dotall-regex@7.18.6" = f (sc "babel" "plugin-transform-dotall-regex") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-dotall-regex/-/plugin-transform-dotall-regex-7.18.6.tgz") "b286b3e7aae6c7b861e45bed0a2fafd6b1a4fef8" [
          (s."@babel/helper-create-regexp-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-dotall-regex@^7.18.6" = s."@babel/plugin-transform-dotall-regex@7.18.6";
        "@babel/plugin-transform-dotall-regex@^7.4.4" = s."@babel/plugin-transform-dotall-regex@7.16.7";
        "@babel/plugin-transform-duplicate-keys@7.18.6" = f (sc "babel" "plugin-transform-duplicate-keys") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-duplicate-keys/-/plugin-transform-duplicate-keys-7.18.6.tgz") "e6c94e8cd3c9dd8a88144f7b78ae22975a7ff473" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-duplicate-keys@^7.18.6" = s."@babel/plugin-transform-duplicate-keys@7.18.6";
        "@babel/plugin-transform-exponentiation-operator@7.18.6" = f (sc "babel" "plugin-transform-exponentiation-operator") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-exponentiation-operator/-/plugin-transform-exponentiation-operator-7.18.6.tgz") "421c705f4521888c65e91fdd1af951bfefd4dacd" [
          (s."@babel/helper-builder-binary-assignment-operator-visitor@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-exponentiation-operator@^7.18.6" = s."@babel/plugin-transform-exponentiation-operator@7.18.6";
        "@babel/plugin-transform-flow-strip-types@7.17.12" = f (sc "babel" "plugin-transform-flow-strip-types") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-flow-strip-types/-/plugin-transform-flow-strip-types-7.17.12.tgz") "5e070f99a4152194bd9275de140e83a92966cab3" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/plugin-syntax-flow@^7.17.12")
          ];
        "@babel/plugin-transform-flow-strip-types@^7.16.0" = s."@babel/plugin-transform-flow-strip-types@7.17.12";
        "@babel/plugin-transform-flow-strip-types@^7.17.12" = s."@babel/plugin-transform-flow-strip-types@7.17.12";
        "@babel/plugin-transform-for-of@7.18.1" = f (sc "babel" "plugin-transform-for-of") "7.18.1" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.18.1.tgz") "ed14b657e162b72afbbb2b4cdad277bf2bb32036" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-for-of@7.18.8" = f (sc "babel" "plugin-transform-for-of") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-for-of/-/plugin-transform-for-of-7.18.8.tgz") "6ef8a50b244eb6a0bdbad0c7c61877e4e30097c1" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-for-of@^7.12.1" = s."@babel/plugin-transform-for-of@7.18.1";
        "@babel/plugin-transform-for-of@^7.18.6" = s."@babel/plugin-transform-for-of@7.18.8";
        "@babel/plugin-transform-function-name@7.18.6" = f (sc "babel" "plugin-transform-function-name") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-function-name/-/plugin-transform-function-name-7.18.6.tgz") "6a7e4ae2893d336fd1b8f64c9f92276391d0f1b4" [
          (s."@babel/helper-compilation-targets@^7.18.6")
          (s."@babel/helper-function-name@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-function-name@^7.18.6" = s."@babel/plugin-transform-function-name@7.18.6";
        "@babel/plugin-transform-literals@7.18.6" = f (sc "babel" "plugin-transform-literals") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-literals/-/plugin-transform-literals-7.18.6.tgz") "9d6af353b5209df72960baf4492722d56f39a205" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-literals@^7.18.6" = s."@babel/plugin-transform-literals@7.18.6";
        "@babel/plugin-transform-member-expression-literals@7.18.6" = f (sc "babel" "plugin-transform-member-expression-literals") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-member-expression-literals/-/plugin-transform-member-expression-literals-7.18.6.tgz") "ac9fdc1a118620ac49b7e7a5d2dc177a1bfee88e" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-member-expression-literals@^7.18.6" = s."@babel/plugin-transform-member-expression-literals@7.18.6";
        "@babel/plugin-transform-modules-amd@7.18.6" = f (sc "babel" "plugin-transform-modules-amd") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-amd/-/plugin-transform-modules-amd-7.18.6.tgz") "8c91f8c5115d2202f277549848874027d7172d21" [
          (s."@babel/helper-module-transforms@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          ];
        "@babel/plugin-transform-modules-amd@^7.18.6" = s."@babel/plugin-transform-modules-amd@7.18.6";
        "@babel/plugin-transform-modules-commonjs@7.18.6" = f (sc "babel" "plugin-transform-modules-commonjs") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-commonjs/-/plugin-transform-modules-commonjs-7.18.6.tgz") "afd243afba166cca69892e24a8fd8c9f2ca87883" [
          (s."@babel/helper-module-transforms@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-simple-access@^7.18.6")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          ];
        "@babel/plugin-transform-modules-commonjs@^7.18.6" = s."@babel/plugin-transform-modules-commonjs@7.18.6";
        "@babel/plugin-transform-modules-systemjs@7.18.6" = f (sc "babel" "plugin-transform-modules-systemjs") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-systemjs/-/plugin-transform-modules-systemjs-7.18.6.tgz") "026511b7657d63bf5d4cf2fd4aeb963139914a54" [
          (s."@babel/helper-hoist-variables@^7.18.6")
          (s."@babel/helper-module-transforms@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-validator-identifier@^7.18.6")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          ];
        "@babel/plugin-transform-modules-systemjs@^7.18.6" = s."@babel/plugin-transform-modules-systemjs@7.18.6";
        "@babel/plugin-transform-modules-umd@7.18.6" = f (sc "babel" "plugin-transform-modules-umd") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-modules-umd/-/plugin-transform-modules-umd-7.18.6.tgz") "81d3832d6034b75b54e62821ba58f28ed0aab4b9" [
          (s."@babel/helper-module-transforms@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-modules-umd@^7.18.6" = s."@babel/plugin-transform-modules-umd@7.18.6";
        "@babel/plugin-transform-named-capturing-groups-regex@7.18.6" = f (sc "babel" "plugin-transform-named-capturing-groups-regex") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-named-capturing-groups-regex/-/plugin-transform-named-capturing-groups-regex-7.18.6.tgz") "c89bfbc7cc6805d692f3a49bc5fc1b630007246d" [
          (s."@babel/helper-create-regexp-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-named-capturing-groups-regex@^7.18.6" = s."@babel/plugin-transform-named-capturing-groups-regex@7.18.6";
        "@babel/plugin-transform-new-target@7.18.6" = f (sc "babel" "plugin-transform-new-target") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-new-target/-/plugin-transform-new-target-7.18.6.tgz") "d128f376ae200477f37c4ddfcc722a8a1b3246a8" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-new-target@^7.18.6" = s."@babel/plugin-transform-new-target@7.18.6";
        "@babel/plugin-transform-object-super@7.18.6" = f (sc "babel" "plugin-transform-object-super") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-object-super/-/plugin-transform-object-super-7.18.6.tgz") "fb3c6ccdd15939b6ff7939944b51971ddc35912c" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-replace-supers@^7.18.6")
          ];
        "@babel/plugin-transform-object-super@^7.18.6" = s."@babel/plugin-transform-object-super@7.18.6";
        "@babel/plugin-transform-parameters@7.17.12" = f (sc "babel" "plugin-transform-parameters") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.17.12.tgz") "eb467cd9586ff5ff115a9880d6fdbd4a846b7766" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-parameters@7.18.8" = f (sc "babel" "plugin-transform-parameters") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-parameters/-/plugin-transform-parameters-7.18.8.tgz") "ee9f1a0ce6d78af58d0956a9378ea3427cccb48a" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-parameters@^7.12.1" = s."@babel/plugin-transform-parameters@7.17.12";
        "@babel/plugin-transform-parameters@^7.17.12" = s."@babel/plugin-transform-parameters@7.17.12";
        "@babel/plugin-transform-parameters@^7.18.6" = s."@babel/plugin-transform-parameters@7.18.8";
        "@babel/plugin-transform-property-literals@7.18.6" = f (sc "babel" "plugin-transform-property-literals") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-property-literals/-/plugin-transform-property-literals-7.18.6.tgz") "e22498903a483448e94e032e9bbb9c5ccbfc93a3" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-property-literals@^7.18.6" = s."@babel/plugin-transform-property-literals@7.18.6";
        "@babel/plugin-transform-react-constant-elements@7.17.12" = f (sc "babel" "plugin-transform-react-constant-elements") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-constant-elements/-/plugin-transform-react-constant-elements-7.17.12.tgz") "cc580857696b6dd9e5e3d079e673d060a0657f37" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-react-constant-elements@^7.12.1" = s."@babel/plugin-transform-react-constant-elements@7.17.12";
        "@babel/plugin-transform-react-constant-elements@^7.14.5" = s."@babel/plugin-transform-react-constant-elements@7.17.12";
        "@babel/plugin-transform-react-display-name@7.16.7" = f (sc "babel" "plugin-transform-react-display-name") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-display-name/-/plugin-transform-react-display-name-7.16.7.tgz") "7b6d40d232f4c0f550ea348593db3b21e2404340" [
          (s."@babel/helper-plugin-utils@^7.16.7")
          ];
        "@babel/plugin-transform-react-display-name@7.18.6" = f (sc "babel" "plugin-transform-react-display-name") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-display-name/-/plugin-transform-react-display-name-7.18.6.tgz") "8b1125f919ef36ebdfff061d664e266c666b9415" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-react-display-name@^7.16.0" = s."@babel/plugin-transform-react-display-name@7.16.7";
        "@babel/plugin-transform-react-display-name@^7.18.6" = s."@babel/plugin-transform-react-display-name@7.18.6";
        "@babel/plugin-transform-react-jsx-development@7.18.6" = f (sc "babel" "plugin-transform-react-jsx-development") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx-development/-/plugin-transform-react-jsx-development-7.18.6.tgz") "dbe5c972811e49c7405b630e4d0d2e1380c0ddc5" [
          (s."@babel/plugin-transform-react-jsx@^7.18.6")
          ];
        "@babel/plugin-transform-react-jsx-development@^7.18.6" = s."@babel/plugin-transform-react-jsx-development@7.18.6";
        "@babel/plugin-transform-react-jsx@7.17.12" = f (sc "babel" "plugin-transform-react-jsx") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.17.12.tgz") "2aa20022709cd6a3f40b45d60603d5f269586dba" [
          (s."@babel/helper-annotate-as-pure@^7.16.7")
          (s."@babel/helper-module-imports@^7.16.7")
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/plugin-syntax-jsx@^7.17.12")
          (s."@babel/types@^7.17.12")
          ];
        "@babel/plugin-transform-react-jsx@7.18.6" = f (sc "babel" "plugin-transform-react-jsx") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.18.6.tgz") "2721e96d31df96e3b7ad48ff446995d26bc028ff" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."@babel/helper-module-imports@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-jsx@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/plugin-transform-react-jsx@^7.12.12" = s."@babel/plugin-transform-react-jsx@7.17.12";
        "@babel/plugin-transform-react-jsx@^7.18.6" = s."@babel/plugin-transform-react-jsx@7.18.6";
        "@babel/plugin-transform-react-pure-annotations@7.18.6" = f (sc "babel" "plugin-transform-react-pure-annotations") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-react-pure-annotations/-/plugin-transform-react-pure-annotations-7.18.6.tgz") "561af267f19f3e5d59291f9950fd7b9663d0d844" [
          (s."@babel/helper-annotate-as-pure@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-react-pure-annotations@^7.18.6" = s."@babel/plugin-transform-react-pure-annotations@7.18.6";
        "@babel/plugin-transform-regenerator@7.18.6" = f (sc "babel" "plugin-transform-regenerator") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-regenerator/-/plugin-transform-regenerator-7.18.6.tgz") "585c66cb84d4b4bf72519a34cfce761b8676ca73" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."regenerator-transform@^0.15.0")
          ];
        "@babel/plugin-transform-regenerator@^7.18.6" = s."@babel/plugin-transform-regenerator@7.18.6";
        "@babel/plugin-transform-reserved-words@7.18.6" = f (sc "babel" "plugin-transform-reserved-words") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-reserved-words/-/plugin-transform-reserved-words-7.18.6.tgz") "b1abd8ebf8edaa5f7fe6bbb8d2133d23b6a6f76a" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-reserved-words@^7.18.6" = s."@babel/plugin-transform-reserved-words@7.18.6";
        "@babel/plugin-transform-runtime@7.18.6" = f (sc "babel" "plugin-transform-runtime") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-runtime/-/plugin-transform-runtime-7.18.6.tgz") "77b14416015ea93367ca06979710f5000ff34ccb" [
          (s."@babel/helper-module-imports@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."babel-plugin-polyfill-corejs2@^0.3.1")
          (s."babel-plugin-polyfill-corejs3@^0.5.2")
          (s."babel-plugin-polyfill-regenerator@^0.3.1")
          (s."semver@^6.3.0")
          ];
        "@babel/plugin-transform-runtime@^7.16.4" = s."@babel/plugin-transform-runtime@7.18.6";
        "@babel/plugin-transform-runtime@^7.18.6" = s."@babel/plugin-transform-runtime@7.18.6";
        "@babel/plugin-transform-shorthand-properties@7.16.7" = f (sc "babel" "plugin-transform-shorthand-properties") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.16.7.tgz") "e8549ae4afcf8382f711794c0c7b6b934c5fbd2a" [
          (s."@babel/helper-plugin-utils@^7.16.7")
          ];
        "@babel/plugin-transform-shorthand-properties@7.18.6" = f (sc "babel" "plugin-transform-shorthand-properties") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-shorthand-properties/-/plugin-transform-shorthand-properties-7.18.6.tgz") "6d6df7983d67b195289be24909e3f12a8f664dc9" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-shorthand-properties@^7.12.1" = s."@babel/plugin-transform-shorthand-properties@7.16.7";
        "@babel/plugin-transform-shorthand-properties@^7.18.6" = s."@babel/plugin-transform-shorthand-properties@7.18.6";
        "@babel/plugin-transform-spread@7.17.12" = f (sc "babel" "plugin-transform-spread") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.17.12.tgz") "c112cad3064299f03ea32afed1d659223935d1f5" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.16.0")
          ];
        "@babel/plugin-transform-spread@7.18.6" = f (sc "babel" "plugin-transform-spread") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-spread/-/plugin-transform-spread-7.18.6.tgz") "82b080241965f1689f0a60ecc6f1f6575dbdb9d6" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-skip-transparent-expression-wrappers@^7.18.6")
          ];
        "@babel/plugin-transform-spread@^7.12.1" = s."@babel/plugin-transform-spread@7.17.12";
        "@babel/plugin-transform-spread@^7.18.6" = s."@babel/plugin-transform-spread@7.18.6";
        "@babel/plugin-transform-sticky-regex@7.18.6" = f (sc "babel" "plugin-transform-sticky-regex") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-sticky-regex/-/plugin-transform-sticky-regex-7.18.6.tgz") "c6706eb2b1524028e317720339583ad0f444adcc" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-sticky-regex@^7.18.6" = s."@babel/plugin-transform-sticky-regex@7.18.6";
        "@babel/plugin-transform-template-literals@7.18.2" = f (sc "babel" "plugin-transform-template-literals") "7.18.2" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.18.2.tgz") "31ed6915721864847c48b656281d0098ea1add28" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          ];
        "@babel/plugin-transform-template-literals@7.18.6" = f (sc "babel" "plugin-transform-template-literals") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-template-literals/-/plugin-transform-template-literals-7.18.6.tgz") "b763f4dc9d11a7cce58cf9a490d82e80547db9c2" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-template-literals@^7.12.1" = s."@babel/plugin-transform-template-literals@7.18.2";
        "@babel/plugin-transform-template-literals@^7.18.6" = s."@babel/plugin-transform-template-literals@7.18.6";
        "@babel/plugin-transform-typeof-symbol@7.18.6" = f (sc "babel" "plugin-transform-typeof-symbol") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-typeof-symbol/-/plugin-transform-typeof-symbol-7.18.6.tgz") "486bb39d5a18047358e0d04dc0d2f322f0b92e92" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-typeof-symbol@^7.18.6" = s."@babel/plugin-transform-typeof-symbol@7.18.6";
        "@babel/plugin-transform-typescript@7.18.8" = f (sc "babel" "plugin-transform-typescript") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-typescript/-/plugin-transform-typescript-7.18.8.tgz") "303feb7a920e650f2213ef37b36bbf327e6fa5a0" [
          (s."@babel/helper-create-class-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/plugin-syntax-typescript@^7.18.6")
          ];
        "@babel/plugin-transform-typescript@^7.18.6" = s."@babel/plugin-transform-typescript@7.18.8";
        "@babel/plugin-transform-unicode-escapes@7.18.6" = f (sc "babel" "plugin-transform-unicode-escapes") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-unicode-escapes/-/plugin-transform-unicode-escapes-7.18.6.tgz") "0d01fb7fb2243ae1c033f65f6e3b4be78db75f27" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-unicode-escapes@^7.18.6" = s."@babel/plugin-transform-unicode-escapes@7.18.6";
        "@babel/plugin-transform-unicode-regex@7.18.6" = f (sc "babel" "plugin-transform-unicode-regex") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/plugin-transform-unicode-regex/-/plugin-transform-unicode-regex-7.18.6.tgz") "194317225d8c201bbae103364ffe9e2cea36cdca" [
          (s."@babel/helper-create-regexp-features-plugin@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          ];
        "@babel/plugin-transform-unicode-regex@^7.18.6" = s."@babel/plugin-transform-unicode-regex@7.18.6";
        "@babel/preset-env@7.18.6" = f (sc "babel" "preset-env") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/preset-env/-/preset-env-7.18.6.tgz") "953422e98a5f66bc56cd0b9074eaea127ec86ace" [
          (s."@babel/compat-data@^7.18.6")
          (s."@babel/helper-compilation-targets@^7.18.6")
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-validator-option@^7.18.6")
          (s."@babel/plugin-bugfix-safari-id-destructuring-collision-in-function-expression@^7.18.6")
          (s."@babel/plugin-bugfix-v8-spread-parameters-in-optional-chaining@^7.18.6")
          (s."@babel/plugin-proposal-async-generator-functions@^7.18.6")
          (s."@babel/plugin-proposal-class-properties@^7.18.6")
          (s."@babel/plugin-proposal-class-static-block@^7.18.6")
          (s."@babel/plugin-proposal-dynamic-import@^7.18.6")
          (s."@babel/plugin-proposal-export-namespace-from@^7.18.6")
          (s."@babel/plugin-proposal-json-strings@^7.18.6")
          (s."@babel/plugin-proposal-logical-assignment-operators@^7.18.6")
          (s."@babel/plugin-proposal-nullish-coalescing-operator@^7.18.6")
          (s."@babel/plugin-proposal-numeric-separator@^7.18.6")
          (s."@babel/plugin-proposal-object-rest-spread@^7.18.6")
          (s."@babel/plugin-proposal-optional-catch-binding@^7.18.6")
          (s."@babel/plugin-proposal-optional-chaining@^7.18.6")
          (s."@babel/plugin-proposal-private-methods@^7.18.6")
          (s."@babel/plugin-proposal-private-property-in-object@^7.18.6")
          (s."@babel/plugin-proposal-unicode-property-regex@^7.18.6")
          (s."@babel/plugin-syntax-async-generators@^7.8.4")
          (s."@babel/plugin-syntax-class-properties@^7.12.13")
          (s."@babel/plugin-syntax-class-static-block@^7.14.5")
          (s."@babel/plugin-syntax-dynamic-import@^7.8.3")
          (s."@babel/plugin-syntax-export-namespace-from@^7.8.3")
          (s."@babel/plugin-syntax-import-assertions@^7.18.6")
          (s."@babel/plugin-syntax-json-strings@^7.8.3")
          (s."@babel/plugin-syntax-logical-assignment-operators@^7.10.4")
          (s."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.3")
          (s."@babel/plugin-syntax-numeric-separator@^7.10.4")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.3")
          (s."@babel/plugin-syntax-optional-catch-binding@^7.8.3")
          (s."@babel/plugin-syntax-optional-chaining@^7.8.3")
          (s."@babel/plugin-syntax-private-property-in-object@^7.14.5")
          (s."@babel/plugin-syntax-top-level-await@^7.14.5")
          (s."@babel/plugin-transform-arrow-functions@^7.18.6")
          (s."@babel/plugin-transform-async-to-generator@^7.18.6")
          (s."@babel/plugin-transform-block-scoped-functions@^7.18.6")
          (s."@babel/plugin-transform-block-scoping@^7.18.6")
          (s."@babel/plugin-transform-classes@^7.18.6")
          (s."@babel/plugin-transform-computed-properties@^7.18.6")
          (s."@babel/plugin-transform-destructuring@^7.18.6")
          (s."@babel/plugin-transform-dotall-regex@^7.18.6")
          (s."@babel/plugin-transform-duplicate-keys@^7.18.6")
          (s."@babel/plugin-transform-exponentiation-operator@^7.18.6")
          (s."@babel/plugin-transform-for-of@^7.18.6")
          (s."@babel/plugin-transform-function-name@^7.18.6")
          (s."@babel/plugin-transform-literals@^7.18.6")
          (s."@babel/plugin-transform-member-expression-literals@^7.18.6")
          (s."@babel/plugin-transform-modules-amd@^7.18.6")
          (s."@babel/plugin-transform-modules-commonjs@^7.18.6")
          (s."@babel/plugin-transform-modules-systemjs@^7.18.6")
          (s."@babel/plugin-transform-modules-umd@^7.18.6")
          (s."@babel/plugin-transform-named-capturing-groups-regex@^7.18.6")
          (s."@babel/plugin-transform-new-target@^7.18.6")
          (s."@babel/plugin-transform-object-super@^7.18.6")
          (s."@babel/plugin-transform-parameters@^7.18.6")
          (s."@babel/plugin-transform-property-literals@^7.18.6")
          (s."@babel/plugin-transform-regenerator@^7.18.6")
          (s."@babel/plugin-transform-reserved-words@^7.18.6")
          (s."@babel/plugin-transform-shorthand-properties@^7.18.6")
          (s."@babel/plugin-transform-spread@^7.18.6")
          (s."@babel/plugin-transform-sticky-regex@^7.18.6")
          (s."@babel/plugin-transform-template-literals@^7.18.6")
          (s."@babel/plugin-transform-typeof-symbol@^7.18.6")
          (s."@babel/plugin-transform-unicode-escapes@^7.18.6")
          (s."@babel/plugin-transform-unicode-regex@^7.18.6")
          (s."@babel/preset-modules@^0.1.5")
          (s."@babel/types@^7.18.6")
          (s."babel-plugin-polyfill-corejs2@^0.3.1")
          (s."babel-plugin-polyfill-corejs3@^0.5.2")
          (s."babel-plugin-polyfill-regenerator@^0.3.1")
          (s."core-js-compat@^3.22.1")
          (s."semver@^6.3.0")
          ];
        "@babel/preset-env@^7.11.0" = s."@babel/preset-env@7.18.6";
        "@babel/preset-env@^7.12.1" = s."@babel/preset-env@7.18.6";
        "@babel/preset-env@^7.12.11" = s."@babel/preset-env@7.18.6";
        "@babel/preset-env@^7.15.6" = s."@babel/preset-env@7.18.6";
        "@babel/preset-env@^7.16.4" = s."@babel/preset-env@7.18.6";
        "@babel/preset-env@^7.18.6" = s."@babel/preset-env@7.18.6";
        "@babel/preset-flow@7.17.12" = f (sc "babel" "preset-flow") "7.17.12" (ir "https://registry.yarnpkg.com/@babel/preset-flow/-/preset-flow-7.17.12.tgz") "664a5df59190260939eee862800a255bef3bd66f" [
          (s."@babel/helper-plugin-utils@^7.17.12")
          (s."@babel/helper-validator-option@^7.16.7")
          (s."@babel/plugin-transform-flow-strip-types@^7.17.12")
          ];
        "@babel/preset-flow@^7.12.1" = s."@babel/preset-flow@7.17.12";
        "@babel/preset-modules@0.1.5" = f (sc "babel" "preset-modules") "0.1.5" (ir "https://registry.yarnpkg.com/@babel/preset-modules/-/preset-modules-0.1.5.tgz") "ef939d6e7f268827e1841638dc6ff95515e115d9" [
          (s."@babel/helper-plugin-utils@^7.0.0")
          (s."@babel/plugin-proposal-unicode-property-regex@^7.4.4")
          (s."@babel/plugin-transform-dotall-regex@^7.4.4")
          (s."@babel/types@^7.4.4")
          (s."esutils@^2.0.2")
          ];
        "@babel/preset-modules@^0.1.5" = s."@babel/preset-modules@0.1.5";
        "@babel/preset-react@7.18.6" = f (sc "babel" "preset-react") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/preset-react/-/preset-react-7.18.6.tgz") "979f76d6277048dc19094c217b507f3ad517dd2d" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-validator-option@^7.18.6")
          (s."@babel/plugin-transform-react-display-name@^7.18.6")
          (s."@babel/plugin-transform-react-jsx@^7.18.6")
          (s."@babel/plugin-transform-react-jsx-development@^7.18.6")
          (s."@babel/plugin-transform-react-pure-annotations@^7.18.6")
          ];
        "@babel/preset-react@^7.12.10" = s."@babel/preset-react@7.18.6";
        "@babel/preset-react@^7.12.5" = s."@babel/preset-react@7.18.6";
        "@babel/preset-react@^7.14.5" = s."@babel/preset-react@7.18.6";
        "@babel/preset-react@^7.16.0" = s."@babel/preset-react@7.18.6";
        "@babel/preset-react@^7.18.6" = s."@babel/preset-react@7.18.6";
        "@babel/preset-typescript@7.18.6" = f (sc "babel" "preset-typescript") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/preset-typescript/-/preset-typescript-7.18.6.tgz") "ce64be3e63eddc44240c6358daefac17b3186399" [
          (s."@babel/helper-plugin-utils@^7.18.6")
          (s."@babel/helper-validator-option@^7.18.6")
          (s."@babel/plugin-transform-typescript@^7.18.6")
          ];
        "@babel/preset-typescript@^7.12.7" = s."@babel/preset-typescript@7.18.6";
        "@babel/preset-typescript@^7.15.0" = s."@babel/preset-typescript@7.18.6";
        "@babel/preset-typescript@^7.16.0" = s."@babel/preset-typescript@7.18.6";
        "@babel/preset-typescript@^7.18.6" = s."@babel/preset-typescript@7.18.6";
        "@babel/register@7.17.7" = f (sc "babel" "register") "7.17.7" (ir "https://registry.yarnpkg.com/@babel/register/-/register-7.17.7.tgz") "5eef3e0f4afc07e25e847720e7b987ae33f08d0b" [
          (s."clone-deep@^4.0.1")
          (s."find-cache-dir@^2.0.0")
          (s."make-dir@^2.1.0")
          (s."pirates@^4.0.5")
          (s."source-map-support@^0.5.16")
          ];
        "@babel/register@^7.12.1" = s."@babel/register@7.17.7";
        "@babel/runtime-corejs3@7.18.6" = f (sc "babel" "runtime-corejs3") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/runtime-corejs3/-/runtime-corejs3-7.18.6.tgz") "6f02c5536911f4b445946a2179554b95c8838635" [
          (s."core-js-pure@^3.20.2")
          (s."regenerator-runtime@^0.13.4")
          ];
        "@babel/runtime-corejs3@^7.10.2" = s."@babel/runtime-corejs3@7.18.6";
        "@babel/runtime-corejs3@^7.18.6" = s."@babel/runtime-corejs3@7.18.6";
        "@babel/runtime@7.18.9" = f (sc "babel" "runtime") "7.18.9" (ir "https://registry.yarnpkg.com/@babel/runtime/-/runtime-7.18.9.tgz") "b4fcfce55db3d2e5e080d2490f608a3b9f407f4a" [
          (s."regenerator-runtime@^0.13.4")
          ];
        "@babel/runtime@^7.0.0" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.1.2" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.10.2" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.10.3" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.11.2" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.12.1" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.12.13" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.12.5" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.15.4" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.16.3" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.17.8" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.18.6" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.18.9" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.3.1" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.5.0" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.7.6" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.8.4" = s."@babel/runtime@7.18.9";
        "@babel/runtime@^7.9.2" = s."@babel/runtime@7.18.9";
        "@babel/template@7.16.7" = f (sc "babel" "template") "7.16.7" (ir "https://registry.yarnpkg.com/@babel/template/-/template-7.16.7.tgz") "8d126c8701fde4d66b264b3eba3d96f07666d155" [
          (s."@babel/code-frame@^7.16.7")
          (s."@babel/parser@^7.16.7")
          (s."@babel/types@^7.16.7")
          ];
        "@babel/template@7.18.6" = f (sc "babel" "template") "7.18.6" (ir "https://registry.yarnpkg.com/@babel/template/-/template-7.18.6.tgz") "1283f4993e00b929d6e2d3c72fdc9168a2977a31" [
          (s."@babel/code-frame@^7.18.6")
          (s."@babel/parser@^7.18.6")
          (s."@babel/types@^7.18.6")
          ];
        "@babel/template@^7.12.7" = s."@babel/template@7.16.7";
        "@babel/template@^7.16.7" = s."@babel/template@7.16.7";
        "@babel/template@^7.18.6" = s."@babel/template@7.18.6";
        "@babel/template@^7.3.3" = s."@babel/template@7.16.7";
        "@babel/traverse@7.18.8" = f (sc "babel" "traverse") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/traverse/-/traverse-7.18.8.tgz") "f095e62ab46abf1da35e5a2011f43aee72d8d5b0" [
          (s."@babel/code-frame@^7.18.6")
          (s."@babel/generator@^7.18.7")
          (s."@babel/helper-environment-visitor@^7.18.6")
          (s."@babel/helper-function-name@^7.18.6")
          (s."@babel/helper-hoist-variables@^7.18.6")
          (s."@babel/helper-split-export-declaration@^7.18.6")
          (s."@babel/parser@^7.18.8")
          (s."@babel/types@^7.18.8")
          (s."debug@^4.1.0")
          (s."globals@^11.1.0")
          ];
        "@babel/traverse@^7.1.6" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.12.11" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.12.9" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.13.0" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.18.0" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.18.2" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.18.6" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.18.8" = s."@babel/traverse@7.18.8";
        "@babel/traverse@^7.7.2" = s."@babel/traverse@7.18.8";
        "@babel/types@7.18.4" = f (sc "babel" "types") "7.18.4" (ir "https://registry.yarnpkg.com/@babel/types/-/types-7.18.4.tgz") "27eae9b9fd18e9dccc3f9d6ad051336f307be354" [
          (s."@babel/helper-validator-identifier@^7.16.7")
          (s."to-fast-properties@^2.0.0")
          ];
        "@babel/types@7.18.8" = f (sc "babel" "types") "7.18.8" (ir "https://registry.yarnpkg.com/@babel/types/-/types-7.18.8.tgz") "c5af199951bf41ba4a6a9a6d0d8ad722b30cd42f" [
          (s."@babel/helper-validator-identifier@^7.18.6")
          (s."to-fast-properties@^2.0.0")
          ];
        "@babel/types@^7.0.0" = s."@babel/types@7.18.4";
        "@babel/types@^7.12.11" = s."@babel/types@7.18.4";
        "@babel/types@^7.12.6" = s."@babel/types@7.18.4";
        "@babel/types@^7.12.7" = s."@babel/types@7.18.4";
        "@babel/types@^7.15.6" = s."@babel/types@7.18.4";
        "@babel/types@^7.16.0" = s."@babel/types@7.18.4";
        "@babel/types@^7.16.7" = s."@babel/types@7.18.4";
        "@babel/types@^7.17.0" = s."@babel/types@7.18.4";
        "@babel/types@^7.17.12" = s."@babel/types@7.18.4";
        "@babel/types@^7.18.0" = s."@babel/types@7.18.4";
        "@babel/types@^7.18.2" = s."@babel/types@7.18.4";
        "@babel/types@^7.18.6" = s."@babel/types@7.18.8";
        "@babel/types@^7.18.7" = s."@babel/types@7.18.8";
        "@babel/types@^7.18.8" = s."@babel/types@7.18.8";
        "@babel/types@^7.2.0" = s."@babel/types@7.18.4";
        "@babel/types@^7.3.0" = s."@babel/types@7.18.4";
        "@babel/types@^7.3.3" = s."@babel/types@7.18.4";
        "@babel/types@^7.4.4" = s."@babel/types@7.18.4";
        "@base2/pretty-print-object@1.0.1" = f (sc "base2" "pretty-print-object") "1.0.1" (ir "https://registry.yarnpkg.com/@base2/pretty-print-object/-/pretty-print-object-1.0.1.tgz") "371ba8be66d556812dc7fb169ebc3c08378f69d4" [];
        "@bcoe/v8-coverage@0.2.3" = f (sc "bcoe" "v8-coverage") "0.2.3" (ir "https://registry.yarnpkg.com/@bcoe/v8-coverage/-/v8-coverage-0.2.3.tgz") "75a2e8b51cb758a7553d6804a5932d7aace75c39" [];
        "@bcoe/v8-coverage@^0.2.3" = s."@bcoe/v8-coverage@0.2.3";
        "@cnakazawa/watch@1.0.4" = f (sc "cnakazawa" "watch") "1.0.4" (ir "https://registry.yarnpkg.com/@cnakazawa/watch/-/watch-1.0.4.tgz") "f864ae85004d0fcab6f50be9141c4da368d1656a" [
          (s."exec-sh@^0.3.2")
          (s."minimist@^1.2.0")
          ];
        "@cnakazawa/watch@^1.0.3" = s."@cnakazawa/watch@1.0.4";
        "@colors/colors@1.5.0" = f (sc "colors" "colors") "1.5.0" (ir "https://registry.yarnpkg.com/@colors/colors/-/colors-1.5.0.tgz") "bb504579c1cae923e6576a4f5da43d25f97bdbd9" [];
        "@cspotcode/source-map-support@0.8.1" = f (sc "cspotcode" "source-map-support") "0.8.1" (ir "https://registry.yarnpkg.com/@cspotcode/source-map-support/-/source-map-support-0.8.1.tgz") "00629c35a688e05a88b1cda684fb9d5e73f000a1" [
          (s."@jridgewell/trace-mapping@0.3.9")
          ];
        "@cspotcode/source-map-support@^0.8.0" = s."@cspotcode/source-map-support@0.8.1";
        "@csstools/normalize.css@*" = s."@csstools/normalize.css@12.0.0";
        "@csstools/normalize.css@12.0.0" = f (sc "csstools" "normalize.css") "12.0.0" (ir "https://registry.yarnpkg.com/@csstools/normalize.css/-/normalize.css-12.0.0.tgz") "a9583a75c3f150667771f30b60d9f059473e62c4" [];
        "@csstools/postcss-cascade-layers@1.0.3" = f (sc "csstools" "postcss-cascade-layers") "1.0.3" (ir "https://registry.yarnpkg.com/@csstools/postcss-cascade-layers/-/postcss-cascade-layers-1.0.3.tgz") "71ee4a3f00f947788097f8d67310b2e4a336aa51" [
          (s."@csstools/selector-specificity@^2.0.0")
          (s."postcss-selector-parser@^6.0.10")
          ];
        "@csstools/postcss-cascade-layers@^1.0.2" = s."@csstools/postcss-cascade-layers@1.0.3";
        "@csstools/postcss-color-function@1.1.0" = f (sc "csstools" "postcss-color-function") "1.1.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-color-function/-/postcss-color-function-1.1.0.tgz") "229966327747f58fbe586de35daa139db3ce1e5d" [
          (s."@csstools/postcss-progressive-custom-properties@^1.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-color-function@^1.1.0" = s."@csstools/postcss-color-function@1.1.0";
        "@csstools/postcss-font-format-keywords@1.0.0" = f (sc "csstools" "postcss-font-format-keywords") "1.0.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-font-format-keywords/-/postcss-font-format-keywords-1.0.0.tgz") "7e7df948a83a0dfb7eb150a96e2390ac642356a1" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-font-format-keywords@^1.0.0" = s."@csstools/postcss-font-format-keywords@1.0.0";
        "@csstools/postcss-hwb-function@1.0.1" = f (sc "csstools" "postcss-hwb-function") "1.0.1" (ir "https://registry.yarnpkg.com/@csstools/postcss-hwb-function/-/postcss-hwb-function-1.0.1.tgz") "5224db711ed09a965f85c80c18144ac1c2702fce" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-hwb-function@^1.0.1" = s."@csstools/postcss-hwb-function@1.0.1";
        "@csstools/postcss-ic-unit@1.0.0" = f (sc "csstools" "postcss-ic-unit") "1.0.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-ic-unit/-/postcss-ic-unit-1.0.0.tgz") "f484db59fc94f35a21b6d680d23b0ec69b286b7f" [
          (s."@csstools/postcss-progressive-custom-properties@^1.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-ic-unit@^1.0.0" = s."@csstools/postcss-ic-unit@1.0.0";
        "@csstools/postcss-is-pseudo-class@2.0.5" = f (sc "csstools" "postcss-is-pseudo-class") "2.0.5" (ir "https://registry.yarnpkg.com/@csstools/postcss-is-pseudo-class/-/postcss-is-pseudo-class-2.0.5.tgz") "60fea78776fc3916ad66d568064aa31029b9f772" [
          (s."@csstools/selector-specificity@^2.0.0")
          (s."postcss-selector-parser@^6.0.10")
          ];
        "@csstools/postcss-is-pseudo-class@^2.0.4" = s."@csstools/postcss-is-pseudo-class@2.0.5";
        "@csstools/postcss-normalize-display-values@1.0.0" = f (sc "csstools" "postcss-normalize-display-values") "1.0.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-normalize-display-values/-/postcss-normalize-display-values-1.0.0.tgz") "ce698f688c28517447aedf15a9037987e3d2dc97" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-normalize-display-values@^1.0.0" = s."@csstools/postcss-normalize-display-values@1.0.0";
        "@csstools/postcss-oklab-function@1.1.0" = f (sc "csstools" "postcss-oklab-function") "1.1.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-oklab-function/-/postcss-oklab-function-1.1.0.tgz") "e9a269487a292e0930760948e923e1d46b638ee6" [
          (s."@csstools/postcss-progressive-custom-properties@^1.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-oklab-function@^1.1.0" = s."@csstools/postcss-oklab-function@1.1.0";
        "@csstools/postcss-progressive-custom-properties@1.3.0" = f (sc "csstools" "postcss-progressive-custom-properties") "1.3.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-progressive-custom-properties/-/postcss-progressive-custom-properties-1.3.0.tgz") "542292558384361776b45c85226b9a3a34f276fa" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-progressive-custom-properties@^1.1.0" = s."@csstools/postcss-progressive-custom-properties@1.3.0";
        "@csstools/postcss-progressive-custom-properties@^1.3.0" = s."@csstools/postcss-progressive-custom-properties@1.3.0";
        "@csstools/postcss-stepped-value-functions@1.0.0" = f (sc "csstools" "postcss-stepped-value-functions") "1.0.0" (ir "https://registry.yarnpkg.com/@csstools/postcss-stepped-value-functions/-/postcss-stepped-value-functions-1.0.0.tgz") "f8ffc05e163ba7bcbefc5fdcaf264ce9fd408c16" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-stepped-value-functions@^1.0.0" = s."@csstools/postcss-stepped-value-functions@1.0.0";
        "@csstools/postcss-trigonometric-functions@1.0.1" = f (sc "csstools" "postcss-trigonometric-functions") "1.0.1" (ir "https://registry.yarnpkg.com/@csstools/postcss-trigonometric-functions/-/postcss-trigonometric-functions-1.0.1.tgz") "e36e61f445614193dbf6d3a8408709b0cf184a6f" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "@csstools/postcss-trigonometric-functions@^1.0.1" = s."@csstools/postcss-trigonometric-functions@1.0.1";
        "@csstools/postcss-unset-value@1.0.1" = f (sc "csstools" "postcss-unset-value") "1.0.1" (ir "https://registry.yarnpkg.com/@csstools/postcss-unset-value/-/postcss-unset-value-1.0.1.tgz") "2cc020785db5ec82cc9444afe4cdae2a65445f89" [];
        "@csstools/postcss-unset-value@^1.0.1" = s."@csstools/postcss-unset-value@1.0.1";
        "@csstools/selector-specificity@2.0.1" = f (sc "csstools" "selector-specificity") "2.0.1" (ir "https://registry.yarnpkg.com/@csstools/selector-specificity/-/selector-specificity-2.0.1.tgz") "b6b8d81780b9a9f6459f4bfe9226ac6aefaefe87" [];
        "@csstools/selector-specificity@^2.0.0" = s."@csstools/selector-specificity@2.0.1";
        "@discoveryjs/json-ext@0.5.7" = f (sc "discoveryjs" "json-ext") "0.5.7" (ir "https://registry.yarnpkg.com/@discoveryjs/json-ext/-/json-ext-0.5.7.tgz") "1d572bfbbe14b7704e0ba0f39b74815b84870d70" [];
        "@discoveryjs/json-ext@^0.5.0" = s."@discoveryjs/json-ext@0.5.7";
        "@discoveryjs/json-ext@^0.5.3" = s."@discoveryjs/json-ext@0.5.7";
        "@docsearch/css@3.1.1" = f (sc "docsearch" "css") "3.1.1" (ir "https://registry.yarnpkg.com/@docsearch/css/-/css-3.1.1.tgz") "e0976bf995e383f8ee8657306311b9cb95016330" [];
        "@docsearch/react@3.1.1" = f (sc "docsearch" "react") "3.1.1" (ir "https://registry.yarnpkg.com/@docsearch/react/-/react-3.1.1.tgz") "3dffb5db8cf9eb95d6e732cf038264bfc10191ed" [
          (s."@algolia/autocomplete-core@1.7.1")
          (s."@algolia/autocomplete-preset-algolia@1.7.1")
          (s."@docsearch/css@3.1.1")
          (s."algoliasearch@^4.0.0")
          ];
        "@docsearch/react@^3.1.1" = s."@docsearch/react@3.1.1";
        "@docusaurus/core@2.0.1" = f (sc "docusaurus" "core") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/core/-/core-2.0.1.tgz") "a2b0d653e8f18eacddda4778a46b638dd1f0f45c" [
          (s."@babel/core@^7.18.6")
          (s."@babel/generator@^7.18.7")
          (s."@babel/plugin-syntax-dynamic-import@^7.8.3")
          (s."@babel/plugin-transform-runtime@^7.18.6")
          (s."@babel/preset-env@^7.18.6")
          (s."@babel/preset-react@^7.18.6")
          (s."@babel/preset-typescript@^7.18.6")
          (s."@babel/runtime@^7.18.6")
          (s."@babel/runtime-corejs3@^7.18.6")
          (s."@babel/traverse@^7.18.8")
          (s."@docusaurus/cssnano-preset@2.0.1")
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/mdx-loader@2.0.1")
          (s."@docusaurus/react-loadable@5.5.2")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-common@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."@slorber/static-site-generator-webpack-plugin@^4.0.7")
          (s."@svgr/webpack@^6.2.1")
          (s."autoprefixer@^10.4.7")
          (s."babel-loader@^8.2.5")
          (s."babel-plugin-dynamic-import-node@^2.3.3")
          (s."boxen@^6.2.1")
          (s."chalk@^4.1.2")
          (s."chokidar@^3.5.3")
          (s."clean-css@^5.3.0")
          (s."cli-table3@^0.6.2")
          (s."combine-promises@^1.1.0")
          (s."commander@^5.1.0")
          (s."copy-webpack-plugin@^11.0.0")
          (s."core-js@^3.23.3")
          (s."css-loader@^6.7.1")
          (s."css-minimizer-webpack-plugin@^4.0.0")
          (s."cssnano@^5.1.12")
          (s."del@^6.1.1")
          (s."detect-port@^1.3.0")
          (s."escape-html@^1.0.3")
          (s."eta@^1.12.3")
          (s."file-loader@^6.2.0")
          (s."fs-extra@^10.1.0")
          (s."html-minifier-terser@^6.1.0")
          (s."html-tags@^3.2.0")
          (s."html-webpack-plugin@^5.5.0")
          (s."import-fresh@^3.3.0")
          (s."leven@^3.1.0")
          (s."lodash@^4.17.21")
          (s."mini-css-extract-plugin@^2.6.1")
          (s."postcss@^8.4.14")
          (s."postcss-loader@^7.0.0")
          (s."prompts@^2.4.2")
          (s."react-dev-utils@^12.0.1")
          (s."react-helmet-async@^1.3.0")
          (s."react-loadable@npm:@docusaurus/react-loadable@5.5.2")
          (s."react-loadable-ssr-addon-v5-slorber@^1.0.1")
          (s."react-router@^5.3.3")
          (s."react-router-config@^5.1.1")
          (s."react-router-dom@^5.3.3")
          (s."rtl-detect@^1.0.4")
          (s."semver@^7.3.7")
          (s."serve-handler@^6.1.3")
          (s."shelljs@^0.8.5")
          (s."terser-webpack-plugin@^5.3.3")
          (s."tslib@^2.4.0")
          (s."update-notifier@^5.1.0")
          (s."url-loader@^4.1.1")
          (s."wait-on@^6.0.1")
          (s."webpack@^5.73.0")
          (s."webpack-bundle-analyzer@^4.5.0")
          (s."webpack-dev-server@^4.9.3")
          (s."webpack-merge@^5.8.0")
          (s."webpackbar@^5.0.2")
          ];
        "@docusaurus/cssnano-preset@2.0.1" = f (sc "docusaurus" "cssnano-preset") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/cssnano-preset/-/cssnano-preset-2.0.1.tgz") "4d0c49338cf3aa88c5bd7cffbf77654db8e1e3b2" [
          (s."cssnano-preset-advanced@^5.3.8")
          (s."postcss@^8.4.14")
          (s."postcss-sort-media-queries@^4.2.1")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/logger@2.0.1" = f (sc "docusaurus" "logger") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/logger/-/logger-2.0.1.tgz") "78a940a333d2f654fd9dea24db2c962034d4b1ff" [
          (s."chalk@^4.1.2")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/mdx-loader@2.0.1" = f (sc "docusaurus" "mdx-loader") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/mdx-loader/-/mdx-loader-2.0.1.tgz") "cc73690ca5d356687d9e75740560b4159cd5cdb5" [
          (s."@babel/parser@^7.18.8")
          (s."@babel/traverse@^7.18.8")
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@mdx-js/mdx@^1.6.22")
          (s."escape-html@^1.0.3")
          (s."file-loader@^6.2.0")
          (s."fs-extra@^10.1.0")
          (s."image-size@^1.0.1")
          (s."mdast-util-to-string@^2.0.0")
          (s."remark-emoji@^2.2.0")
          (s."stringify-object@^3.3.0")
          (s."tslib@^2.4.0")
          (s."unified@^9.2.2")
          (s."unist-util-visit@^2.0.3")
          (s."url-loader@^4.1.1")
          (s."webpack@^5.73.0")
          ];
        "@docusaurus/module-type-aliases@2.0.1" = f (sc "docusaurus" "module-type-aliases") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/module-type-aliases/-/module-type-aliases-2.0.1.tgz") "44d7132297bedae0890695b0e7ebbe14a73e26d1" [
          (s."@docusaurus/react-loadable@5.5.2")
          (s."@docusaurus/types@2.0.1")
          (s."@types/history@^4.7.11")
          (s."@types/react@*")
          (s."@types/react-router-config@*")
          (s."@types/react-router-dom@*")
          (s."react-helmet-async@*")
          (s."react-loadable@npm:@docusaurus/react-loadable@5.5.2")
          ];
        "@docusaurus/plugin-content-blog@2.0.1" = f (sc "docusaurus" "plugin-content-blog") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-content-blog/-/plugin-content-blog-2.0.1.tgz") "a37065e18ffd26e022ffb16a21ff28199140729e" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/mdx-loader@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-common@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."cheerio@^1.0.0-rc.12")
          (s."feed@^4.2.2")
          (s."fs-extra@^10.1.0")
          (s."lodash@^4.17.21")
          (s."reading-time@^1.5.0")
          (s."tslib@^2.4.0")
          (s."unist-util-visit@^2.0.3")
          (s."utility-types@^3.10.0")
          (s."webpack@^5.73.0")
          ];
        "@docusaurus/plugin-content-docs@2.0.1" = f (sc "docusaurus" "plugin-content-docs") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-content-docs/-/plugin-content-docs-2.0.1.tgz") "4059591b4bff617e744e856ca680674b27c0b98a" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/mdx-loader@2.0.1")
          (s."@docusaurus/module-type-aliases@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."@types/react-router-config@^5.0.6")
          (s."combine-promises@^1.1.0")
          (s."fs-extra@^10.1.0")
          (s."import-fresh@^3.3.0")
          (s."js-yaml@^4.1.0")
          (s."lodash@^4.17.21")
          (s."tslib@^2.4.0")
          (s."utility-types@^3.10.0")
          (s."webpack@^5.73.0")
          ];
        "@docusaurus/plugin-content-pages@2.0.1" = f (sc "docusaurus" "plugin-content-pages") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-content-pages/-/plugin-content-pages-2.0.1.tgz") "013f2e66f80d19b5c95a2d941d67c7cdb67b7191" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/mdx-loader@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."fs-extra@^10.1.0")
          (s."tslib@^2.4.0")
          (s."webpack@^5.73.0")
          ];
        "@docusaurus/plugin-debug@2.0.1" = f (sc "docusaurus" "plugin-debug") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-debug/-/plugin-debug-2.0.1.tgz") "2b2a473f8e01fd356e32236f753665b48209bcd4" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."fs-extra@^10.1.0")
          (s."react-json-view@^1.21.3")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/plugin-google-analytics@2.0.1" = f (sc "docusaurus" "plugin-google-analytics") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-google-analytics/-/plugin-google-analytics-2.0.1.tgz") "e3b84237aad2e94dcd1cf1810c1c9bc3d94f186d" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/plugin-google-gtag@2.0.1" = f (sc "docusaurus" "plugin-google-gtag") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-google-gtag/-/plugin-google-gtag-2.0.1.tgz") "4cbcf9d520f7ec8124679fbe00867f2299a2f6bb" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/plugin-sitemap@2.0.1" = f (sc "docusaurus" "plugin-sitemap") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/plugin-sitemap/-/plugin-sitemap-2.0.1.tgz") "6f8edb82b745b040d6b1495e2798396f63e50289" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-common@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."fs-extra@^10.1.0")
          (s."sitemap@^7.1.1")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/preset-classic@2.0.1" = f (sc "docusaurus" "preset-classic") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/preset-classic/-/preset-classic-2.0.1.tgz") "21a806e16b61026d2a0efa6ca97e17397065d894" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/plugin-content-blog@2.0.1")
          (s."@docusaurus/plugin-content-docs@2.0.1")
          (s."@docusaurus/plugin-content-pages@2.0.1")
          (s."@docusaurus/plugin-debug@2.0.1")
          (s."@docusaurus/plugin-google-analytics@2.0.1")
          (s."@docusaurus/plugin-google-gtag@2.0.1")
          (s."@docusaurus/plugin-sitemap@2.0.1")
          (s."@docusaurus/theme-classic@2.0.1")
          (s."@docusaurus/theme-common@2.0.1")
          (s."@docusaurus/theme-search-algolia@2.0.1")
          (s."@docusaurus/types@2.0.1")
          ];
        "@docusaurus/react-loadable@5.5.2" = f (sc "docusaurus" "react-loadable") "5.5.2" (ir "https://registry.yarnpkg.com/@docusaurus/react-loadable/-/react-loadable-5.5.2.tgz") "81aae0db81ecafbdaee3651f12804580868fa6ce" [
          (s."@types/react@*")
          (s."prop-types@^15.6.2")
          ];
        "@docusaurus/theme-classic@2.0.1" = f (sc "docusaurus" "theme-classic") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/theme-classic/-/theme-classic-2.0.1.tgz") "043b6fcd2ecb2aecd134419b198c9f519029d5e7" [
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/mdx-loader@2.0.1")
          (s."@docusaurus/module-type-aliases@2.0.1")
          (s."@docusaurus/plugin-content-blog@2.0.1")
          (s."@docusaurus/plugin-content-docs@2.0.1")
          (s."@docusaurus/plugin-content-pages@2.0.1")
          (s."@docusaurus/theme-common@2.0.1")
          (s."@docusaurus/theme-translations@2.0.1")
          (s."@docusaurus/types@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-common@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."@mdx-js/react@^1.6.22")
          (s."clsx@^1.2.1")
          (s."copy-text-to-clipboard@^3.0.1")
          (s."infima@0.2.0-alpha.42")
          (s."lodash@^4.17.21")
          (s."nprogress@^0.2.0")
          (s."postcss@^8.4.14")
          (s."prism-react-renderer@^1.3.5")
          (s."prismjs@^1.28.0")
          (s."react-router-dom@^5.3.3")
          (s."rtlcss@^3.5.0")
          (s."tslib@^2.4.0")
          (s."utility-types@^3.10.0")
          ];
        "@docusaurus/theme-common@2.0.1" = f (sc "docusaurus" "theme-common") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/theme-common/-/theme-common-2.0.1.tgz") "9594d58fbef11fe480967b5ce4cdbb3cd78d9ca3" [
          (s."@docusaurus/mdx-loader@2.0.1")
          (s."@docusaurus/module-type-aliases@2.0.1")
          (s."@docusaurus/plugin-content-blog@2.0.1")
          (s."@docusaurus/plugin-content-docs@2.0.1")
          (s."@docusaurus/plugin-content-pages@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@types/history@^4.7.11")
          (s."@types/react@*")
          (s."@types/react-router-config@*")
          (s."clsx@^1.2.1")
          (s."parse-numeric-range@^1.3.0")
          (s."prism-react-renderer@^1.3.5")
          (s."tslib@^2.4.0")
          (s."utility-types@^3.10.0")
          ];
        "@docusaurus/theme-search-algolia@2.0.1" = f (sc "docusaurus" "theme-search-algolia") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/theme-search-algolia/-/theme-search-algolia-2.0.1.tgz") "0aab8407b2163f67eb4c48f1de33944e1695fa74" [
          (s."@docsearch/react@^3.1.1")
          (s."@docusaurus/core@2.0.1")
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/plugin-content-docs@2.0.1")
          (s."@docusaurus/theme-common@2.0.1")
          (s."@docusaurus/theme-translations@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."@docusaurus/utils-validation@2.0.1")
          (s."algoliasearch@^4.13.1")
          (s."algoliasearch-helper@^3.10.0")
          (s."clsx@^1.2.1")
          (s."eta@^1.12.3")
          (s."fs-extra@^10.1.0")
          (s."lodash@^4.17.21")
          (s."tslib@^2.4.0")
          (s."utility-types@^3.10.0")
          ];
        "@docusaurus/theme-translations@2.0.1" = f (sc "docusaurus" "theme-translations") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/theme-translations/-/theme-translations-2.0.1.tgz") "955a687c974265a811bfc743d98ef3eab0379100" [
          (s."fs-extra@^10.1.0")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/types@2.0.1" = f (sc "docusaurus" "types") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/types/-/types-2.0.1.tgz") "8696a70e85c4b9be80b38ac592d520f6fe72618b" [
          (s."@types/history@^4.7.11")
          (s."@types/react@*")
          (s."commander@^5.1.0")
          (s."joi@^17.6.0")
          (s."react-helmet-async@^1.3.0")
          (s."utility-types@^3.10.0")
          (s."webpack@^5.73.0")
          (s."webpack-merge@^5.8.0")
          ];
        "@docusaurus/utils-common@2.0.1" = f (sc "docusaurus" "utils-common") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/utils-common/-/utils-common-2.0.1.tgz") "b6f2b029547f739e1431ec84abd16974edf495e0" [
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/utils-validation@2.0.1" = f (sc "docusaurus" "utils-validation") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/utils-validation/-/utils-validation-2.0.1.tgz") "69f7d4944288d71f00fdba6dde10f05008f04308" [
          (s."@docusaurus/logger@2.0.1")
          (s."@docusaurus/utils@2.0.1")
          (s."joi@^17.6.0")
          (s."js-yaml@^4.1.0")
          (s."tslib@^2.4.0")
          ];
        "@docusaurus/utils@2.0.1" = f (sc "docusaurus" "utils") "2.0.1" (ir "https://registry.yarnpkg.com/@docusaurus/utils/-/utils-2.0.1.tgz") "37b4b42e29175e5d2d811fcbf9f93bffeca7c353" [
          (s."@docusaurus/logger@2.0.1")
          (s."@svgr/webpack@^6.2.1")
          (s."file-loader@^6.2.0")
          (s."fs-extra@^10.1.0")
          (s."github-slugger@^1.4.0")
          (s."globby@^11.1.0")
          (s."gray-matter@^4.0.3")
          (s."js-yaml@^4.1.0")
          (s."lodash@^4.17.21")
          (s."micromatch@^4.0.5")
          (s."resolve-pathname@^3.0.0")
          (s."shelljs@^0.8.5")
          (s."tslib@^2.4.0")
          (s."url-loader@^4.1.1")
          (s."webpack@^5.73.0")
          ];
        "@emotion/is-prop-valid@0.8.8" = f (sc "emotion" "is-prop-valid") "0.8.8" (ir "https://registry.yarnpkg.com/@emotion/is-prop-valid/-/is-prop-valid-0.8.8.tgz") "db28b1c4368a259b60a97311d6a952d4fd01ac1a" [
          (s."@emotion/memoize@0.7.4")
          ];
        "@emotion/is-prop-valid@^0.8.2" = s."@emotion/is-prop-valid@0.8.8";
        "@emotion/memoize@0.7.4" = f (sc "emotion" "memoize") "0.7.4" (ir "https://registry.yarnpkg.com/@emotion/memoize/-/memoize-0.7.4.tgz") "19bf0f5af19149111c40d98bb0cf82119f5d9eeb" [];
        "@eslint/eslintrc@1.3.0" = f (sc "eslint" "eslintrc") "1.3.0" (ir "https://registry.yarnpkg.com/@eslint/eslintrc/-/eslintrc-1.3.0.tgz") "29f92c30bb3e771e4a2048c95fa6855392dfac4f" [
          (s."ajv@^6.12.4")
          (s."debug@^4.3.2")
          (s."espree@^9.3.2")
          (s."globals@^13.15.0")
          (s."ignore@^5.2.0")
          (s."import-fresh@^3.2.1")
          (s."js-yaml@^4.1.0")
          (s."minimatch@^3.1.2")
          (s."strip-json-comments@^3.1.1")
          ];
        "@eslint/eslintrc@^1.3.0" = s."@eslint/eslintrc@1.3.0";
        "@floating-ui/core@1.0.0" = f (sc "floating-ui" "core") "1.0.0" (ir "https://registry.yarnpkg.com/@floating-ui/core/-/core-1.0.0.tgz") "ec1d31f54c72dd0460276e2149e59bd13c0f01f6" [];
        "@floating-ui/core@^1.0.0" = s."@floating-ui/core@1.0.0";
        "@floating-ui/dom@1.0.0" = f (sc "floating-ui" "dom") "1.0.0" (ir "https://registry.yarnpkg.com/@floating-ui/dom/-/dom-1.0.0.tgz") "66923a56755b6cb7a5958ecf25fe293912672d65" [
          (s."@floating-ui/core@^1.0.0")
          ];
        "@floating-ui/dom@^1.0.0" = s."@floating-ui/dom@1.0.0";
        "@floating-ui/react-dom-interactions@0.9.1" = f (sc "floating-ui" "react-dom-interactions") "0.9.1" (ir "https://registry.yarnpkg.com/@floating-ui/react-dom-interactions/-/react-dom-interactions-0.9.1.tgz") "93f17ed89b664795251ce5a2f228c50fc8ada059" [
          (s."@floating-ui/react-dom@^1.0.0")
          (s."aria-hidden@^1.1.3")
          ];
        "@floating-ui/react-dom-interactions@^0.9.1" = s."@floating-ui/react-dom-interactions@0.9.1";
        "@floating-ui/react-dom@1.0.0" = f (sc "floating-ui" "react-dom") "1.0.0" (ir "https://registry.yarnpkg.com/@floating-ui/react-dom/-/react-dom-1.0.0.tgz") "e0975966694433f1f0abffeee5d8e6bb69b7d16e" [
          (s."@floating-ui/dom@^1.0.0")
          ];
        "@floating-ui/react-dom@^1.0.0" = s."@floating-ui/react-dom@1.0.0";
        "@gar/promisify@1.1.3" = f (sc "gar" "promisify") "1.1.3" (ir "https://registry.yarnpkg.com/@gar/promisify/-/promisify-1.1.3.tgz") "555193ab2e3bb3b6adc3d551c9c030d9e860daf6" [];
        "@gar/promisify@^1.0.1" = s."@gar/promisify@1.1.3";
        "@glennsl/rescript-jest@0.9.1" = f (sc "glennsl" "rescript-jest") "0.9.1" (ir "https://registry.yarnpkg.com/@glennsl/rescript-jest/-/rescript-jest-0.9.1.tgz") "a85a6f0e4c3b79010b5a917c3652aa70d374e4d1" [
          (s."@ryyppy/rescript-promise@^2.1.0")
          (s."jest@^27.3.1")
          ];
        "@glennsl/rescript-jest@^0.9.0" = s."@glennsl/rescript-jest@0.9.1";
        "@hapi/hoek@9.3.0" = f (sc "hapi" "hoek") "9.3.0" (ir "https://registry.yarnpkg.com/@hapi/hoek/-/hoek-9.3.0.tgz") "8368869dcb735be2e7f5cb7647de78e167a251fb" [];
        "@hapi/hoek@^9.0.0" = s."@hapi/hoek@9.3.0";
        "@hapi/topo@5.1.0" = f (sc "hapi" "topo") "5.1.0" (ir "https://registry.yarnpkg.com/@hapi/topo/-/topo-5.1.0.tgz") "dc448e332c6c6e37a4dc02fd84ba8d44b9afb012" [
          (s."@hapi/hoek@^9.0.0")
          ];
        "@hapi/topo@^5.0.0" = s."@hapi/topo@5.1.0";
        "@headlessui/react@1.6.6" = f (sc "headlessui" "react") "1.6.6" (ir "https://registry.yarnpkg.com/@headlessui/react/-/react-1.6.6.tgz") "3073c066b85535c9d28783da0a4d9288b5354d0c" [];
        "@headlessui/react@^1.6.6" = s."@headlessui/react@1.6.6";
        "@heroicons/react@1.0.6" = f (sc "heroicons" "react") "1.0.6" (ir "https://registry.yarnpkg.com/@heroicons/react/-/react-1.0.6.tgz") "35dd26987228b39ef2316db3b1245c42eb19e324" [];
        "@heroicons/react@^1.0.6" = s."@heroicons/react@1.0.6";
        "@hookform/resolvers@2.9.7" = f (sc "hookform" "resolvers") "2.9.7" (ir "https://registry.yarnpkg.com/@hookform/resolvers/-/resolvers-2.9.7.tgz") "8b257ae67234ce0270e6b044c1a61fb98ec02b4b" [];
        "@hookform/resolvers@^2.9.7" = s."@hookform/resolvers@2.9.7";
        "@humanwhocodes/config-array@0.10.4" = f (sc "humanwhocodes" "config-array") "0.10.4" (ir "https://registry.yarnpkg.com/@humanwhocodes/config-array/-/config-array-0.10.4.tgz") "01e7366e57d2ad104feea63e72248f22015c520c" [
          (s."@humanwhocodes/object-schema@^1.2.1")
          (s."debug@^4.1.1")
          (s."minimatch@^3.0.4")
          ];
        "@humanwhocodes/config-array@^0.10.4" = s."@humanwhocodes/config-array@0.10.4";
        "@humanwhocodes/gitignore-to-minimatch@1.0.2" = f (sc "humanwhocodes" "gitignore-to-minimatch") "1.0.2" (ir "https://registry.yarnpkg.com/@humanwhocodes/gitignore-to-minimatch/-/gitignore-to-minimatch-1.0.2.tgz") "316b0a63b91c10e53f242efb4ace5c3b34e8728d" [];
        "@humanwhocodes/gitignore-to-minimatch@^1.0.2" = s."@humanwhocodes/gitignore-to-minimatch@1.0.2";
        "@humanwhocodes/object-schema@1.2.1" = f (sc "humanwhocodes" "object-schema") "1.2.1" (ir "https://registry.yarnpkg.com/@humanwhocodes/object-schema/-/object-schema-1.2.1.tgz") "b520529ec21d8e5945a1851dfd1c32e94e39ff45" [];
        "@humanwhocodes/object-schema@^1.2.1" = s."@humanwhocodes/object-schema@1.2.1";
        "@istanbuljs/load-nyc-config@1.1.0" = f (sc "istanbuljs" "load-nyc-config") "1.1.0" (ir "https://registry.yarnpkg.com/@istanbuljs/load-nyc-config/-/load-nyc-config-1.1.0.tgz") "fd3db1d59ecf7cf121e80650bb86712f9b55eced" [
          (s."camelcase@^5.3.1")
          (s."find-up@^4.1.0")
          (s."get-package-type@^0.1.0")
          (s."js-yaml@^3.13.1")
          (s."resolve-from@^5.0.0")
          ];
        "@istanbuljs/load-nyc-config@^1.0.0" = s."@istanbuljs/load-nyc-config@1.1.0";
        "@istanbuljs/nyc-config-typescript@1.0.2" = f (sc "istanbuljs" "nyc-config-typescript") "1.0.2" (ir "https://registry.yarnpkg.com/@istanbuljs/nyc-config-typescript/-/nyc-config-typescript-1.0.2.tgz") "1f5235b28540a07219ae0dd42014912a0b19cf89" [
          (s."@istanbuljs/schema@^0.1.2")
          ];
        "@istanbuljs/nyc-config-typescript@^1.0.2" = s."@istanbuljs/nyc-config-typescript@1.0.2";
        "@istanbuljs/schema@0.1.3" = f (sc "istanbuljs" "schema") "0.1.3" (ir "https://registry.yarnpkg.com/@istanbuljs/schema/-/schema-0.1.3.tgz") "e45e384e4b8ec16bce2fd903af78450f6bf7ec98" [];
        "@istanbuljs/schema@^0.1.2" = s."@istanbuljs/schema@0.1.3";
        "@istanbuljs/schema@^0.1.3" = s."@istanbuljs/schema@0.1.3";
        "@jest/console@27.5.1" = f (sc "jest" "console") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/console/-/console-27.5.1.tgz") "260fe7239602fe5130a94f1aa386eff54b014bba" [
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."jest-message-util@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."slash@^3.0.0")
          ];
        "@jest/console@28.1.1" = f (sc "jest" "console") "28.1.1" (ir "https://registry.yarnpkg.com/@jest/console/-/console-28.1.1.tgz") "305f8ca50b6e70413839f54c0e002b60a0f2fd7d" [
          (s."@jest/types@^28.1.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."jest-message-util@^28.1.1")
          (s."jest-util@^28.1.1")
          (s."slash@^3.0.0")
          ];
        "@jest/console@^27.5.1" = s."@jest/console@27.5.1";
        "@jest/console@^28.1.1" = s."@jest/console@28.1.1";
        "@jest/core@27.5.1" = f (sc "jest" "core") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/core/-/core-27.5.1.tgz") "267ac5f704e09dc52de2922cbf3af9edcd64b626" [
          (s."@jest/console@^27.5.1")
          (s."@jest/reporters@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/transform@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."ansi-escapes@^4.2.1")
          (s."chalk@^4.0.0")
          (s."emittery@^0.8.1")
          (s."exit@^0.1.2")
          (s."graceful-fs@^4.2.9")
          (s."jest-changed-files@^27.5.1")
          (s."jest-config@^27.5.1")
          (s."jest-haste-map@^27.5.1")
          (s."jest-message-util@^27.5.1")
          (s."jest-regex-util@^27.5.1")
          (s."jest-resolve@^27.5.1")
          (s."jest-resolve-dependencies@^27.5.1")
          (s."jest-runner@^27.5.1")
          (s."jest-runtime@^27.5.1")
          (s."jest-snapshot@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jest-validate@^27.5.1")
          (s."jest-watcher@^27.5.1")
          (s."micromatch@^4.0.4")
          (s."rimraf@^3.0.0")
          (s."slash@^3.0.0")
          (s."strip-ansi@^6.0.0")
          ];
        "@jest/core@^27.5.1" = s."@jest/core@27.5.1";
        "@jest/environment@27.5.1" = f (sc "jest" "environment") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/environment/-/environment-27.5.1.tgz") "d7425820511fe7158abbecc010140c3fd3be9c74" [
          (s."@jest/fake-timers@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."jest-mock@^27.5.1")
          ];
        "@jest/environment@^27.5.1" = s."@jest/environment@27.5.1";
        "@jest/fake-timers@27.5.1" = f (sc "jest" "fake-timers") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/fake-timers/-/fake-timers-27.5.1.tgz") "76979745ce0579c8a94a4678af7a748eda8ada74" [
          (s."@jest/types@^27.5.1")
          (s."@sinonjs/fake-timers@^8.0.1")
          (s."@types/node@*")
          (s."jest-message-util@^27.5.1")
          (s."jest-mock@^27.5.1")
          (s."jest-util@^27.5.1")
          ];
        "@jest/fake-timers@^27.5.1" = s."@jest/fake-timers@27.5.1";
        "@jest/globals@27.5.1" = f (sc "jest" "globals") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/globals/-/globals-27.5.1.tgz") "7ac06ce57ab966566c7963431cef458434601b2b" [
          (s."@jest/environment@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."expect@^27.5.1")
          ];
        "@jest/globals@^27.5.1" = s."@jest/globals@27.5.1";
        "@jest/reporters@27.5.1" = f (sc "jest" "reporters") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/reporters/-/reporters-27.5.1.tgz") "ceda7be96170b03c923c37987b64015812ffec04" [
          (s."@bcoe/v8-coverage@^0.2.3")
          (s."@jest/console@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/transform@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."collect-v8-coverage@^1.0.0")
          (s."exit@^0.1.2")
          (s."glob@^7.1.2")
          (s."graceful-fs@^4.2.9")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."istanbul-lib-instrument@^5.1.0")
          (s."istanbul-lib-report@^3.0.0")
          (s."istanbul-lib-source-maps@^4.0.0")
          (s."istanbul-reports@^3.1.3")
          (s."jest-haste-map@^27.5.1")
          (s."jest-resolve@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jest-worker@^27.5.1")
          (s."slash@^3.0.0")
          (s."source-map@^0.6.0")
          (s."string-length@^4.0.1")
          (s."terminal-link@^2.0.0")
          (s."v8-to-istanbul@^8.1.0")
          ];
        "@jest/reporters@^27.5.1" = s."@jest/reporters@27.5.1";
        "@jest/schemas@28.0.2" = f (sc "jest" "schemas") "28.0.2" (ir "https://registry.yarnpkg.com/@jest/schemas/-/schemas-28.0.2.tgz") "08c30df6a8d07eafea0aef9fb222c5e26d72e613" [
          (s."@sinclair/typebox@^0.23.3")
          ];
        "@jest/schemas@^28.0.2" = s."@jest/schemas@28.0.2";
        "@jest/source-map@27.5.1" = f (sc "jest" "source-map") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/source-map/-/source-map-27.5.1.tgz") "6608391e465add4205eae073b55e7f279e04e8cf" [
          (s."callsites@^3.0.0")
          (s."graceful-fs@^4.2.9")
          (s."source-map@^0.6.0")
          ];
        "@jest/source-map@^27.5.1" = s."@jest/source-map@27.5.1";
        "@jest/test-result@27.5.1" = f (sc "jest" "test-result") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/test-result/-/test-result-27.5.1.tgz") "56a6585fa80f7cdab72b8c5fc2e871d03832f5bb" [
          (s."@jest/console@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/istanbul-lib-coverage@^2.0.0")
          (s."collect-v8-coverage@^1.0.0")
          ];
        "@jest/test-result@28.1.1" = f (sc "jest" "test-result") "28.1.1" (ir "https://registry.yarnpkg.com/@jest/test-result/-/test-result-28.1.1.tgz") "c6f18d1bbb01aa88925dd687872a75f8414b317a" [
          (s."@jest/console@^28.1.1")
          (s."@jest/types@^28.1.1")
          (s."@types/istanbul-lib-coverage@^2.0.0")
          (s."collect-v8-coverage@^1.0.0")
          ];
        "@jest/test-result@^27.5.1" = s."@jest/test-result@27.5.1";
        "@jest/test-result@^28.1.1" = s."@jest/test-result@28.1.1";
        "@jest/test-sequencer@27.5.1" = f (sc "jest" "test-sequencer") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/test-sequencer/-/test-sequencer-27.5.1.tgz") "4057e0e9cea4439e544c6353c6affe58d095745b" [
          (s."@jest/test-result@^27.5.1")
          (s."graceful-fs@^4.2.9")
          (s."jest-haste-map@^27.5.1")
          (s."jest-runtime@^27.5.1")
          ];
        "@jest/test-sequencer@^27.5.1" = s."@jest/test-sequencer@27.5.1";
        "@jest/transform@26.6.2" = f (sc "jest" "transform") "26.6.2" (ir "https://registry.yarnpkg.com/@jest/transform/-/transform-26.6.2.tgz") "5ac57c5fa1ad17b2aae83e73e45813894dcf2e4b" [
          (s."@babel/core@^7.1.0")
          (s."@jest/types@^26.6.2")
          (s."babel-plugin-istanbul@^6.0.0")
          (s."chalk@^4.0.0")
          (s."convert-source-map@^1.4.0")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."graceful-fs@^4.2.4")
          (s."jest-haste-map@^26.6.2")
          (s."jest-regex-util@^26.0.0")
          (s."jest-util@^26.6.2")
          (s."micromatch@^4.0.2")
          (s."pirates@^4.0.1")
          (s."slash@^3.0.0")
          (s."source-map@^0.6.1")
          (s."write-file-atomic@^3.0.0")
          ];
        "@jest/transform@27.5.1" = f (sc "jest" "transform") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/transform/-/transform-27.5.1.tgz") "6c3501dcc00c4c08915f292a600ece5ecfe1f409" [
          (s."@babel/core@^7.1.0")
          (s."@jest/types@^27.5.1")
          (s."babel-plugin-istanbul@^6.1.1")
          (s."chalk@^4.0.0")
          (s."convert-source-map@^1.4.0")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."graceful-fs@^4.2.9")
          (s."jest-haste-map@^27.5.1")
          (s."jest-regex-util@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."micromatch@^4.0.4")
          (s."pirates@^4.0.4")
          (s."slash@^3.0.0")
          (s."source-map@^0.6.1")
          (s."write-file-atomic@^3.0.0")
          ];
        "@jest/transform@^26.6.2" = s."@jest/transform@26.6.2";
        "@jest/transform@^27.5.1" = s."@jest/transform@27.5.1";
        "@jest/types@26.6.2" = f (sc "jest" "types") "26.6.2" (ir "https://registry.yarnpkg.com/@jest/types/-/types-26.6.2.tgz") "bef5a532030e1d88a2f5a6d933f84e97226ed48e" [
          (s."@types/istanbul-lib-coverage@^2.0.0")
          (s."@types/istanbul-reports@^3.0.0")
          (s."@types/node@*")
          (s."@types/yargs@^15.0.0")
          (s."chalk@^4.0.0")
          ];
        "@jest/types@27.5.1" = f (sc "jest" "types") "27.5.1" (ir "https://registry.yarnpkg.com/@jest/types/-/types-27.5.1.tgz") "3c79ec4a8ba61c170bf937bcf9e98a9df175ec80" [
          (s."@types/istanbul-lib-coverage@^2.0.0")
          (s."@types/istanbul-reports@^3.0.0")
          (s."@types/node@*")
          (s."@types/yargs@^16.0.0")
          (s."chalk@^4.0.0")
          ];
        "@jest/types@28.1.1" = f (sc "jest" "types") "28.1.1" (ir "https://registry.yarnpkg.com/@jest/types/-/types-28.1.1.tgz") "d059bbc80e6da6eda9f081f293299348bd78ee0b" [
          (s."@jest/schemas@^28.0.2")
          (s."@types/istanbul-lib-coverage@^2.0.0")
          (s."@types/istanbul-reports@^3.0.0")
          (s."@types/node@*")
          (s."@types/yargs@^17.0.8")
          (s."chalk@^4.0.0")
          ];
        "@jest/types@^26.6.2" = s."@jest/types@26.6.2";
        "@jest/types@^27.5.1" = s."@jest/types@27.5.1";
        "@jest/types@^28.1.1" = s."@jest/types@28.1.1";
        "@jridgewell/gen-mapping@0.1.1" = f (sc "jridgewell" "gen-mapping") "0.1.1" (ir "https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.1.1.tgz") "e5d2e450306a9491e3bd77e323e38d7aff315996" [
          (s."@jridgewell/set-array@^1.0.0")
          (s."@jridgewell/sourcemap-codec@^1.4.10")
          ];
        "@jridgewell/gen-mapping@0.3.1" = f (sc "jridgewell" "gen-mapping") "0.3.1" (ir "https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.1.tgz") "cf92a983c83466b8c0ce9124fadeaf09f7c66ea9" [
          (s."@jridgewell/set-array@^1.0.0")
          (s."@jridgewell/sourcemap-codec@^1.4.10")
          (s."@jridgewell/trace-mapping@^0.3.9")
          ];
        "@jridgewell/gen-mapping@0.3.2" = f (sc "jridgewell" "gen-mapping") "0.3.2" (ir "https://registry.yarnpkg.com/@jridgewell/gen-mapping/-/gen-mapping-0.3.2.tgz") "c1aedc61e853f2bb9f5dfe6d4442d3b565b253b9" [
          (s."@jridgewell/set-array@^1.0.1")
          (s."@jridgewell/sourcemap-codec@^1.4.10")
          (s."@jridgewell/trace-mapping@^0.3.9")
          ];
        "@jridgewell/gen-mapping@^0.1.0" = s."@jridgewell/gen-mapping@0.1.1";
        "@jridgewell/gen-mapping@^0.3.0" = s."@jridgewell/gen-mapping@0.3.1";
        "@jridgewell/gen-mapping@^0.3.2" = s."@jridgewell/gen-mapping@0.3.2";
        "@jridgewell/resolve-uri@3.0.7" = f (sc "jridgewell" "resolve-uri") "3.0.7" (ir "https://registry.yarnpkg.com/@jridgewell/resolve-uri/-/resolve-uri-3.0.7.tgz") "30cd49820a962aff48c8fffc5cd760151fca61fe" [];
        "@jridgewell/resolve-uri@^3.0.3" = s."@jridgewell/resolve-uri@3.0.7";
        "@jridgewell/set-array@1.1.1" = f (sc "jridgewell" "set-array") "1.1.1" (ir "https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.1.1.tgz") "36a6acc93987adcf0ba50c66908bd0b70de8afea" [];
        "@jridgewell/set-array@1.1.2" = f (sc "jridgewell" "set-array") "1.1.2" (ir "https://registry.yarnpkg.com/@jridgewell/set-array/-/set-array-1.1.2.tgz") "7c6cf998d6d20b914c0a55a91ae928ff25965e72" [];
        "@jridgewell/set-array@^1.0.0" = s."@jridgewell/set-array@1.1.1";
        "@jridgewell/set-array@^1.0.1" = s."@jridgewell/set-array@1.1.2";
        "@jridgewell/source-map@0.3.2" = f (sc "jridgewell" "source-map") "0.3.2" (ir "https://registry.yarnpkg.com/@jridgewell/source-map/-/source-map-0.3.2.tgz") "f45351aaed4527a298512ec72f81040c998580fb" [
          (s."@jridgewell/gen-mapping@^0.3.0")
          (s."@jridgewell/trace-mapping@^0.3.9")
          ];
        "@jridgewell/source-map@^0.3.2" = s."@jridgewell/source-map@0.3.2";
        "@jridgewell/sourcemap-codec@1.4.13" = f (sc "jridgewell" "sourcemap-codec") "1.4.13" (ir "https://registry.yarnpkg.com/@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.13.tgz") "b6461fb0c2964356c469e115f504c95ad97ab88c" [];
        "@jridgewell/sourcemap-codec@^1.4.10" = s."@jridgewell/sourcemap-codec@1.4.13";
        "@jridgewell/trace-mapping@0.3.13" = f (sc "jridgewell" "trace-mapping") "0.3.13" (ir "https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.13.tgz") "dcfe3e95f224c8fe97a87a5235defec999aa92ea" [
          (s."@jridgewell/resolve-uri@^3.0.3")
          (s."@jridgewell/sourcemap-codec@^1.4.10")
          ];
        "@jridgewell/trace-mapping@0.3.9" = f (sc "jridgewell" "trace-mapping") "0.3.9" (ir "https://registry.yarnpkg.com/@jridgewell/trace-mapping/-/trace-mapping-0.3.9.tgz") "6534fd5933a53ba7cbf3a17615e273a0d1273ff9" [
          (s."@jridgewell/resolve-uri@^3.0.3")
          (s."@jridgewell/sourcemap-codec@^1.4.10")
          ];
        "@jridgewell/trace-mapping@^0.3.12" = s."@jridgewell/trace-mapping@0.3.13";
        "@jridgewell/trace-mapping@^0.3.7" = s."@jridgewell/trace-mapping@0.3.13";
        "@jridgewell/trace-mapping@^0.3.9" = s."@jridgewell/trace-mapping@0.3.13";
        "@juggle/resize-observer@3.3.1" = f (sc "juggle" "resize-observer") "3.3.1" (ir "https://registry.yarnpkg.com/@juggle/resize-observer/-/resize-observer-3.3.1.tgz") "b50a781709c81e10701004214340f25475a171a0" [];
        "@juggle/resize-observer@^3.3.1" = s."@juggle/resize-observer@3.3.1";
        "@leichtgewicht/ip-codec@2.0.4" = f (sc "leichtgewicht" "ip-codec") "2.0.4" (ir "https://registry.yarnpkg.com/@leichtgewicht/ip-codec/-/ip-codec-2.0.4.tgz") "b2ac626d6cb9c8718ab459166d4bb405b8ffa78b" [];
        "@leichtgewicht/ip-codec@^2.0.1" = s."@leichtgewicht/ip-codec@2.0.4";
        "@mdx-js/mdx@1.6.22" = f (sc "mdx-js" "mdx") "1.6.22" (ir "https://registry.yarnpkg.com/@mdx-js/mdx/-/mdx-1.6.22.tgz") "8a723157bf90e78f17dc0f27995398e6c731f1ba" [
          (s."@babel/core@7.12.9")
          (s."@babel/plugin-syntax-jsx@7.12.1")
          (s."@babel/plugin-syntax-object-rest-spread@7.8.3")
          (s."@mdx-js/util@1.6.22")
          (s."babel-plugin-apply-mdx-type-prop@1.6.22")
          (s."babel-plugin-extract-import-names@1.6.22")
          (s."camelcase-css@2.0.1")
          (s."detab@2.0.4")
          (s."hast-util-raw@6.0.1")
          (s."lodash.uniq@4.5.0")
          (s."mdast-util-to-hast@10.0.1")
          (s."remark-footnotes@2.0.0")
          (s."remark-mdx@1.6.22")
          (s."remark-parse@8.0.3")
          (s."remark-squeeze-paragraphs@4.0.0")
          (s."style-to-object@0.3.0")
          (s."unified@9.2.0")
          (s."unist-builder@2.0.3")
          (s."unist-util-visit@2.0.3")
          ];
        "@mdx-js/mdx@^1.6.22" = s."@mdx-js/mdx@1.6.22";
        "@mdx-js/react@1.6.22" = f (sc "mdx-js" "react") "1.6.22" (ir "https://registry.yarnpkg.com/@mdx-js/react/-/react-1.6.22.tgz") "ae09b4744fddc74714ee9f9d6f17a66e77c43573" [];
        "@mdx-js/react@^1.6.22" = s."@mdx-js/react@1.6.22";
        "@mdx-js/util@1.6.22" = f (sc "mdx-js" "util") "1.6.22" (ir "https://registry.yarnpkg.com/@mdx-js/util/-/util-1.6.22.tgz") "219dfd89ae5b97a8801f015323ffa4b62f45718b" [];
        "@motionone/animation@10.12.0" = f (sc "motionone" "animation") "10.12.0" (ir "https://registry.yarnpkg.com/@motionone/animation/-/animation-10.12.0.tgz") "bca8968d3d9c779f8a548678f24206bd36cc60b6" [
          (s."@motionone/easing@^10.12.0")
          (s."@motionone/types@^10.12.0")
          (s."@motionone/utils@^10.12.0")
          (s."tslib@^2.3.1")
          ];
        "@motionone/animation@^10.12.0" = s."@motionone/animation@10.12.0";
        "@motionone/dom@10.12.0" = f (sc "motionone" "dom") "10.12.0" (ir "https://registry.yarnpkg.com/@motionone/dom/-/dom-10.12.0.tgz") "ae30827fd53219efca4e1150a5ff2165c28351ed" [
          (s."@motionone/animation@^10.12.0")
          (s."@motionone/generators@^10.12.0")
          (s."@motionone/types@^10.12.0")
          (s."@motionone/utils@^10.12.0")
          (s."hey-listen@^1.0.8")
          (s."tslib@^2.3.1")
          ];
        "@motionone/easing@10.12.0" = f (sc "motionone" "easing") "10.12.0" (ir "https://registry.yarnpkg.com/@motionone/easing/-/easing-10.12.0.tgz") "cc10a00ed5ec9a7a05daf4ef985fcd14840b9a50" [
          (s."@motionone/utils@^10.12.0")
          (s."tslib@^2.3.1")
          ];
        "@motionone/easing@^10.12.0" = s."@motionone/easing@10.12.0";
        "@motionone/generators@10.12.0" = f (sc "motionone" "generators") "10.12.0" (ir "https://registry.yarnpkg.com/@motionone/generators/-/generators-10.12.0.tgz") "2a175c47c741ed3864dd834e6c98efa68798a866" [
          (s."@motionone/types@^10.12.0")
          (s."@motionone/utils@^10.12.0")
          (s."tslib@^2.3.1")
          ];
        "@motionone/generators@^10.12.0" = s."@motionone/generators@10.12.0";
        "@motionone/types@10.12.0" = f (sc "motionone" "types") "10.12.0" (ir "https://registry.yarnpkg.com/@motionone/types/-/types-10.12.0.tgz") "06ede843d4c2990edbd22ecf8d5568d1fcd1f105" [];
        "@motionone/types@^10.12.0" = s."@motionone/types@10.12.0";
        "@motionone/utils@10.12.0" = f (sc "motionone" "utils") "10.12.0" (ir "https://registry.yarnpkg.com/@motionone/utils/-/utils-10.12.0.tgz") "e8432a96bb7f91148987d0baaab6653ae727f9ee" [
          (s."@motionone/types@^10.12.0")
          (s."hey-listen@^1.0.8")
          (s."tslib@^2.3.1")
          ];
        "@motionone/utils@^10.12.0" = s."@motionone/utils@10.12.0";
        "@mrmlnc/readdir-enhanced@2.2.1" = f (sc "mrmlnc" "readdir-enhanced") "2.2.1" (ir "https://registry.yarnpkg.com/@mrmlnc/readdir-enhanced/-/readdir-enhanced-2.2.1.tgz") "524af240d1a360527b730475ecfa1344aa540dde" [
          (s."call-me-maybe@^1.0.1")
          (s."glob-to-regexp@^0.3.0")
          ];
        "@mrmlnc/readdir-enhanced@^2.2.1" = s."@mrmlnc/readdir-enhanced@2.2.1";
        "@nodelib/fs.scandir@2.1.5" = f (sc "nodelib" "fs.scandir") "2.1.5" (ir "https://registry.yarnpkg.com/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz") "7619c2eb21b25483f6d167548b4cfd5a7488c3d5" [
          (s."@nodelib/fs.stat@2.0.5")
          (s."run-parallel@^1.1.9")
          ];
        "@nodelib/fs.stat@1.1.3" = f (sc "nodelib" "fs.stat") "1.1.3" (ir "https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-1.1.3.tgz") "2b5a3ab3f918cca48a8c754c08168e3f03eba61b" [];
        "@nodelib/fs.stat@2.0.5" = f (sc "nodelib" "fs.stat") "2.0.5" (ir "https://registry.yarnpkg.com/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz") "5bd262af94e9d25bd1e71b05deed44876a222e8b" [];
        "@nodelib/fs.stat@^1.1.2" = s."@nodelib/fs.stat@1.1.3";
        "@nodelib/fs.stat@^2.0.2" = s."@nodelib/fs.stat@2.0.5";
        "@nodelib/fs.walk@1.2.8" = f (sc "nodelib" "fs.walk") "1.2.8" (ir "https://registry.yarnpkg.com/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz") "e95737e8bb6746ddedf69c556953494f196fe69a" [
          (s."@nodelib/fs.scandir@2.1.5")
          (s."fastq@^1.6.0")
          ];
        "@nodelib/fs.walk@^1.2.3" = s."@nodelib/fs.walk@1.2.8";
        "@npmcli/fs@1.1.1" = f (sc "npmcli" "fs") "1.1.1" (ir "https://registry.yarnpkg.com/@npmcli/fs/-/fs-1.1.1.tgz") "72f719fe935e687c56a4faecf3c03d06ba593257" [
          (s."@gar/promisify@^1.0.1")
          (s."semver@^7.3.5")
          ];
        "@npmcli/fs@^1.0.0" = s."@npmcli/fs@1.1.1";
        "@npmcli/move-file@1.1.2" = f (sc "npmcli" "move-file") "1.1.2" (ir "https://registry.yarnpkg.com/@npmcli/move-file/-/move-file-1.1.2.tgz") "1a82c3e372f7cae9253eb66d72543d6b8685c674" [
          (s."mkdirp@^1.0.4")
          (s."rimraf@^3.0.2")
          ];
        "@npmcli/move-file@^1.0.1" = s."@npmcli/move-file@1.1.2";
        "@pmmmwh/react-refresh-webpack-plugin@0.5.7" = f (sc "pmmmwh" "react-refresh-webpack-plugin") "0.5.7" (ir "https://registry.yarnpkg.com/@pmmmwh/react-refresh-webpack-plugin/-/react-refresh-webpack-plugin-0.5.7.tgz") "58f8217ba70069cc6a73f5d7e05e85b458c150e2" [
          (s."ansi-html-community@^0.0.8")
          (s."common-path-prefix@^3.0.0")
          (s."core-js-pure@^3.8.1")
          (s."error-stack-parser@^2.0.6")
          (s."find-up@^5.0.0")
          (s."html-entities@^2.1.0")
          (s."loader-utils@^2.0.0")
          (s."schema-utils@^3.0.0")
          (s."source-map@^0.7.3")
          ];
        "@pmmmwh/react-refresh-webpack-plugin@^0.5.1" = s."@pmmmwh/react-refresh-webpack-plugin@0.5.7";
        "@pmmmwh/react-refresh-webpack-plugin@^0.5.3" = s."@pmmmwh/react-refresh-webpack-plugin@0.5.7";
        "@polka/url@1.0.0-next.21" = f (sc "polka" "url") "1.0.0-next.21" (ir "https://registry.yarnpkg.com/@polka/url/-/url-1.0.0-next.21.tgz") "5de5a2385a35309427f6011992b544514d559aa1" [];
        "@polka/url@^1.0.0-next.20" = s."@polka/url@1.0.0-next.21";
        "@react-hook/latest@1.0.3" = f (sc "react-hook" "latest") "1.0.3" (ir "https://registry.yarnpkg.com/@react-hook/latest/-/latest-1.0.3.tgz") "c2d1d0b0af8b69ec6e2b3a2412ba0768ac82db80" [];
        "@react-hook/latest@^1.0.2" = s."@react-hook/latest@1.0.3";
        "@react-hook/passive-layout-effect@1.2.1" = f (sc "react-hook" "passive-layout-effect") "1.2.1" (ir "https://registry.yarnpkg.com/@react-hook/passive-layout-effect/-/passive-layout-effect-1.2.1.tgz") "c06dac2d011f36d61259aa1c6df4f0d5e28bc55e" [];
        "@react-hook/passive-layout-effect@^1.2.0" = s."@react-hook/passive-layout-effect@1.2.1";
        "@react-hook/resize-observer@1.2.5" = f (sc "react-hook" "resize-observer") "1.2.5" (ir "https://registry.yarnpkg.com/@react-hook/resize-observer/-/resize-observer-1.2.5.tgz") "b59e2300de98bc6ddc6946942f21243cde10f984" [
          (s."@juggle/resize-observer@^3.3.1")
          (s."@react-hook/latest@^1.0.2")
          (s."@react-hook/passive-layout-effect@^1.2.0")
          (s."@types/raf-schd@^4.0.0")
          (s."raf-schd@^4.0.2")
          ];
        "@react-hook/resize-observer@^1.2.1" = s."@react-hook/resize-observer@1.2.5";
        "@react-hook/size@2.1.2" = f (sc "react-hook" "size") "2.1.2" (ir "https://registry.yarnpkg.com/@react-hook/size/-/size-2.1.2.tgz") "87ed634ffb200f65d3e823501e5559aa3d584451" [
          (s."@react-hook/passive-layout-effect@^1.2.0")
          (s."@react-hook/resize-observer@^1.2.1")
          ];
        "@react-hook/size@^2.1.2" = s."@react-hook/size@2.1.2";
        "@rescript/std@9.1.4" = f (sc "rescript" "std") "9.1.4" (ir "https://registry.yarnpkg.com/@rescript/std/-/std-9.1.4.tgz") "94971cb504b10d36d470618fa1c6f0a2d03a6b9b" [];
        "@rescript/std@^9.1.4" = s."@rescript/std@9.1.4";
        "@rollup/plugin-babel@5.3.1" = f (sc "rollup" "plugin-babel") "5.3.1" (ir "https://registry.yarnpkg.com/@rollup/plugin-babel/-/plugin-babel-5.3.1.tgz") "04bc0608f4aa4b2e4b1aebf284344d0f68fda283" [
          (s."@babel/helper-module-imports@^7.10.4")
          (s."@rollup/pluginutils@^3.1.0")
          ];
        "@rollup/plugin-babel@^5.2.0" = s."@rollup/plugin-babel@5.3.1";
        "@rollup/plugin-node-resolve@11.2.1" = f (sc "rollup" "plugin-node-resolve") "11.2.1" (ir "https://registry.yarnpkg.com/@rollup/plugin-node-resolve/-/plugin-node-resolve-11.2.1.tgz") "82aa59397a29cd4e13248b106e6a4a1880362a60" [
          (s."@rollup/pluginutils@^3.1.0")
          (s."@types/resolve@1.17.1")
          (s."builtin-modules@^3.1.0")
          (s."deepmerge@^4.2.2")
          (s."is-module@^1.0.0")
          (s."resolve@^1.19.0")
          ];
        "@rollup/plugin-node-resolve@^11.2.1" = s."@rollup/plugin-node-resolve@11.2.1";
        "@rollup/plugin-replace@2.4.2" = f (sc "rollup" "plugin-replace") "2.4.2" (ir "https://registry.yarnpkg.com/@rollup/plugin-replace/-/plugin-replace-2.4.2.tgz") "a2d539314fbc77c244858faa523012825068510a" [
          (s."@rollup/pluginutils@^3.1.0")
          (s."magic-string@^0.25.7")
          ];
        "@rollup/plugin-replace@^2.4.1" = s."@rollup/plugin-replace@2.4.2";
        "@rollup/pluginutils@3.1.0" = f (sc "rollup" "pluginutils") "3.1.0" (ir "https://registry.yarnpkg.com/@rollup/pluginutils/-/pluginutils-3.1.0.tgz") "706b4524ee6dc8b103b3c995533e5ad680c02b9b" [
          (s."@types/estree@0.0.39")
          (s."estree-walker@^1.0.1")
          (s."picomatch@^2.2.2")
          ];
        "@rollup/pluginutils@^3.1.0" = s."@rollup/pluginutils@3.1.0";
        "@rushstack/eslint-patch@1.1.3" = f (sc "rushstack" "eslint-patch") "1.1.3" (ir "https://registry.yarnpkg.com/@rushstack/eslint-patch/-/eslint-patch-1.1.3.tgz") "6801033be7ff87a6b7cadaf5b337c9f366a3c4b0" [];
        "@rushstack/eslint-patch@^1.1.0" = s."@rushstack/eslint-patch@1.1.3";
        "@ryyppy/rescript-promise@2.1.0" = f (sc "ryyppy" "rescript-promise") "2.1.0" (ir "https://registry.yarnpkg.com/@ryyppy/rescript-promise/-/rescript-promise-2.1.0.tgz") "a33861274c41360cfbe872cf489f3dcb8dd526e6" [];
        "@ryyppy/rescript-promise@^2.1.0" = s."@ryyppy/rescript-promise@2.1.0";
        "@sideway/address@4.1.4" = f (sc "sideway" "address") "4.1.4" (ir "https://registry.yarnpkg.com/@sideway/address/-/address-4.1.4.tgz") "03dccebc6ea47fdc226f7d3d1ad512955d4783f0" [
          (s."@hapi/hoek@^9.0.0")
          ];
        "@sideway/address@^4.1.3" = s."@sideway/address@4.1.4";
        "@sideway/formula@3.0.0" = f (sc "sideway" "formula") "3.0.0" (ir "https://registry.yarnpkg.com/@sideway/formula/-/formula-3.0.0.tgz") "fe158aee32e6bd5de85044be615bc08478a0a13c" [];
        "@sideway/formula@^3.0.0" = s."@sideway/formula@3.0.0";
        "@sideway/pinpoint@2.0.0" = f (sc "sideway" "pinpoint") "2.0.0" (ir "https://registry.yarnpkg.com/@sideway/pinpoint/-/pinpoint-2.0.0.tgz") "cff8ffadc372ad29fd3f78277aeb29e632cc70df" [];
        "@sideway/pinpoint@^2.0.0" = s."@sideway/pinpoint@2.0.0";
        "@sinclair/typebox@0.23.5" = f (sc "sinclair" "typebox") "0.23.5" (ir "https://registry.yarnpkg.com/@sinclair/typebox/-/typebox-0.23.5.tgz") "93f7b9f4e3285a7a9ade7557d9a8d36809cbc47d" [];
        "@sinclair/typebox@^0.23.3" = s."@sinclair/typebox@0.23.5";
        "@sindresorhus/is@0.14.0" = f (sc "sindresorhus" "is") "0.14.0" (ir "https://registry.yarnpkg.com/@sindresorhus/is/-/is-0.14.0.tgz") "9fb3a3cf3132328151f353de4632e01e52102bea" [];
        "@sindresorhus/is@^0.14.0" = s."@sindresorhus/is@0.14.0";
        "@sinonjs/commons@1.8.3" = f (sc "sinonjs" "commons") "1.8.3" (ir "https://registry.yarnpkg.com/@sinonjs/commons/-/commons-1.8.3.tgz") "3802ddd21a50a949b6721ddd72da36e67e7f1b2d" [
          (s."type-detect@4.0.8")
          ];
        "@sinonjs/commons@^1.7.0" = s."@sinonjs/commons@1.8.3";
        "@sinonjs/fake-timers@8.1.0" = f (sc "sinonjs" "fake-timers") "8.1.0" (ir "https://registry.yarnpkg.com/@sinonjs/fake-timers/-/fake-timers-8.1.0.tgz") "3fdc2b6cb58935b21bfb8d1625eb1300484316e7" [
          (s."@sinonjs/commons@^1.7.0")
          ];
        "@sinonjs/fake-timers@^8.0.1" = s."@sinonjs/fake-timers@8.1.0";
        "@slorber/static-site-generator-webpack-plugin@4.0.7" = f (sc "slorber" "static-site-generator-webpack-plugin") "4.0.7" (ir "https://registry.yarnpkg.com/@slorber/static-site-generator-webpack-plugin/-/static-site-generator-webpack-plugin-4.0.7.tgz") "fc1678bddefab014e2145cbe25b3ce4e1cfc36f3" [
          (s."eval@^0.1.8")
          (s."p-map@^4.0.0")
          (s."webpack-sources@^3.2.2")
          ];
        "@slorber/static-site-generator-webpack-plugin@^4.0.7" = s."@slorber/static-site-generator-webpack-plugin@4.0.7";
        "@stdlib/array@0.0.12" = f (sc "stdlib" "array") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/array/-/array-0.0.12.tgz") "12f40ab95bb36d424cdad991f29fc3cb491ee29e" [
          (s."@stdlib/assert@^0.0.x")
          (s."@stdlib/blas@^0.0.x")
          (s."@stdlib/complex@^0.0.x")
          (s."@stdlib/constants@^0.0.x")
          (s."@stdlib/math@^0.0.x")
          (s."@stdlib/symbol@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          (s."@stdlib/utils@^0.0.x")
          ];
        "@stdlib/array@^0.0.x" = s."@stdlib/array@0.0.12";
        "@stdlib/assert@0.0.12" = f (sc "stdlib" "assert") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/assert/-/assert-0.0.12.tgz") "1648c9016e5041291f55a6464abcc4069c5103ce" [
          (s."@stdlib/cli@^0.0.x")
          (s."@stdlib/complex@^0.0.x")
          (s."@stdlib/constants@^0.0.x")
          (s."@stdlib/fs@^0.0.x")
          (s."@stdlib/math@^0.0.x")
          (s."@stdlib/ndarray@^0.0.x")
          (s."@stdlib/number@^0.0.x")
          (s."@stdlib/os@^0.0.x")
          (s."@stdlib/process@^0.0.x")
          (s."@stdlib/regexp@^0.0.x")
          (s."@stdlib/streams@^0.0.x")
          (s."@stdlib/string@^0.0.x")
          (s."@stdlib/symbol@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          (s."@stdlib/utils@^0.0.x")
          ];
        "@stdlib/assert@^0.0.x" = s."@stdlib/assert@0.0.12";
        "@stdlib/bigint@0.0.11" = f (sc "stdlib" "bigint") "0.0.11" (ir "https://registry.yarnpkg.com/@stdlib/bigint/-/bigint-0.0.11.tgz") "c416a1d727001c55f4897e6424124199d638f2fd" [];
        "@stdlib/bigint@^0.0.x" = s."@stdlib/bigint@0.0.11";
        "@stdlib/blas@0.0.12" = f (sc "stdlib" "blas") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/blas/-/blas-0.0.12.tgz") "7e93e42b4621fc6903bf63264f045047333536c2" [
          (s."@stdlib/math@^0.0.x")
          (s."@stdlib/number@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/blas@^0.0.x" = s."@stdlib/blas@0.0.12";
        "@stdlib/buffer@0.0.11" = f (sc "stdlib" "buffer") "0.0.11" (ir "https://registry.yarnpkg.com/@stdlib/buffer/-/buffer-0.0.11.tgz") "6137b00845e6c905181cc7ebfae9f7e47c01b0ce" [
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/buffer@^0.0.x" = s."@stdlib/buffer@0.0.11";
        "@stdlib/cli@0.0.10" = f (sc "stdlib" "cli") "0.0.10" (ir "https://registry.yarnpkg.com/@stdlib/cli/-/cli-0.0.10.tgz") "28e2fbe6865d7f5cd15b7dc5846c99bd3b91674f" [
          (s."@stdlib/utils@^0.0.x")
          (s."minimist@^1.2.0")
          ];
        "@stdlib/cli@^0.0.x" = s."@stdlib/cli@0.0.10";
        "@stdlib/complex@0.0.12" = f (sc "stdlib" "complex") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/complex/-/complex-0.0.12.tgz") "3afbc190cd0a9b37fc7c6e508c3aa9fda9106944" [
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/complex@^0.0.x" = s."@stdlib/complex@0.0.12";
        "@stdlib/constants@0.0.11" = f (sc "stdlib" "constants") "0.0.11" (ir "https://registry.yarnpkg.com/@stdlib/constants/-/constants-0.0.11.tgz") "78cd56d6c2982b30264843c3d75bde7125e90cd2" [
          (s."@stdlib/number@^0.0.x")
          ];
        "@stdlib/constants@^0.0.x" = s."@stdlib/constants@0.0.11";
        "@stdlib/fs@0.0.12" = f (sc "stdlib" "fs") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/fs/-/fs-0.0.12.tgz") "662365fd5846a51f075724b4f2888ae88441b70d" [
          (s."@stdlib/process@^0.0.x")
          (s."@stdlib/string@^0.0.x")
          (s."debug@^2.6.9")
          ];
        "@stdlib/fs@^0.0.x" = s."@stdlib/fs@0.0.12";
        "@stdlib/math@0.0.11" = f (sc "stdlib" "math") "0.0.11" (ir "https://registry.yarnpkg.com/@stdlib/math/-/math-0.0.11.tgz") "eb6638bc03a20fbd6727dd5b977ee0170bda4649" [
          (s."@stdlib/constants@^0.0.x")
          (s."@stdlib/ndarray@^0.0.x")
          (s."@stdlib/number@^0.0.x")
          (s."@stdlib/strided@^0.0.x")
          (s."@stdlib/symbol@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          (s."debug@^2.6.9")
          ];
        "@stdlib/math@^0.0.x" = s."@stdlib/math@0.0.11";
        "@stdlib/ndarray@0.0.13" = f (sc "stdlib" "ndarray") "0.0.13" (ir "https://registry.yarnpkg.com/@stdlib/ndarray/-/ndarray-0.0.13.tgz") "2e8fc645e10f56a645a0ab81598808c0e8f43b82" [
          (s."@stdlib/bigint@^0.0.x")
          (s."@stdlib/buffer@^0.0.x")
          (s."@stdlib/complex@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/ndarray@^0.0.x" = s."@stdlib/ndarray@0.0.13";
        "@stdlib/nlp@0.0.11" = f (sc "stdlib" "nlp") "0.0.11" (ir "https://registry.yarnpkg.com/@stdlib/nlp/-/nlp-0.0.11.tgz") "532ec0f7267b8d639e4c20c6de864e8de8a09054" [
          (s."@stdlib/random@^0.0.x")
          ];
        "@stdlib/nlp@^0.0.x" = s."@stdlib/nlp@0.0.11";
        "@stdlib/number@0.0.10" = f (sc "stdlib" "number") "0.0.10" (ir "https://registry.yarnpkg.com/@stdlib/number/-/number-0.0.10.tgz") "4030ad8fc3fac19a9afb415c443cee6deea0e65c" [
          (s."@stdlib/os@^0.0.x")
          (s."@stdlib/string@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/number@^0.0.x" = s."@stdlib/number@0.0.10";
        "@stdlib/os@0.0.12" = f (sc "stdlib" "os") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/os/-/os-0.0.12.tgz") "08bbf013c62a7153099fa9cbac086ca1349a4677" [
          (s."@stdlib/fs@^0.0.x")
          (s."@stdlib/process@^0.0.x")
          ];
        "@stdlib/os@^0.0.x" = s."@stdlib/os@0.0.12";
        "@stdlib/process@0.0.12" = f (sc "stdlib" "process") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/process/-/process-0.0.12.tgz") "123325079d89a32f4212f72fb694f8fe3614cf18" [
          (s."@stdlib/buffer@^0.0.x")
          (s."@stdlib/streams@^0.0.x")
          (s."@stdlib/string@^0.0.x")
          ];
        "@stdlib/process@^0.0.x" = s."@stdlib/process@0.0.12";
        "@stdlib/random@0.0.12" = f (sc "stdlib" "random") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/random/-/random-0.0.12.tgz") "e819c3abd602ed5559ba800dba751e49c633ff85" [
          (s."@stdlib/buffer@^0.0.x")
          (s."@stdlib/stats@^0.0.x")
          (s."@stdlib/streams@^0.0.x")
          (s."@stdlib/symbol@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          (s."debug@^2.6.9")
          (s."readable-stream@^2.1.4")
          ];
        "@stdlib/random@^0.0.x" = s."@stdlib/random@0.0.12";
        "@stdlib/regexp@0.0.13" = f (sc "stdlib" "regexp") "0.0.13" (ir "https://registry.yarnpkg.com/@stdlib/regexp/-/regexp-0.0.13.tgz") "80b98361dc7a441b47bc3fa964bb0c826759e971" [];
        "@stdlib/regexp@^0.0.x" = s."@stdlib/regexp@0.0.13";
        "@stdlib/stats@0.0.13" = f (sc "stdlib" "stats") "0.0.13" (ir "https://registry.yarnpkg.com/@stdlib/stats/-/stats-0.0.13.tgz") "87c973f385379d794707c7b5196a173dba8b07e1" [
          (s."@stdlib/ndarray@^0.0.x")
          (s."@stdlib/symbol@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/stats@^0.0.13" = s."@stdlib/stats@0.0.13";
        "@stdlib/stats@^0.0.x" = s."@stdlib/stats@0.0.13";
        "@stdlib/streams@0.0.12" = f (sc "stdlib" "streams") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/streams/-/streams-0.0.12.tgz") "07f5ceae5852590afad8e1cb7ce94174becc8739" [
          (s."@stdlib/buffer@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          (s."debug@^2.6.9")
          (s."readable-stream@^2.1.4")
          ];
        "@stdlib/streams@^0.0.x" = s."@stdlib/streams@0.0.12";
        "@stdlib/strided@0.0.12" = f (sc "stdlib" "strided") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/strided/-/strided-0.0.12.tgz") "86ac48e660cb7f64a45cf07e80cbbfe58be21ae1" [
          (s."@stdlib/ndarray@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/strided@^0.0.x" = s."@stdlib/strided@0.0.12";
        "@stdlib/string@0.0.13" = f (sc "stdlib" "string") "0.0.13" (ir "https://registry.yarnpkg.com/@stdlib/string/-/string-0.0.13.tgz") "37457ca49e8d1dff0e523c68f5673c655c79eb2d" [
          (s."@stdlib/nlp@^0.0.x")
          (s."@stdlib/regexp@^0.0.x")
          (s."@stdlib/streams@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          ];
        "@stdlib/string@^0.0.x" = s."@stdlib/string@0.0.13";
        "@stdlib/symbol@0.0.12" = f (sc "stdlib" "symbol") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/symbol/-/symbol-0.0.12.tgz") "b9f396b0bf269c2985bb7fe99810a8e26d7288c3" [];
        "@stdlib/symbol@^0.0.x" = s."@stdlib/symbol@0.0.12";
        "@stdlib/time@0.0.14" = f (sc "stdlib" "time") "0.0.14" (ir "https://registry.yarnpkg.com/@stdlib/time/-/time-0.0.14.tgz") "ea6daa438b1d3b019b99f5091117ee4bcef55d60" [
          (s."@stdlib/constants@^0.0.x")
          (s."@stdlib/fs@^0.0.x")
          (s."@stdlib/math@^0.0.x")
          (s."@stdlib/string@^0.0.x")
          ];
        "@stdlib/time@^0.0.x" = s."@stdlib/time@0.0.14";
        "@stdlib/types@0.0.14" = f (sc "stdlib" "types") "0.0.14" (ir "https://registry.yarnpkg.com/@stdlib/types/-/types-0.0.14.tgz") "02d3aab7a9bfaeb86e34ab749772ea22f7b2f7e0" [];
        "@stdlib/types@^0.0.x" = s."@stdlib/types@0.0.14";
        "@stdlib/utils@0.0.12" = f (sc "stdlib" "utils") "0.0.12" (ir "https://registry.yarnpkg.com/@stdlib/utils/-/utils-0.0.12.tgz") "670de5a7b253f04f11a4cba38f790e82393bcb46" [
          (s."@stdlib/blas@^0.0.x")
          (s."@stdlib/buffer@^0.0.x")
          (s."@stdlib/constants@^0.0.x")
          (s."@stdlib/fs@^0.0.x")
          (s."@stdlib/math@^0.0.x")
          (s."@stdlib/os@^0.0.x")
          (s."@stdlib/process@^0.0.x")
          (s."@stdlib/random@^0.0.x")
          (s."@stdlib/regexp@^0.0.x")
          (s."@stdlib/streams@^0.0.x")
          (s."@stdlib/string@^0.0.x")
          (s."@stdlib/symbol@^0.0.x")
          (s."@stdlib/time@^0.0.x")
          (s."@stdlib/types@^0.0.x")
          (s."debug@^2.6.9")
          ];
        "@stdlib/utils@^0.0.x" = s."@stdlib/utils@0.0.12";
        "@storybook/addon-actions@6.5.9" = f (sc "storybook" "addon-actions") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-actions/-/addon-actions-6.5.9.tgz") "d50d65631403e1a5b680961429d9c0d7bd383e68" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."fast-deep-equal@^3.1.3")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."polished@^4.2.2")
          (s."prop-types@^15.7.2")
          (s."react-inspector@^5.1.0")
          (s."regenerator-runtime@^0.13.7")
          (s."telejson@^6.0.8")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          (s."uuid-browser@^3.1.0")
          ];
        "@storybook/addon-actions@^6.5.9" = s."@storybook/addon-actions@6.5.9";
        "@storybook/addon-backgrounds@6.5.9" = f (sc "storybook" "addon-backgrounds") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-backgrounds/-/addon-backgrounds-6.5.9.tgz") "a9579fc9d73f783a768c6c6ceb97193c5a1ee708" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."memoizerific@^1.11.3")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/addon-controls@6.5.9" = f (sc "storybook" "addon-controls") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-controls/-/addon-controls-6.5.9.tgz") "8f6ef939c87b3dbad98f8bda7e124f0b34f668d2" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/store@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."lodash@^4.17.21")
          (s."ts-dedent@^2.0.0")
          ];
        "@storybook/addon-docs@6.5.9" = f (sc "storybook" "addon-docs") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-docs/-/addon-docs-6.5.9.tgz") "32b27fb298624afd738c1371a764d7ff4831fe6d" [
          (s."@babel/plugin-transform-react-jsx@^7.12.12")
          (s."@babel/preset-env@^7.12.11")
          (s."@jest/transform@^26.6.2")
          (s."@mdx-js/react@^1.6.22")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/docs-tools@6.5.9")
          (s."@storybook/mdx1-csf@^0.0.1")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/postinstall@6.5.9")
          (s."@storybook/preview-web@6.5.9")
          (s."@storybook/source-loader@6.5.9")
          (s."@storybook/store@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."babel-loader@^8.0.0")
          (s."core-js@^3.8.2")
          (s."fast-deep-equal@^3.1.3")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."regenerator-runtime@^0.13.7")
          (s."remark-external-links@^8.0.0")
          (s."remark-slug@^6.0.0")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/addon-essentials@6.5.9" = f (sc "storybook" "addon-essentials") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-essentials/-/addon-essentials-6.5.9.tgz") "32ba63acba4d153f4cf6ac33cbbf14b87d260788" [
          (s."@storybook/addon-actions@6.5.9")
          (s."@storybook/addon-backgrounds@6.5.9")
          (s."@storybook/addon-controls@6.5.9")
          (s."@storybook/addon-docs@6.5.9")
          (s."@storybook/addon-measure@6.5.9")
          (s."@storybook/addon-outline@6.5.9")
          (s."@storybook/addon-toolbars@6.5.9")
          (s."@storybook/addon-viewport@6.5.9")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."core-js@^3.8.2")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          ];
        "@storybook/addon-essentials@^6.5.9" = s."@storybook/addon-essentials@6.5.9";
        "@storybook/addon-links@6.5.9" = f (sc "storybook" "addon-links") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-links/-/addon-links-6.5.9.tgz") "91cbca0c044796badf2498723fdd10dacea5748b" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/router@6.5.9")
          (s."@types/qs@^6.9.5")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."prop-types@^15.7.2")
          (s."qs@^6.10.0")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          ];
        "@storybook/addon-links@^6.5.9" = s."@storybook/addon-links@6.5.9";
        "@storybook/addon-measure@6.5.9" = f (sc "storybook" "addon-measure") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-measure/-/addon-measure-6.5.9.tgz") "f949d4f5f4025c839634114365f1399ea04bd0ae" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          ];
        "@storybook/addon-outline@6.5.9" = f (sc "storybook" "addon-outline") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-outline/-/addon-outline-6.5.9.tgz") "6ce9b3fb77e6a1a59607d7657c359c69f26cf6dd" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          ];
        "@storybook/addon-toolbars@6.5.9" = f (sc "storybook" "addon-toolbars") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-toolbars/-/addon-toolbars-6.5.9.tgz") "feedfdac08482d43bb1f3cc00840d80322c5eace" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/addon-viewport@6.5.9" = f (sc "storybook" "addon-viewport") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addon-viewport/-/addon-viewport-6.5.9.tgz") "fc390ccebea56d2e874ed2fda085c09fe04dd240" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."memoizerific@^1.11.3")
          (s."prop-types@^15.7.2")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/addons@6.5.9" = f (sc "storybook" "addons") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/addons/-/addons-6.5.9.tgz") "5a9d7395c579a9cbc44dfc122362fb3c95dfb9d5" [
          (s."@storybook/api@6.5.9")
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/router@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."@types/webpack-env@^1.16.0")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/api@6.5.9" = f (sc "storybook" "api") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/api/-/api-6.5.9.tgz") "303733214c9de0422d162f7c54ae05d088b89bf9" [
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/router@6.5.9")
          (s."@storybook/semver@^7.3.2")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."fast-deep-equal@^3.1.3")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."memoizerific@^1.11.3")
          (s."regenerator-runtime@^0.13.7")
          (s."store2@^2.12.0")
          (s."telejson@^6.0.8")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/builder-webpack4@6.5.9" = f (sc "storybook" "builder-webpack4") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/builder-webpack4/-/builder-webpack4-6.5.9.tgz") "4b37e1fa23a25aa4bfeaba640e5d318fcd511f95" [
          (s."@babel/core@^7.12.10")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/channel-postmessage@6.5.9")
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/preview-web@6.5.9")
          (s."@storybook/router@6.5.9")
          (s."@storybook/semver@^7.3.2")
          (s."@storybook/store@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."@storybook/ui@6.5.9")
          (s."@types/node@^14.0.10 || ^16.0.0")
          (s."@types/webpack@^4.41.26")
          (s."autoprefixer@^9.8.6")
          (s."babel-loader@^8.0.0")
          (s."case-sensitive-paths-webpack-plugin@^2.3.0")
          (s."core-js@^3.8.2")
          (s."css-loader@^3.6.0")
          (s."file-loader@^6.2.0")
          (s."find-up@^5.0.0")
          (s."fork-ts-checker-webpack-plugin@^4.1.6")
          (s."glob@^7.1.6")
          (s."glob-promise@^3.4.0")
          (s."global@^4.4.0")
          (s."html-webpack-plugin@^4.0.0")
          (s."pnp-webpack-plugin@1.6.4")
          (s."postcss@^7.0.36")
          (s."postcss-flexbugs-fixes@^4.2.1")
          (s."postcss-loader@^4.2.0")
          (s."raw-loader@^4.0.2")
          (s."stable@^0.1.8")
          (s."style-loader@^1.3.0")
          (s."terser-webpack-plugin@^4.2.3")
          (s."ts-dedent@^2.0.0")
          (s."url-loader@^4.1.1")
          (s."util-deprecate@^1.0.2")
          (s."webpack@4")
          (s."webpack-dev-middleware@^3.7.3")
          (s."webpack-filter-warnings-plugin@^1.2.1")
          (s."webpack-hot-middleware@^2.25.1")
          (s."webpack-virtual-modules@^0.2.2")
          ];
        "@storybook/builder-webpack5@6.5.9" = f (sc "storybook" "builder-webpack5") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/builder-webpack5/-/builder-webpack5-6.5.9.tgz") "30b4e08622daff104bcccd015d3ee7902f99dd99" [
          (s."@babel/core@^7.12.10")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/channel-postmessage@6.5.9")
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/preview-web@6.5.9")
          (s."@storybook/router@6.5.9")
          (s."@storybook/semver@^7.3.2")
          (s."@storybook/store@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."@types/node@^14.0.10 || ^16.0.0")
          (s."babel-loader@^8.0.0")
          (s."babel-plugin-named-exports-order@^0.0.2")
          (s."browser-assert@^1.2.1")
          (s."case-sensitive-paths-webpack-plugin@^2.3.0")
          (s."core-js@^3.8.2")
          (s."css-loader@^5.0.1")
          (s."fork-ts-checker-webpack-plugin@^6.0.4")
          (s."glob@^7.1.6")
          (s."glob-promise@^3.4.0")
          (s."html-webpack-plugin@^5.0.0")
          (s."path-browserify@^1.0.1")
          (s."process@^0.11.10")
          (s."stable@^0.1.8")
          (s."style-loader@^2.0.0")
          (s."terser-webpack-plugin@^5.0.3")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          (s."webpack@^5.9.0")
          (s."webpack-dev-middleware@^4.1.0")
          (s."webpack-hot-middleware@^2.25.1")
          (s."webpack-virtual-modules@^0.4.1")
          ];
        "@storybook/builder-webpack5@^6.5.9" = s."@storybook/builder-webpack5@6.5.9";
        "@storybook/channel-postmessage@6.5.9" = f (sc "storybook" "channel-postmessage") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/channel-postmessage/-/channel-postmessage-6.5.9.tgz") "9cf4530f0364cee0d5e58f92d6fb5ce98e10257b" [
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."qs@^6.10.0")
          (s."telejson@^6.0.8")
          ];
        "@storybook/channel-websocket@6.5.9" = f (sc "storybook" "channel-websocket") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/channel-websocket/-/channel-websocket-6.5.9.tgz") "6b7a0127fec58ee5be4f6aebcf460adc564f2f34" [
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."telejson@^6.0.8")
          ];
        "@storybook/channels@6.5.9" = f (sc "storybook" "channels") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/channels/-/channels-6.5.9.tgz") "abfab89a6587a2688e9926d4aafeb11c9d8b2e79" [
          (s."core-js@^3.8.2")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/client-api@6.5.9" = f (sc "storybook" "client-api") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/client-api/-/client-api-6.5.9.tgz") "3e4a8ec1d277fd81325c5d959c553161a85fa182" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/channel-postmessage@6.5.9")
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/store@6.5.9")
          (s."@types/qs@^6.9.5")
          (s."@types/webpack-env@^1.16.0")
          (s."core-js@^3.8.2")
          (s."fast-deep-equal@^3.1.3")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."memoizerific@^1.11.3")
          (s."qs@^6.10.0")
          (s."regenerator-runtime@^0.13.7")
          (s."store2@^2.12.0")
          (s."synchronous-promise@^2.0.15")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/client-logger@6.5.9" = f (sc "storybook" "client-logger") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/client-logger/-/client-logger-6.5.9.tgz") "dc1669abe8c45af1cc38f74c6f4b15ff33e63014" [
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          ];
        "@storybook/components@6.5.9" = f (sc "storybook" "components") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/components/-/components-6.5.9.tgz") "97e07ffe11ab76c01ccee380888991bd161f75b2" [
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/theming@6.5.9")
          (s."@types/react-syntax-highlighter@11.0.5")
          (s."core-js@^3.8.2")
          (s."memoizerific@^1.11.3")
          (s."qs@^6.10.0")
          (s."react-syntax-highlighter@^15.4.5")
          (s."regenerator-runtime@^0.13.7")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/core-client@6.5.9" = f (sc "storybook" "core-client") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/core-client/-/core-client-6.5.9.tgz") "ea6035d1c90d2c68e860e3cf629979491856cd88" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/channel-postmessage@6.5.9")
          (s."@storybook/channel-websocket@6.5.9")
          (s."@storybook/client-api@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/preview-web@6.5.9")
          (s."@storybook/store@6.5.9")
          (s."@storybook/ui@6.5.9")
          (s."airbnb-js-shims@^2.2.1")
          (s."ansi-to-html@^0.6.11")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."qs@^6.10.0")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          (s."unfetch@^4.2.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/core-common@6.5.9" = f (sc "storybook" "core-common") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/core-common/-/core-common-6.5.9.tgz") "7ca8258ea2634b1d64695c1e4262f71cc7457989" [
          (s."@babel/core@^7.12.10")
          (s."@babel/plugin-proposal-class-properties@^7.12.1")
          (s."@babel/plugin-proposal-decorators@^7.12.12")
          (s."@babel/plugin-proposal-export-default-from@^7.12.1")
          (s."@babel/plugin-proposal-nullish-coalescing-operator@^7.12.1")
          (s."@babel/plugin-proposal-object-rest-spread@^7.12.1")
          (s."@babel/plugin-proposal-optional-chaining@^7.12.7")
          (s."@babel/plugin-proposal-private-methods@^7.12.1")
          (s."@babel/plugin-proposal-private-property-in-object@^7.12.1")
          (s."@babel/plugin-syntax-dynamic-import@^7.8.3")
          (s."@babel/plugin-transform-arrow-functions@^7.12.1")
          (s."@babel/plugin-transform-block-scoping@^7.12.12")
          (s."@babel/plugin-transform-classes@^7.12.1")
          (s."@babel/plugin-transform-destructuring@^7.12.1")
          (s."@babel/plugin-transform-for-of@^7.12.1")
          (s."@babel/plugin-transform-parameters@^7.12.1")
          (s."@babel/plugin-transform-shorthand-properties@^7.12.1")
          (s."@babel/plugin-transform-spread@^7.12.1")
          (s."@babel/preset-env@^7.12.11")
          (s."@babel/preset-react@^7.12.10")
          (s."@babel/preset-typescript@^7.12.7")
          (s."@babel/register@^7.12.1")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/semver@^7.3.2")
          (s."@types/node@^14.0.10 || ^16.0.0")
          (s."@types/pretty-hrtime@^1.0.0")
          (s."babel-loader@^8.0.0")
          (s."babel-plugin-macros@^3.0.1")
          (s."babel-plugin-polyfill-corejs3@^0.1.0")
          (s."chalk@^4.1.0")
          (s."core-js@^3.8.2")
          (s."express@^4.17.1")
          (s."file-system-cache@^1.0.5")
          (s."find-up@^5.0.0")
          (s."fork-ts-checker-webpack-plugin@^6.0.4")
          (s."fs-extra@^9.0.1")
          (s."glob@^7.1.6")
          (s."handlebars@^4.7.7")
          (s."interpret@^2.2.0")
          (s."json5@^2.1.3")
          (s."lazy-universal-dotenv@^3.0.1")
          (s."picomatch@^2.3.0")
          (s."pkg-dir@^5.0.0")
          (s."pretty-hrtime@^1.0.3")
          (s."resolve-from@^5.0.0")
          (s."slash@^3.0.0")
          (s."telejson@^6.0.8")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          (s."webpack@4")
          ];
        "@storybook/core-events@6.5.9" = f (sc "storybook" "core-events") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/core-events/-/core-events-6.5.9.tgz") "5b0783c7d22a586c0f5e927a61fe1b1223e19637" [
          (s."core-js@^3.8.2")
          ];
        "@storybook/core-server@6.5.9" = f (sc "storybook" "core-server") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/core-server/-/core-server-6.5.9.tgz") "749a881c1a81d7cf1a69f3782c06a7f0c39a505c" [
          (s."@discoveryjs/json-ext@^0.5.3")
          (s."@storybook/builder-webpack4@6.5.9")
          (s."@storybook/core-client@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/csf-tools@6.5.9")
          (s."@storybook/manager-webpack4@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/semver@^7.3.2")
          (s."@storybook/store@6.5.9")
          (s."@storybook/telemetry@6.5.9")
          (s."@types/node@^14.0.10 || ^16.0.0")
          (s."@types/node-fetch@^2.5.7")
          (s."@types/pretty-hrtime@^1.0.0")
          (s."@types/webpack@^4.41.26")
          (s."better-opn@^2.1.1")
          (s."boxen@^5.1.2")
          (s."chalk@^4.1.0")
          (s."cli-table3@^0.6.1")
          (s."commander@^6.2.1")
          (s."compression@^1.7.4")
          (s."core-js@^3.8.2")
          (s."cpy@^8.1.2")
          (s."detect-port@^1.3.0")
          (s."express@^4.17.1")
          (s."fs-extra@^9.0.1")
          (s."global@^4.4.0")
          (s."globby@^11.0.2")
          (s."ip@^2.0.0")
          (s."lodash@^4.17.21")
          (s."node-fetch@^2.6.7")
          (s."open@^8.4.0")
          (s."pretty-hrtime@^1.0.3")
          (s."prompts@^2.4.0")
          (s."regenerator-runtime@^0.13.7")
          (s."serve-favicon@^2.5.0")
          (s."slash@^3.0.0")
          (s."telejson@^6.0.8")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          (s."watchpack@^2.2.0")
          (s."webpack@4")
          (s."ws@^8.2.3")
          (s."x-default-browser@^0.4.0")
          ];
        "@storybook/core@6.5.9" = f (sc "storybook" "core") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/core/-/core-6.5.9.tgz") "da4f237391d99aed1228323f24b335cafbdf3499" [
          (s."@storybook/core-client@6.5.9")
          (s."@storybook/core-server@6.5.9")
          ];
        "@storybook/csf-tools@6.5.9" = f (sc "storybook" "csf-tools") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/csf-tools/-/csf-tools-6.5.9.tgz") "8e01df2305b53e228229f0b45ada3720e6e42a1c" [
          (s."@babel/core@^7.12.10")
          (s."@babel/generator@^7.12.11")
          (s."@babel/parser@^7.12.11")
          (s."@babel/plugin-transform-react-jsx@^7.12.12")
          (s."@babel/preset-env@^7.12.11")
          (s."@babel/traverse@^7.12.11")
          (s."@babel/types@^7.12.11")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/mdx1-csf@^0.0.1")
          (s."core-js@^3.8.2")
          (s."fs-extra@^9.0.1")
          (s."global@^4.4.0")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          ];
        "@storybook/csf@0.0.2--canary.4566f4d.1" = f (sc "storybook" "csf") "0.0.2--canary.4566f4d.1" (ir "https://registry.yarnpkg.com/@storybook/csf/-/csf-0.0.2--canary.4566f4d.1.tgz") "dac52a21c40ef198554e71fe4d20d61e17f65327" [
          (s."lodash@^4.17.15")
          ];
        "@storybook/docs-tools@6.5.9" = f (sc "storybook" "docs-tools") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/docs-tools/-/docs-tools-6.5.9.tgz") "5ff304f881e972ce14923a5ffcfed3f052094889" [
          (s."@babel/core@^7.12.10")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/store@6.5.9")
          (s."core-js@^3.8.2")
          (s."doctrine@^3.0.0")
          (s."lodash@^4.17.21")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/manager-webpack4@6.5.9" = f (sc "storybook" "manager-webpack4") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/manager-webpack4/-/manager-webpack4-6.5.9.tgz") "c75d2cced4550c8a786f00b0e57b203d613e706c" [
          (s."@babel/core@^7.12.10")
          (s."@babel/plugin-transform-template-literals@^7.12.1")
          (s."@babel/preset-react@^7.12.10")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/core-client@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."@storybook/ui@6.5.9")
          (s."@types/node@^14.0.10 || ^16.0.0")
          (s."@types/webpack@^4.41.26")
          (s."babel-loader@^8.0.0")
          (s."case-sensitive-paths-webpack-plugin@^2.3.0")
          (s."chalk@^4.1.0")
          (s."core-js@^3.8.2")
          (s."css-loader@^3.6.0")
          (s."express@^4.17.1")
          (s."file-loader@^6.2.0")
          (s."find-up@^5.0.0")
          (s."fs-extra@^9.0.1")
          (s."html-webpack-plugin@^4.0.0")
          (s."node-fetch@^2.6.7")
          (s."pnp-webpack-plugin@1.6.4")
          (s."read-pkg-up@^7.0.1")
          (s."regenerator-runtime@^0.13.7")
          (s."resolve-from@^5.0.0")
          (s."style-loader@^1.3.0")
          (s."telejson@^6.0.8")
          (s."terser-webpack-plugin@^4.2.3")
          (s."ts-dedent@^2.0.0")
          (s."url-loader@^4.1.1")
          (s."util-deprecate@^1.0.2")
          (s."webpack@4")
          (s."webpack-dev-middleware@^3.7.3")
          (s."webpack-virtual-modules@^0.2.2")
          ];
        "@storybook/manager-webpack5@6.5.9" = f (sc "storybook" "manager-webpack5") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/manager-webpack5/-/manager-webpack5-6.5.9.tgz") "ce9dd6ea6298ab426b111f170c23deea7085ba08" [
          (s."@babel/core@^7.12.10")
          (s."@babel/plugin-transform-template-literals@^7.12.1")
          (s."@babel/preset-react@^7.12.10")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/core-client@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/theming@6.5.9")
          (s."@storybook/ui@6.5.9")
          (s."@types/node@^14.0.10 || ^16.0.0")
          (s."babel-loader@^8.0.0")
          (s."case-sensitive-paths-webpack-plugin@^2.3.0")
          (s."chalk@^4.1.0")
          (s."core-js@^3.8.2")
          (s."css-loader@^5.0.1")
          (s."express@^4.17.1")
          (s."find-up@^5.0.0")
          (s."fs-extra@^9.0.1")
          (s."html-webpack-plugin@^5.0.0")
          (s."node-fetch@^2.6.7")
          (s."process@^0.11.10")
          (s."read-pkg-up@^7.0.1")
          (s."regenerator-runtime@^0.13.7")
          (s."resolve-from@^5.0.0")
          (s."style-loader@^2.0.0")
          (s."telejson@^6.0.8")
          (s."terser-webpack-plugin@^5.0.3")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          (s."webpack@^5.9.0")
          (s."webpack-dev-middleware@^4.1.0")
          (s."webpack-virtual-modules@^0.4.1")
          ];
        "@storybook/manager-webpack5@^6.5.9" = s."@storybook/manager-webpack5@6.5.9";
        "@storybook/mdx1-csf@0.0.1" = f (sc "storybook" "mdx1-csf") "0.0.1" (ir "https://registry.yarnpkg.com/@storybook/mdx1-csf/-/mdx1-csf-0.0.1.tgz") "d4184e3f6486fade9f7a6bfaf934d9bc07718d5b" [
          (s."@babel/generator@^7.12.11")
          (s."@babel/parser@^7.12.11")
          (s."@babel/preset-env@^7.12.11")
          (s."@babel/types@^7.12.11")
          (s."@mdx-js/mdx@^1.6.22")
          (s."@types/lodash@^4.14.167")
          (s."js-string-escape@^1.0.1")
          (s."loader-utils@^2.0.0")
          (s."lodash@^4.17.21")
          (s."prettier@>=2.2.1 <=2.3.0")
          (s."ts-dedent@^2.0.0")
          ];
        "@storybook/mdx1-csf@^0.0.1" = s."@storybook/mdx1-csf@0.0.1";
        "@storybook/node-logger@6.5.9" = f (sc "storybook" "node-logger") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/node-logger/-/node-logger-6.5.9.tgz") "129cfe0d0f79cab4f6a2ba194d39516680b1626f" [
          (s."@types/npmlog@^4.1.2")
          (s."chalk@^4.1.0")
          (s."core-js@^3.8.2")
          (s."npmlog@^5.0.1")
          (s."pretty-hrtime@^1.0.3")
          ];
        "@storybook/node-logger@^6.5.9" = s."@storybook/node-logger@6.5.9";
        "@storybook/postinstall@6.5.9" = f (sc "storybook" "postinstall") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/postinstall/-/postinstall-6.5.9.tgz") "a5a2565808e9d7bc310e78c279b09ce337fe3457" [
          (s."core-js@^3.8.2")
          ];
        "@storybook/preset-create-react-app@4.1.2" = f (sc "storybook" "preset-create-react-app") "4.1.2" (ir "https://registry.yarnpkg.com/@storybook/preset-create-react-app/-/preset-create-react-app-4.1.2.tgz") "65bdfd3e32d84e06ad4db2bb491534cd6bcd2dbb" [
          (s."@pmmmwh/react-refresh-webpack-plugin@^0.5.1")
          (s."@storybook/react-docgen-typescript-plugin@canary")
          (s."@types/babel__core@^7.1.7")
          (s."babel-plugin-react-docgen@^4.1.0")
          (s."pnp-webpack-plugin@^1.7.0")
          (s."semver@^7.3.5")
          ];
        "@storybook/preset-create-react-app@^4.1.2" = s."@storybook/preset-create-react-app@4.1.2";
        "@storybook/preview-web@6.5.9" = f (sc "storybook" "preview-web") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/preview-web/-/preview-web-6.5.9.tgz") "557d919e6df50d66259521aa36ebf4055bbd236e" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/channel-postmessage@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/store@6.5.9")
          (s."ansi-to-html@^0.6.11")
          (s."core-js@^3.8.2")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."qs@^6.10.0")
          (s."regenerator-runtime@^0.13.7")
          (s."synchronous-promise@^2.0.15")
          (s."ts-dedent@^2.0.0")
          (s."unfetch@^4.2.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/react-docgen-typescript-plugin@1.0.2-canary.6.9d540b91e815f8fc2f8829189deb00553559ff63.0" = f (sc "storybook" "react-docgen-typescript-plugin") "1.0.2-canary.6.9d540b91e815f8fc2f8829189deb00553559ff63.0" (ir "https://registry.yarnpkg.com/@storybook/react-docgen-typescript-plugin/-/react-docgen-typescript-plugin-1.0.2-canary.6.9d540b91e815f8fc2f8829189deb00553559ff63.0.tgz") "3103532ff494fb7dc3cf835f10740ecf6a26c0f9" [
          (s."debug@^4.1.1")
          (s."endent@^2.0.1")
          (s."find-cache-dir@^3.3.1")
          (s."flat-cache@^3.0.4")
          (s."micromatch@^4.0.2")
          (s."react-docgen-typescript@^2.1.1")
          (s."tslib@^2.0.0")
          ];
        "@storybook/react-docgen-typescript-plugin@canary" = s."@storybook/react-docgen-typescript-plugin@1.0.2-canary.6.9d540b91e815f8fc2f8829189deb00553559ff63.0";
        "@storybook/react@6.5.9" = f (sc "storybook" "react") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/react/-/react-6.5.9.tgz") "687ec1f6b785822a392b7ac115b61800f69fb7cd" [
          (s."@babel/preset-flow@^7.12.1")
          (s."@babel/preset-react@^7.12.10")
          (s."@pmmmwh/react-refresh-webpack-plugin@^0.5.3")
          (s."@storybook/addons@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."@storybook/docs-tools@6.5.9")
          (s."@storybook/node-logger@6.5.9")
          (s."@storybook/react-docgen-typescript-plugin@1.0.2-canary.6.9d540b91e815f8fc2f8829189deb00553559ff63.0")
          (s."@storybook/semver@^7.3.2")
          (s."@storybook/store@6.5.9")
          (s."@types/estree@^0.0.51")
          (s."@types/node@^14.14.20 || ^16.0.0")
          (s."@types/webpack-env@^1.16.0")
          (s."acorn@^7.4.1")
          (s."acorn-jsx@^5.3.1")
          (s."acorn-walk@^7.2.0")
          (s."babel-plugin-add-react-displayname@^0.0.5")
          (s."babel-plugin-react-docgen@^4.2.1")
          (s."core-js@^3.8.2")
          (s."escodegen@^2.0.0")
          (s."fs-extra@^9.0.1")
          (s."global@^4.4.0")
          (s."html-tags@^3.1.0")
          (s."lodash@^4.17.21")
          (s."prop-types@^15.7.2")
          (s."react-element-to-jsx-string@^14.3.4")
          (s."react-refresh@^0.11.0")
          (s."read-pkg-up@^7.0.1")
          (s."regenerator-runtime@^0.13.7")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          (s."webpack@>=4.43.0 <6.0.0")
          ];
        "@storybook/react@^6.5.9" = s."@storybook/react@6.5.9";
        "@storybook/router@6.5.9" = f (sc "storybook" "router") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/router/-/router-6.5.9.tgz") "4740248f8517425b2056273fb366ace8a17c65e8" [
          (s."@storybook/client-logger@6.5.9")
          (s."core-js@^3.8.2")
          (s."memoizerific@^1.11.3")
          (s."qs@^6.10.0")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/semver@7.3.2" = f (sc "storybook" "semver") "7.3.2" (ir "https://registry.yarnpkg.com/@storybook/semver/-/semver-7.3.2.tgz") "f3b9c44a1c9a0b933c04e66d0048fcf2fa10dac0" [
          (s."core-js@^3.6.5")
          (s."find-up@^4.1.0")
          ];
        "@storybook/semver@^7.3.2" = s."@storybook/semver@7.3.2";
        "@storybook/source-loader@6.5.9" = f (sc "storybook" "source-loader") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/source-loader/-/source-loader-6.5.9.tgz") "7b6f065c6a6108c4b4ca7e45bfd78707373d84ac" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."core-js@^3.8.2")
          (s."estraverse@^5.2.0")
          (s."global@^4.4.0")
          (s."loader-utils@^2.0.0")
          (s."lodash@^4.17.21")
          (s."prettier@>=2.2.1 <=2.3.0")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/store@6.5.9" = f (sc "storybook" "store") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/store/-/store-6.5.9.tgz") "dc9963fc013636569082bd8f7200804866373735" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/csf@0.0.2--canary.4566f4d.1")
          (s."core-js@^3.8.2")
          (s."fast-deep-equal@^3.1.3")
          (s."global@^4.4.0")
          (s."lodash@^4.17.21")
          (s."memoizerific@^1.11.3")
          (s."regenerator-runtime@^0.13.7")
          (s."slash@^3.0.0")
          (s."stable@^0.1.8")
          (s."synchronous-promise@^2.0.15")
          (s."ts-dedent@^2.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "@storybook/telemetry@6.5.9" = f (sc "storybook" "telemetry") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/telemetry/-/telemetry-6.5.9.tgz") "8e1e0d4a89fc2387620045e5ea96c109d16a7247" [
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/core-common@6.5.9")
          (s."chalk@^4.1.0")
          (s."core-js@^3.8.2")
          (s."detect-package-manager@^2.0.1")
          (s."fetch-retry@^5.0.2")
          (s."fs-extra@^9.0.1")
          (s."global@^4.4.0")
          (s."isomorphic-unfetch@^3.1.0")
          (s."nanoid@^3.3.1")
          (s."read-pkg-up@^7.0.1")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/theming@6.5.9" = f (sc "storybook" "theming") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/theming/-/theming-6.5.9.tgz") "13f60a3a3cd73ceb5caf9f188e1627e79f1891aa" [
          (s."@storybook/client-logger@6.5.9")
          (s."core-js@^3.8.2")
          (s."memoizerific@^1.11.3")
          (s."regenerator-runtime@^0.13.7")
          ];
        "@storybook/ui@6.5.9" = f (sc "storybook" "ui") "6.5.9" (ir "https://registry.yarnpkg.com/@storybook/ui/-/ui-6.5.9.tgz") "41e59279323cccc0d613974ec9782d797220c8a7" [
          (s."@storybook/addons@6.5.9")
          (s."@storybook/api@6.5.9")
          (s."@storybook/channels@6.5.9")
          (s."@storybook/client-logger@6.5.9")
          (s."@storybook/components@6.5.9")
          (s."@storybook/core-events@6.5.9")
          (s."@storybook/router@6.5.9")
          (s."@storybook/semver@^7.3.2")
          (s."@storybook/theming@6.5.9")
          (s."core-js@^3.8.2")
          (s."memoizerific@^1.11.3")
          (s."qs@^6.10.0")
          (s."regenerator-runtime@^0.13.7")
          (s."resolve-from@^5.0.0")
          ];
        "@surma/rollup-plugin-off-main-thread@2.2.3" = f (sc "surma" "rollup-plugin-off-main-thread") "2.2.3" (ir "https://registry.yarnpkg.com/@surma/rollup-plugin-off-main-thread/-/rollup-plugin-off-main-thread-2.2.3.tgz") "ee34985952ca21558ab0d952f00298ad2190c053" [
          (s."ejs@^3.1.6")
          (s."json5@^2.2.0")
          (s."magic-string@^0.25.0")
          (s."string.prototype.matchall@^4.0.6")
          ];
        "@surma/rollup-plugin-off-main-thread@^2.2.3" = s."@surma/rollup-plugin-off-main-thread@2.2.3";
        "@svgr/babel-plugin-add-jsx-attribute@5.4.0" = f (sc "svgr" "babel-plugin-add-jsx-attribute") "5.4.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-5.4.0.tgz") "81ef61947bb268eb9d50523446f9c638fb355906" [];
        "@svgr/babel-plugin-add-jsx-attribute@6.0.0" = f (sc "svgr" "babel-plugin-add-jsx-attribute") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-6.0.0.tgz") "bd6d1ff32a31b82b601e73672a789cc41e84fe18" [];
        "@svgr/babel-plugin-add-jsx-attribute@^5.4.0" = s."@svgr/babel-plugin-add-jsx-attribute@5.4.0";
        "@svgr/babel-plugin-add-jsx-attribute@^6.0.0" = s."@svgr/babel-plugin-add-jsx-attribute@6.0.0";
        "@svgr/babel-plugin-remove-jsx-attribute@5.4.0" = f (sc "svgr" "babel-plugin-remove-jsx-attribute") "5.4.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-5.4.0.tgz") "6b2c770c95c874654fd5e1d5ef475b78a0a962ef" [];
        "@svgr/babel-plugin-remove-jsx-attribute@6.0.0" = f (sc "svgr" "babel-plugin-remove-jsx-attribute") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-6.0.0.tgz") "58654908beebfa069681a83332544b17e5237e89" [];
        "@svgr/babel-plugin-remove-jsx-attribute@^5.4.0" = s."@svgr/babel-plugin-remove-jsx-attribute@5.4.0";
        "@svgr/babel-plugin-remove-jsx-attribute@^6.0.0" = s."@svgr/babel-plugin-remove-jsx-attribute@6.0.0";
        "@svgr/babel-plugin-remove-jsx-empty-expression@5.0.1" = f (sc "svgr" "babel-plugin-remove-jsx-empty-expression") "5.0.1" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-5.0.1.tgz") "25621a8915ed7ad70da6cea3d0a6dbc2ea933efd" [];
        "@svgr/babel-plugin-remove-jsx-empty-expression@6.0.0" = f (sc "svgr" "babel-plugin-remove-jsx-empty-expression") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-6.0.0.tgz") "d06dd6e8a8f603f92f9979bb9990a1f85a4f57ba" [];
        "@svgr/babel-plugin-remove-jsx-empty-expression@^5.0.1" = s."@svgr/babel-plugin-remove-jsx-empty-expression@5.0.1";
        "@svgr/babel-plugin-remove-jsx-empty-expression@^6.0.0" = s."@svgr/babel-plugin-remove-jsx-empty-expression@6.0.0";
        "@svgr/babel-plugin-replace-jsx-attribute-value@5.0.1" = f (sc "svgr" "babel-plugin-replace-jsx-attribute-value") "5.0.1" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-5.0.1.tgz") "0b221fc57f9fcd10e91fe219e2cd0dd03145a897" [];
        "@svgr/babel-plugin-replace-jsx-attribute-value@6.0.0" = f (sc "svgr" "babel-plugin-replace-jsx-attribute-value") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-6.0.0.tgz") "0b85837577b02c31c09c758a12932820f5245cee" [];
        "@svgr/babel-plugin-replace-jsx-attribute-value@^5.0.1" = s."@svgr/babel-plugin-replace-jsx-attribute-value@5.0.1";
        "@svgr/babel-plugin-replace-jsx-attribute-value@^6.0.0" = s."@svgr/babel-plugin-replace-jsx-attribute-value@6.0.0";
        "@svgr/babel-plugin-svg-dynamic-title@5.4.0" = f (sc "svgr" "babel-plugin-svg-dynamic-title") "5.4.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-5.4.0.tgz") "139b546dd0c3186b6e5db4fefc26cb0baea729d7" [];
        "@svgr/babel-plugin-svg-dynamic-title@6.0.0" = f (sc "svgr" "babel-plugin-svg-dynamic-title") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-6.0.0.tgz") "28236ec26f7ab9d486a487d36ae52d58ba15676f" [];
        "@svgr/babel-plugin-svg-dynamic-title@^5.4.0" = s."@svgr/babel-plugin-svg-dynamic-title@5.4.0";
        "@svgr/babel-plugin-svg-dynamic-title@^6.0.0" = s."@svgr/babel-plugin-svg-dynamic-title@6.0.0";
        "@svgr/babel-plugin-svg-em-dimensions@5.4.0" = f (sc "svgr" "babel-plugin-svg-em-dimensions") "5.4.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-5.4.0.tgz") "6543f69526632a133ce5cabab965deeaea2234a0" [];
        "@svgr/babel-plugin-svg-em-dimensions@6.0.0" = f (sc "svgr" "babel-plugin-svg-em-dimensions") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-6.0.0.tgz") "40267c5dea1b43c4f83a0eb6169e08b43d8bafce" [];
        "@svgr/babel-plugin-svg-em-dimensions@^5.4.0" = s."@svgr/babel-plugin-svg-em-dimensions@5.4.0";
        "@svgr/babel-plugin-svg-em-dimensions@^6.0.0" = s."@svgr/babel-plugin-svg-em-dimensions@6.0.0";
        "@svgr/babel-plugin-transform-react-native-svg@5.4.0" = f (sc "svgr" "babel-plugin-transform-react-native-svg") "5.4.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-5.4.0.tgz") "00bf9a7a73f1cad3948cdab1f8dfb774750f8c80" [];
        "@svgr/babel-plugin-transform-react-native-svg@6.0.0" = f (sc "svgr" "babel-plugin-transform-react-native-svg") "6.0.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-6.0.0.tgz") "eb688d0a5f539e34d268d8a516e81f5d7fede7c9" [];
        "@svgr/babel-plugin-transform-react-native-svg@^5.4.0" = s."@svgr/babel-plugin-transform-react-native-svg@5.4.0";
        "@svgr/babel-plugin-transform-react-native-svg@^6.0.0" = s."@svgr/babel-plugin-transform-react-native-svg@6.0.0";
        "@svgr/babel-plugin-transform-svg-component@5.5.0" = f (sc "svgr" "babel-plugin-transform-svg-component") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-5.5.0.tgz") "583a5e2a193e214da2f3afeb0b9e8d3250126b4a" [];
        "@svgr/babel-plugin-transform-svg-component@6.2.0" = f (sc "svgr" "babel-plugin-transform-svg-component") "6.2.0" (ir "https://registry.yarnpkg.com/@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-6.2.0.tgz") "7ba61d9fc1fb42b0ba1a04e4630019fa7e993c4f" [];
        "@svgr/babel-plugin-transform-svg-component@^5.5.0" = s."@svgr/babel-plugin-transform-svg-component@5.5.0";
        "@svgr/babel-plugin-transform-svg-component@^6.2.0" = s."@svgr/babel-plugin-transform-svg-component@6.2.0";
        "@svgr/babel-preset@5.5.0" = f (sc "svgr" "babel-preset") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/babel-preset/-/babel-preset-5.5.0.tgz") "8af54f3e0a8add7b1e2b0fcd5a882c55393df327" [
          (s."@svgr/babel-plugin-add-jsx-attribute@^5.4.0")
          (s."@svgr/babel-plugin-remove-jsx-attribute@^5.4.0")
          (s."@svgr/babel-plugin-remove-jsx-empty-expression@^5.0.1")
          (s."@svgr/babel-plugin-replace-jsx-attribute-value@^5.0.1")
          (s."@svgr/babel-plugin-svg-dynamic-title@^5.4.0")
          (s."@svgr/babel-plugin-svg-em-dimensions@^5.4.0")
          (s."@svgr/babel-plugin-transform-react-native-svg@^5.4.0")
          (s."@svgr/babel-plugin-transform-svg-component@^5.5.0")
          ];
        "@svgr/babel-preset@6.2.0" = f (sc "svgr" "babel-preset") "6.2.0" (ir "https://registry.yarnpkg.com/@svgr/babel-preset/-/babel-preset-6.2.0.tgz") "1d3ad8c7664253a4be8e4a0f0e6872f30d8af627" [
          (s."@svgr/babel-plugin-add-jsx-attribute@^6.0.0")
          (s."@svgr/babel-plugin-remove-jsx-attribute@^6.0.0")
          (s."@svgr/babel-plugin-remove-jsx-empty-expression@^6.0.0")
          (s."@svgr/babel-plugin-replace-jsx-attribute-value@^6.0.0")
          (s."@svgr/babel-plugin-svg-dynamic-title@^6.0.0")
          (s."@svgr/babel-plugin-svg-em-dimensions@^6.0.0")
          (s."@svgr/babel-plugin-transform-react-native-svg@^6.0.0")
          (s."@svgr/babel-plugin-transform-svg-component@^6.2.0")
          ];
        "@svgr/babel-preset@^5.5.0" = s."@svgr/babel-preset@5.5.0";
        "@svgr/babel-preset@^6.2.0" = s."@svgr/babel-preset@6.2.0";
        "@svgr/core@5.5.0" = f (sc "svgr" "core") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/core/-/core-5.5.0.tgz") "82e826b8715d71083120fe8f2492ec7d7874a579" [
          (s."@svgr/plugin-jsx@^5.5.0")
          (s."camelcase@^6.2.0")
          (s."cosmiconfig@^7.0.0")
          ];
        "@svgr/core@6.2.1" = f (sc "svgr" "core") "6.2.1" (ir "https://registry.yarnpkg.com/@svgr/core/-/core-6.2.1.tgz") "195de807a9f27f9e0e0d678e01084b05c54fdf61" [
          (s."@svgr/plugin-jsx@^6.2.1")
          (s."camelcase@^6.2.0")
          (s."cosmiconfig@^7.0.1")
          ];
        "@svgr/core@^5.5.0" = s."@svgr/core@5.5.0";
        "@svgr/core@^6.2.1" = s."@svgr/core@6.2.1";
        "@svgr/hast-util-to-babel-ast@5.5.0" = f (sc "svgr" "hast-util-to-babel-ast") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-5.5.0.tgz") "5ee52a9c2533f73e63f8f22b779f93cd432a5461" [
          (s."@babel/types@^7.12.6")
          ];
        "@svgr/hast-util-to-babel-ast@6.2.1" = f (sc "svgr" "hast-util-to-babel-ast") "6.2.1" (ir "https://registry.yarnpkg.com/@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-6.2.1.tgz") "ae065567b74cbe745afae617053adf9a764bea25" [
          (s."@babel/types@^7.15.6")
          (s."entities@^3.0.1")
          ];
        "@svgr/hast-util-to-babel-ast@^5.5.0" = s."@svgr/hast-util-to-babel-ast@5.5.0";
        "@svgr/hast-util-to-babel-ast@^6.2.1" = s."@svgr/hast-util-to-babel-ast@6.2.1";
        "@svgr/plugin-jsx@5.5.0" = f (sc "svgr" "plugin-jsx") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/plugin-jsx/-/plugin-jsx-5.5.0.tgz") "1aa8cd798a1db7173ac043466d7b52236b369000" [
          (s."@babel/core@^7.12.3")
          (s."@svgr/babel-preset@^5.5.0")
          (s."@svgr/hast-util-to-babel-ast@^5.5.0")
          (s."svg-parser@^2.0.2")
          ];
        "@svgr/plugin-jsx@6.2.1" = f (sc "svgr" "plugin-jsx") "6.2.1" (ir "https://registry.yarnpkg.com/@svgr/plugin-jsx/-/plugin-jsx-6.2.1.tgz") "5668f1d2aa18c2f1bb7a1fc9f682d3f9aed263bd" [
          (s."@babel/core@^7.15.5")
          (s."@svgr/babel-preset@^6.2.0")
          (s."@svgr/hast-util-to-babel-ast@^6.2.1")
          (s."svg-parser@^2.0.2")
          ];
        "@svgr/plugin-jsx@^5.5.0" = s."@svgr/plugin-jsx@5.5.0";
        "@svgr/plugin-jsx@^6.2.1" = s."@svgr/plugin-jsx@6.2.1";
        "@svgr/plugin-svgo@5.5.0" = f (sc "svgr" "plugin-svgo") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/plugin-svgo/-/plugin-svgo-5.5.0.tgz") "02da55d85320549324e201c7b2e53bf431fcc246" [
          (s."cosmiconfig@^7.0.0")
          (s."deepmerge@^4.2.2")
          (s."svgo@^1.2.2")
          ];
        "@svgr/plugin-svgo@6.2.0" = f (sc "svgr" "plugin-svgo") "6.2.0" (ir "https://registry.yarnpkg.com/@svgr/plugin-svgo/-/plugin-svgo-6.2.0.tgz") "4cbe6a33ccccdcae4e3b63ded64cc1cbe1faf48c" [
          (s."cosmiconfig@^7.0.1")
          (s."deepmerge@^4.2.2")
          (s."svgo@^2.5.0")
          ];
        "@svgr/plugin-svgo@^5.5.0" = s."@svgr/plugin-svgo@5.5.0";
        "@svgr/plugin-svgo@^6.2.0" = s."@svgr/plugin-svgo@6.2.0";
        "@svgr/webpack@5.5.0" = f (sc "svgr" "webpack") "5.5.0" (ir "https://registry.yarnpkg.com/@svgr/webpack/-/webpack-5.5.0.tgz") "aae858ee579f5fa8ce6c3166ef56c6a1b381b640" [
          (s."@babel/core@^7.12.3")
          (s."@babel/plugin-transform-react-constant-elements@^7.12.1")
          (s."@babel/preset-env@^7.12.1")
          (s."@babel/preset-react@^7.12.5")
          (s."@svgr/core@^5.5.0")
          (s."@svgr/plugin-jsx@^5.5.0")
          (s."@svgr/plugin-svgo@^5.5.0")
          (s."loader-utils@^2.0.0")
          ];
        "@svgr/webpack@6.2.1" = f (sc "svgr" "webpack") "6.2.1" (ir "https://registry.yarnpkg.com/@svgr/webpack/-/webpack-6.2.1.tgz") "ef5d51c1b6be4e7537fb9f76b3f2b2e22b63c58d" [
          (s."@babel/core@^7.15.5")
          (s."@babel/plugin-transform-react-constant-elements@^7.14.5")
          (s."@babel/preset-env@^7.15.6")
          (s."@babel/preset-react@^7.14.5")
          (s."@babel/preset-typescript@^7.15.0")
          (s."@svgr/core@^6.2.1")
          (s."@svgr/plugin-jsx@^6.2.1")
          (s."@svgr/plugin-svgo@^6.2.0")
          ];
        "@svgr/webpack@^5.5.0" = s."@svgr/webpack@5.5.0";
        "@svgr/webpack@^6.2.1" = s."@svgr/webpack@6.2.1";
        "@szmarczak/http-timer@1.1.2" = f (sc "szmarczak" "http-timer") "1.1.2" (ir "https://registry.yarnpkg.com/@szmarczak/http-timer/-/http-timer-1.1.2.tgz") "b1665e2c461a2cd92f4c1bbf50d5454de0d4b421" [
          (s."defer-to-connect@^1.0.1")
          ];
        "@szmarczak/http-timer@^1.1.2" = s."@szmarczak/http-timer@1.1.2";
        "@testing-library/dom@8.14.0" = f (sc "testing-library" "dom") "8.14.0" (ir "https://registry.yarnpkg.com/@testing-library/dom/-/dom-8.14.0.tgz") "c9830a21006d87b9ef6e1aae306cf49b0283e28e" [
          (s."@babel/code-frame@^7.10.4")
          (s."@babel/runtime@^7.12.5")
          (s."@types/aria-query@^4.2.0")
          (s."aria-query@^5.0.0")
          (s."chalk@^4.1.0")
          (s."dom-accessibility-api@^0.5.9")
          (s."lz-string@^1.4.4")
          (s."pretty-format@^27.0.2")
          ];
        "@testing-library/dom@^8.5.0" = s."@testing-library/dom@8.14.0";
        "@testing-library/jest-dom@5.16.4" = f (sc "testing-library" "jest-dom") "5.16.4" (ir "https://registry.yarnpkg.com/@testing-library/jest-dom/-/jest-dom-5.16.4.tgz") "938302d7b8b483963a3ae821f1c0808f872245cd" [
          (s."@babel/runtime@^7.9.2")
          (s."@types/testing-library__jest-dom@^5.9.1")
          (s."aria-query@^5.0.0")
          (s."chalk@^3.0.0")
          (s."css@^3.0.0")
          (s."css.escape@^1.5.1")
          (s."dom-accessibility-api@^0.5.6")
          (s."lodash@^4.17.15")
          (s."redent@^3.0.0")
          ];
        "@testing-library/jest-dom@^5.16.4" = s."@testing-library/jest-dom@5.16.4";
        "@testing-library/react@13.3.0" = f (sc "testing-library" "react") "13.3.0" (ir "https://registry.yarnpkg.com/@testing-library/react/-/react-13.3.0.tgz") "bf298bfbc5589326bbcc8052b211f3bb097a97c5" [
          (s."@babel/runtime@^7.12.5")
          (s."@testing-library/dom@^8.5.0")
          (s."@types/react-dom@^18.0.0")
          ];
        "@testing-library/react@^13.3.0" = s."@testing-library/react@13.3.0";
        "@testing-library/user-event@14.3.0" = f (sc "testing-library" "user-event") "14.3.0" (ir "https://registry.yarnpkg.com/@testing-library/user-event/-/user-event-14.3.0.tgz") "0a6750b94b40e4739706d41e8efc2ccf64d2aad9" [];
        "@testing-library/user-event@^14.3.0" = s."@testing-library/user-event@14.3.0";
        "@tootallnate/once@1" = s."@tootallnate/once@1.1.2";
        "@tootallnate/once@1.1.2" = f (sc "tootallnate" "once") "1.1.2" (ir "https://registry.yarnpkg.com/@tootallnate/once/-/once-1.1.2.tgz") "ccb91445360179a04e7fe6aff78c00ffc1eeaf82" [];
        "@trysound/sax@0.2.0" = f (sc "trysound" "sax") "0.2.0" (ir "https://registry.yarnpkg.com/@trysound/sax/-/sax-0.2.0.tgz") "cccaab758af56761eb7bf37af6f03f326dd798ad" [];
        "@tsconfig/node10@1.0.9" = f (sc "tsconfig" "node10") "1.0.9" (ir "https://registry.yarnpkg.com/@tsconfig/node10/-/node10-1.0.9.tgz") "df4907fc07a886922637b15e02d4cebc4c0021b2" [];
        "@tsconfig/node10@^1.0.7" = s."@tsconfig/node10@1.0.9";
        "@tsconfig/node12@1.0.11" = f (sc "tsconfig" "node12") "1.0.11" (ir "https://registry.yarnpkg.com/@tsconfig/node12/-/node12-1.0.11.tgz") "ee3def1f27d9ed66dac6e46a295cffb0152e058d" [];
        "@tsconfig/node12@^1.0.7" = s."@tsconfig/node12@1.0.11";
        "@tsconfig/node14@1.0.3" = f (sc "tsconfig" "node14") "1.0.3" (ir "https://registry.yarnpkg.com/@tsconfig/node14/-/node14-1.0.3.tgz") "e4386316284f00b98435bf40f72f75a09dabf6c1" [];
        "@tsconfig/node14@^1.0.0" = s."@tsconfig/node14@1.0.3";
        "@tsconfig/node16@1.0.3" = f (sc "tsconfig" "node16") "1.0.3" (ir "https://registry.yarnpkg.com/@tsconfig/node16/-/node16-1.0.3.tgz") "472eaab5f15c1ffdd7f8628bd4c4f753995ec79e" [];
        "@tsconfig/node16@^1.0.2" = s."@tsconfig/node16@1.0.3";
        "@types/aria-query@4.2.2" = f (sc "types" "aria-query") "4.2.2" (ir "https://registry.yarnpkg.com/@types/aria-query/-/aria-query-4.2.2.tgz") "ed4e0ad92306a704f9fb132a0cfcf77486dbe2bc" [];
        "@types/aria-query@^4.2.0" = s."@types/aria-query@4.2.2";
        "@types/babel__core@7.1.19" = f (sc "types" "babel__core") "7.1.19" (ir "https://registry.yarnpkg.com/@types/babel__core/-/babel__core-7.1.19.tgz") "7b497495b7d1b4812bdb9d02804d0576f43ee460" [
          (s."@babel/parser@^7.1.0")
          (s."@babel/types@^7.0.0")
          (s."@types/babel__generator@*")
          (s."@types/babel__template@*")
          (s."@types/babel__traverse@*")
          ];
        "@types/babel__core@^7.0.0" = s."@types/babel__core@7.1.19";
        "@types/babel__core@^7.1.14" = s."@types/babel__core@7.1.19";
        "@types/babel__core@^7.1.7" = s."@types/babel__core@7.1.19";
        "@types/babel__generator@*" = s."@types/babel__generator@7.6.4";
        "@types/babel__generator@7.6.4" = f (sc "types" "babel__generator") "7.6.4" (ir "https://registry.yarnpkg.com/@types/babel__generator/-/babel__generator-7.6.4.tgz") "1f20ce4c5b1990b37900b63f050182d28c2439b7" [
          (s."@babel/types@^7.0.0")
          ];
        "@types/babel__template@*" = s."@types/babel__template@7.4.1";
        "@types/babel__template@7.4.1" = f (sc "types" "babel__template") "7.4.1" (ir "https://registry.yarnpkg.com/@types/babel__template/-/babel__template-7.4.1.tgz") "3d1a48fd9d6c0edfd56f2ff578daed48f36c8969" [
          (s."@babel/parser@^7.1.0")
          (s."@babel/types@^7.0.0")
          ];
        "@types/babel__traverse@*" = s."@types/babel__traverse@7.17.1";
        "@types/babel__traverse@7.17.1" = f (sc "types" "babel__traverse") "7.17.1" (ir "https://registry.yarnpkg.com/@types/babel__traverse/-/babel__traverse-7.17.1.tgz") "1a0e73e8c28c7e832656db372b779bfd2ef37314" [
          (s."@babel/types@^7.3.0")
          ];
        "@types/babel__traverse@^7.0.4" = s."@types/babel__traverse@7.17.1";
        "@types/babel__traverse@^7.0.6" = s."@types/babel__traverse@7.17.1";
        "@types/body-parser@*" = s."@types/body-parser@1.19.2";
        "@types/body-parser@1.19.2" = f (sc "types" "body-parser") "1.19.2" (ir "https://registry.yarnpkg.com/@types/body-parser/-/body-parser-1.19.2.tgz") "aea2059e28b7658639081347ac4fab3de166e6f0" [
          (s."@types/connect@*")
          (s."@types/node@*")
          ];
        "@types/bonjour@3.5.10" = f (sc "types" "bonjour") "3.5.10" (ir "https://registry.yarnpkg.com/@types/bonjour/-/bonjour-3.5.10.tgz") "0f6aadfe00ea414edc86f5d106357cda9701e275" [
          (s."@types/node@*")
          ];
        "@types/bonjour@^3.5.9" = s."@types/bonjour@3.5.10";
        "@types/clone@2.1.1" = f (sc "types" "clone") "2.1.1" (ir "https://registry.yarnpkg.com/@types/clone/-/clone-2.1.1.tgz") "9b880d0ce9b1f209b5e0bd6d9caa38209db34024" [];
        "@types/clone@~2.1.1" = s."@types/clone@2.1.1";
        "@types/connect-history-api-fallback@1.3.5" = f (sc "types" "connect-history-api-fallback") "1.3.5" (ir "https://registry.yarnpkg.com/@types/connect-history-api-fallback/-/connect-history-api-fallback-1.3.5.tgz") "d1f7a8a09d0ed5a57aee5ae9c18ab9b803205dae" [
          (s."@types/express-serve-static-core@*")
          (s."@types/node@*")
          ];
        "@types/connect-history-api-fallback@^1.3.5" = s."@types/connect-history-api-fallback@1.3.5";
        "@types/connect@*" = s."@types/connect@3.4.35";
        "@types/connect@3.4.35" = f (sc "types" "connect") "3.4.35" (ir "https://registry.yarnpkg.com/@types/connect/-/connect-3.4.35.tgz") "5fcf6ae445e4021d1fc2219a4873cc73a3bb2ad1" [
          (s."@types/node@*")
          ];
        "@types/eslint-scope@3.7.3" = f (sc "types" "eslint-scope") "3.7.3" (ir "https://registry.yarnpkg.com/@types/eslint-scope/-/eslint-scope-3.7.3.tgz") "125b88504b61e3c8bc6f870882003253005c3224" [
          (s."@types/eslint@*")
          (s."@types/estree@*")
          ];
        "@types/eslint-scope@^3.7.3" = s."@types/eslint-scope@3.7.3";
        "@types/eslint@*" = s."@types/eslint@8.4.3";
        "@types/eslint@7.29.0" = f (sc "types" "eslint") "7.29.0" (ir "https://registry.yarnpkg.com/@types/eslint/-/eslint-7.29.0.tgz") "e56ddc8e542815272720bb0b4ccc2aff9c3e1c78" [
          (s."@types/estree@*")
          (s."@types/json-schema@*")
          ];
        "@types/eslint@8.4.3" = f (sc "types" "eslint") "8.4.3" (ir "https://registry.yarnpkg.com/@types/eslint/-/eslint-8.4.3.tgz") "5c92815a3838b1985c90034cd85f26f59d9d0ece" [
          (s."@types/estree@*")
          (s."@types/json-schema@*")
          ];
        "@types/eslint@^7.28.2" = s."@types/eslint@7.29.0";
        "@types/estree@*" = s."@types/estree@0.0.51";
        "@types/estree@0.0.39" = f (sc "types" "estree") "0.0.39" (ir "https://registry.yarnpkg.com/@types/estree/-/estree-0.0.39.tgz") "e177e699ee1b8c22d23174caaa7422644389509f" [];
        "@types/estree@0.0.50" = f (sc "types" "estree") "0.0.50" (ir "https://registry.yarnpkg.com/@types/estree/-/estree-0.0.50.tgz") "1e0caa9364d3fccd2931c3ed96fdbeaa5d4cca83" [];
        "@types/estree@0.0.51" = f (sc "types" "estree") "0.0.51" (ir "https://registry.yarnpkg.com/@types/estree/-/estree-0.0.51.tgz") "cfd70924a25a3fd32b218e5e420e6897e1ac4f40" [];
        "@types/estree@^0.0.50" = s."@types/estree@0.0.50";
        "@types/estree@^0.0.51" = s."@types/estree@0.0.51";
        "@types/express-serve-static-core@*" = s."@types/express-serve-static-core@4.17.29";
        "@types/express-serve-static-core@4.17.29" = f (sc "types" "express-serve-static-core") "4.17.29" (ir "https://registry.yarnpkg.com/@types/express-serve-static-core/-/express-serve-static-core-4.17.29.tgz") "2a1795ea8e9e9c91b4a4bbe475034b20c1ec711c" [
          (s."@types/node@*")
          (s."@types/qs@*")
          (s."@types/range-parser@*")
          ];
        "@types/express-serve-static-core@^4.17.18" = s."@types/express-serve-static-core@4.17.29";
        "@types/express@*" = s."@types/express@4.17.13";
        "@types/express@4.17.13" = f (sc "types" "express") "4.17.13" (ir "https://registry.yarnpkg.com/@types/express/-/express-4.17.13.tgz") "a76e2995728999bab51a33fabce1d705a3709034" [
          (s."@types/body-parser@*")
          (s."@types/express-serve-static-core@^4.17.18")
          (s."@types/qs@*")
          (s."@types/serve-static@*")
          ];
        "@types/express@^4.17.13" = s."@types/express@4.17.13";
        "@types/glob@*" = s."@types/glob@7.2.0";
        "@types/glob@7.2.0" = f (sc "types" "glob") "7.2.0" (ir "https://registry.yarnpkg.com/@types/glob/-/glob-7.2.0.tgz") "bc1b5bf3aa92f25bd5dd39f35c57361bdce5b2eb" [
          (s."@types/minimatch@*")
          (s."@types/node@*")
          ];
        "@types/glob@^7.1.1" = s."@types/glob@7.2.0";
        "@types/glob@^7.2.0" = s."@types/glob@7.2.0";
        "@types/graceful-fs@4.1.5" = f (sc "types" "graceful-fs") "4.1.5" (ir "https://registry.yarnpkg.com/@types/graceful-fs/-/graceful-fs-4.1.5.tgz") "21ffba0d98da4350db64891f92a9e5db3cdb4e15" [
          (s."@types/node@*")
          ];
        "@types/graceful-fs@^4.1.2" = s."@types/graceful-fs@4.1.5";
        "@types/hast@2.3.4" = f (sc "types" "hast") "2.3.4" (ir "https://registry.yarnpkg.com/@types/hast/-/hast-2.3.4.tgz") "8aa5ef92c117d20d974a82bdfb6a648b08c0bafc" [
          (s."@types/unist@*")
          ];
        "@types/hast@^2.0.0" = s."@types/hast@2.3.4";
        "@types/history@4.7.11" = f (sc "types" "history") "4.7.11" (ir "https://registry.yarnpkg.com/@types/history/-/history-4.7.11.tgz") "56588b17ae8f50c53983a524fc3cc47437969d64" [];
        "@types/history@^4.7.11" = s."@types/history@4.7.11";
        "@types/hoist-non-react-statics@*" = s."@types/hoist-non-react-statics@3.3.1";
        "@types/hoist-non-react-statics@3.3.1" = f (sc "types" "hoist-non-react-statics") "3.3.1" (ir "https://registry.yarnpkg.com/@types/hoist-non-react-statics/-/hoist-non-react-statics-3.3.1.tgz") "1124aafe5118cb591977aeb1ceaaed1070eb039f" [
          (s."@types/react@*")
          (s."hoist-non-react-statics@^3.3.0")
          ];
        "@types/html-minifier-terser@5.1.2" = f (sc "types" "html-minifier-terser") "5.1.2" (ir "https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-5.1.2.tgz") "693b316ad323ea97eed6b38ed1a3cc02b1672b57" [];
        "@types/html-minifier-terser@6.1.0" = f (sc "types" "html-minifier-terser") "6.1.0" (ir "https://registry.yarnpkg.com/@types/html-minifier-terser/-/html-minifier-terser-6.1.0.tgz") "4fc33a00c1d0c16987b1a20cf92d20614c55ac35" [];
        "@types/html-minifier-terser@^5.0.0" = s."@types/html-minifier-terser@5.1.2";
        "@types/html-minifier-terser@^6.0.0" = s."@types/html-minifier-terser@6.1.0";
        "@types/http-proxy@1.17.9" = f (sc "types" "http-proxy") "1.17.9" (ir "https://registry.yarnpkg.com/@types/http-proxy/-/http-proxy-1.17.9.tgz") "7f0e7931343761efde1e2bf48c40f02f3f75705a" [
          (s."@types/node@*")
          ];
        "@types/http-proxy@^1.17.8" = s."@types/http-proxy@1.17.9";
        "@types/is-function@1.0.1" = f (sc "types" "is-function") "1.0.1" (ir "https://registry.yarnpkg.com/@types/is-function/-/is-function-1.0.1.tgz") "2d024eace950c836d9e3335a66b97960ae41d022" [];
        "@types/is-function@^1.0.0" = s."@types/is-function@1.0.1";
        "@types/istanbul-lib-coverage@*" = s."@types/istanbul-lib-coverage@2.0.4";
        "@types/istanbul-lib-coverage@2.0.4" = f (sc "types" "istanbul-lib-coverage") "2.0.4" (ir "https://registry.yarnpkg.com/@types/istanbul-lib-coverage/-/istanbul-lib-coverage-2.0.4.tgz") "8467d4b3c087805d63580480890791277ce35c44" [];
        "@types/istanbul-lib-coverage@^2.0.0" = s."@types/istanbul-lib-coverage@2.0.4";
        "@types/istanbul-lib-coverage@^2.0.1" = s."@types/istanbul-lib-coverage@2.0.4";
        "@types/istanbul-lib-report@*" = s."@types/istanbul-lib-report@3.0.0";
        "@types/istanbul-lib-report@3.0.0" = f (sc "types" "istanbul-lib-report") "3.0.0" (ir "https://registry.yarnpkg.com/@types/istanbul-lib-report/-/istanbul-lib-report-3.0.0.tgz") "c14c24f18ea8190c118ee7562b7ff99a36552686" [
          (s."@types/istanbul-lib-coverage@*")
          ];
        "@types/istanbul-reports@3.0.1" = f (sc "types" "istanbul-reports") "3.0.1" (ir "https://registry.yarnpkg.com/@types/istanbul-reports/-/istanbul-reports-3.0.1.tgz") "9153fe98bba2bd565a63add9436d6f0d7f8468ff" [
          (s."@types/istanbul-lib-report@*")
          ];
        "@types/istanbul-reports@^3.0.0" = s."@types/istanbul-reports@3.0.1";
        "@types/jest@*" = s."@types/jest@28.1.3";
        "@types/jest@27.5.2" = f (sc "types" "jest") "27.5.2" (ir "https://registry.yarnpkg.com/@types/jest/-/jest-27.5.2.tgz") "ec49d29d926500ffb9fd22b84262e862049c026c" [
          (s."jest-matcher-utils@^27.0.0")
          (s."pretty-format@^27.0.0")
          ];
        "@types/jest@28.1.3" = f (sc "types" "jest") "28.1.3" (ir "https://registry.yarnpkg.com/@types/jest/-/jest-28.1.3.tgz") "52f3f3e50ce59191ff5fbb1084896cc0cf30c9ce" [
          (s."jest-matcher-utils@^28.0.0")
          (s."pretty-format@^28.0.0")
          ];
        "@types/jest@^27.5.0" = s."@types/jest@27.5.2";
        "@types/js-cookie@2.2.7" = f (sc "types" "js-cookie") "2.2.7" (ir "https://registry.yarnpkg.com/@types/js-cookie/-/js-cookie-2.2.7.tgz") "226a9e31680835a6188e887f3988e60c04d3f6a3" [];
        "@types/js-cookie@^2.2.6" = s."@types/js-cookie@2.2.7";
        "@types/json-schema@*" = s."@types/json-schema@7.0.11";
        "@types/json-schema@7.0.11" = f (sc "types" "json-schema") "7.0.11" (ir "https://registry.yarnpkg.com/@types/json-schema/-/json-schema-7.0.11.tgz") "d421b6c527a3037f7c84433fd2c4229e016863d3" [];
        "@types/json-schema@^7.0.4" = s."@types/json-schema@7.0.11";
        "@types/json-schema@^7.0.5" = s."@types/json-schema@7.0.11";
        "@types/json-schema@^7.0.8" = s."@types/json-schema@7.0.11";
        "@types/json-schema@^7.0.9" = s."@types/json-schema@7.0.11";
        "@types/json5@0.0.29" = f (sc "types" "json5") "0.0.29" (ir "https://registry.yarnpkg.com/@types/json5/-/json5-0.0.29.tgz") "ee28707ae94e11d2b827bcbe5270bcea7f3e71ee" [];
        "@types/json5@^0.0.29" = s."@types/json5@0.0.29";
        "@types/katex@0.11.1" = f (sc "types" "katex") "0.11.1" (ir "https://registry.yarnpkg.com/@types/katex/-/katex-0.11.1.tgz") "34de04477dcf79e2ef6c8d23b41a3d81f9ebeaf5" [];
        "@types/katex@^0.11.0" = s."@types/katex@0.11.1";
        "@types/lodash@4.14.182" = f (sc "types" "lodash") "4.14.182" (ir "https://registry.yarnpkg.com/@types/lodash/-/lodash-4.14.182.tgz") "05301a4d5e62963227eaafe0ce04dd77c54ea5c2" [];
        "@types/lodash@^4.14.167" = s."@types/lodash@4.14.182";
        "@types/lodash@^4.14.175" = s."@types/lodash@4.14.182";
        "@types/lodash@^4.14.182" = s."@types/lodash@4.14.182";
        "@types/mdast@3.0.10" = f (sc "types" "mdast") "3.0.10" (ir "https://registry.yarnpkg.com/@types/mdast/-/mdast-3.0.10.tgz") "4724244a82a4598884cbbe9bcfd73dff927ee8af" [
          (s."@types/unist@*")
          ];
        "@types/mdast@^3.0.0" = s."@types/mdast@3.0.10";
        "@types/mime@1.3.2" = f (sc "types" "mime") "1.3.2" (ir "https://registry.yarnpkg.com/@types/mime/-/mime-1.3.2.tgz") "93e25bf9ee75fe0fd80b594bc4feb0e862111b5a" [];
        "@types/mime@^1" = s."@types/mime@1.3.2";
        "@types/minimatch@*" = s."@types/minimatch@3.0.5";
        "@types/minimatch@3.0.5" = f (sc "types" "minimatch") "3.0.5" (ir "https://registry.yarnpkg.com/@types/minimatch/-/minimatch-3.0.5.tgz") "1001cc5e6a3704b83c236027e77f2f58ea010f40" [];
        "@types/node-fetch@2.6.2" = f (sc "types" "node-fetch") "2.6.2" (ir "https://registry.yarnpkg.com/@types/node-fetch/-/node-fetch-2.6.2.tgz") "d1a9c5fd049d9415dce61571557104dec3ec81da" [
          (s."@types/node@*")
          (s."form-data@^3.0.0")
          ];
        "@types/node-fetch@^2.5.7" = s."@types/node-fetch@2.6.2";
        "@types/node@*" = s."@types/node@18.6.3";
        "@types/node@16.11.41" = f (sc "types" "node") "16.11.41" (ir "https://registry.yarnpkg.com/@types/node/-/node-16.11.41.tgz") "88eb485b1bfdb4c224d878b7832239536aa2f813" [];
        "@types/node@17.0.45" = f (sc "types" "node") "17.0.45" (ir "https://registry.yarnpkg.com/@types/node/-/node-17.0.45.tgz") "2c0fafd78705e7a18b7906b5201a522719dc5190" [];
        "@types/node@18.6.3" = f (sc "types" "node") "18.6.3" (ir "https://registry.yarnpkg.com/@types/node/-/node-18.6.3.tgz") "4e4a95b6fe44014563ceb514b2598b3e623d1c98" [];
        "@types/node@18.x" = s."@types/node@18.6.3";
        "@types/node@^14.0.10 || ^16.0.0" = s."@types/node@16.11.41";
        "@types/node@^14.14.20 || ^16.0.0" = s."@types/node@16.11.41";
        "@types/node@^17.0.5" = s."@types/node@17.0.45";
        "@types/node@^18.6.3" = s."@types/node@18.6.3";
        "@types/normalize-package-data@2.4.1" = f (sc "types" "normalize-package-data") "2.4.1" (ir "https://registry.yarnpkg.com/@types/normalize-package-data/-/normalize-package-data-2.4.1.tgz") "d3357479a0fdfdd5907fe67e17e0a85c906e1301" [];
        "@types/normalize-package-data@^2.4.0" = s."@types/normalize-package-data@2.4.1";
        "@types/npmlog@4.1.4" = f (sc "types" "npmlog") "4.1.4" (ir "https://registry.yarnpkg.com/@types/npmlog/-/npmlog-4.1.4.tgz") "30eb872153c7ead3e8688c476054ddca004115f6" [];
        "@types/npmlog@^4.1.2" = s."@types/npmlog@4.1.4";
        "@types/parse-json@4.0.0" = f (sc "types" "parse-json") "4.0.0" (ir "https://registry.yarnpkg.com/@types/parse-json/-/parse-json-4.0.0.tgz") "2f8bb441434d163b35fb8ffdccd7138927ffb8c0" [];
        "@types/parse-json@^4.0.0" = s."@types/parse-json@4.0.0";
        "@types/parse5@5.0.3" = f (sc "types" "parse5") "5.0.3" (ir "https://registry.yarnpkg.com/@types/parse5/-/parse5-5.0.3.tgz") "e7b5aebbac150f8b5fdd4a46e7f0bd8e65e19109" [];
        "@types/parse5@^5.0.0" = s."@types/parse5@5.0.3";
        "@types/prettier@2.6.3" = f (sc "types" "prettier") "2.6.3" (ir "https://registry.yarnpkg.com/@types/prettier/-/prettier-2.6.3.tgz") "68ada76827b0010d0db071f739314fa429943d0a" [];
        "@types/prettier@^2.1.5" = s."@types/prettier@2.6.3";
        "@types/pretty-hrtime@1.0.1" = f (sc "types" "pretty-hrtime") "1.0.1" (ir "https://registry.yarnpkg.com/@types/pretty-hrtime/-/pretty-hrtime-1.0.1.tgz") "72a26101dc567b0d68fd956cf42314556e42d601" [];
        "@types/pretty-hrtime@^1.0.0" = s."@types/pretty-hrtime@1.0.1";
        "@types/prop-types@*" = s."@types/prop-types@15.7.5";
        "@types/prop-types@15.7.5" = f (sc "types" "prop-types") "15.7.5" (ir "https://registry.yarnpkg.com/@types/prop-types/-/prop-types-15.7.5.tgz") "5f19d2b85a98e9558036f6a3cacc8819420f05cf" [];
        "@types/q@1.5.5" = f (sc "types" "q") "1.5.5" (ir "https://registry.yarnpkg.com/@types/q/-/q-1.5.5.tgz") "75a2a8e7d8ab4b230414505d92335d1dcb53a6df" [];
        "@types/q@^1.5.1" = s."@types/q@1.5.5";
        "@types/qs@*" = s."@types/qs@6.9.7";
        "@types/qs@6.9.7" = f (sc "types" "qs") "6.9.7" (ir "https://registry.yarnpkg.com/@types/qs/-/qs-6.9.7.tgz") "63bb7d067db107cc1e457c303bc25d511febf6cb" [];
        "@types/qs@^6.9.5" = s."@types/qs@6.9.7";
        "@types/raf-schd@4.0.1" = f (sc "types" "raf-schd") "4.0.1" (ir "https://registry.yarnpkg.com/@types/raf-schd/-/raf-schd-4.0.1.tgz") "1f9e03736f277fe9c7b82102bf18570a6ee19f82" [];
        "@types/raf-schd@^4.0.0" = s."@types/raf-schd@4.0.1";
        "@types/range-parser@*" = s."@types/range-parser@1.2.4";
        "@types/range-parser@1.2.4" = f (sc "types" "range-parser") "1.2.4" (ir "https://registry.yarnpkg.com/@types/range-parser/-/range-parser-1.2.4.tgz") "cd667bcfdd025213aafb7ca5915a932590acdcdc" [];
        "@types/react-dom@18.0.5" = f (sc "types" "react-dom") "18.0.5" (ir "https://registry.yarnpkg.com/@types/react-dom/-/react-dom-18.0.5.tgz") "330b2d472c22f796e5531446939eacef8378444a" [
          (s."@types/react@*")
          ];
        "@types/react-dom@^18.0.0" = s."@types/react-dom@18.0.5";
        "@types/react-router-config@*" = s."@types/react-router-config@5.0.6";
        "@types/react-router-config@5.0.6" = f (sc "types" "react-router-config") "5.0.6" (ir "https://registry.yarnpkg.com/@types/react-router-config/-/react-router-config-5.0.6.tgz") "87c5c57e72d241db900d9734512c50ccec062451" [
          (s."@types/history@^4.7.11")
          (s."@types/react@*")
          (s."@types/react-router@*")
          ];
        "@types/react-router-config@^5.0.6" = s."@types/react-router-config@5.0.6";
        "@types/react-router-dom@*" = s."@types/react-router-dom@5.3.3";
        "@types/react-router-dom@5.3.3" = f (sc "types" "react-router-dom") "5.3.3" (ir "https://registry.yarnpkg.com/@types/react-router-dom/-/react-router-dom-5.3.3.tgz") "e9d6b4a66fcdbd651a5f106c2656a30088cc1e83" [
          (s."@types/history@^4.7.11")
          (s."@types/react@*")
          (s."@types/react-router@*")
          ];
        "@types/react-router@*" = s."@types/react-router@5.1.18";
        "@types/react-router@5.1.18" = f (sc "types" "react-router") "5.1.18" (ir "https://registry.yarnpkg.com/@types/react-router/-/react-router-5.1.18.tgz") "c8851884b60bc23733500d86c1266e1cfbbd9ef3" [
          (s."@types/history@^4.7.11")
          (s."@types/react@*")
          ];
        "@types/react-syntax-highlighter@11.0.5" = f (sc "types" "react-syntax-highlighter") "11.0.5" (ir "https://registry.yarnpkg.com/@types/react-syntax-highlighter/-/react-syntax-highlighter-11.0.5.tgz") "0d546261b4021e1f9d85b50401c0a42acb106087" [
          (s."@types/react@*")
          ];
        "@types/react@*" = s."@types/react@18.0.15";
        "@types/react@18.0.15" = f (sc "types" "react") "18.0.15" (ir "https://registry.yarnpkg.com/@types/react/-/react-18.0.15.tgz") "d355644c26832dc27f3e6cbf0c4f4603fc4ab7fe" [
          (s."@types/prop-types@*")
          (s."@types/scheduler@*")
          (s."csstype@^3.0.2")
          ];
        "@types/react@^18.0.1" = s."@types/react@18.0.15";
        "@types/react@^18.0.9" = s."@types/react@18.0.15";
        "@types/resolve@1.17.1" = f (sc "types" "resolve") "1.17.1" (ir "https://registry.yarnpkg.com/@types/resolve/-/resolve-1.17.1.tgz") "3afd6ad8967c77e4376c598a82ddd58f46ec45d6" [
          (s."@types/node@*")
          ];
        "@types/retry@0.12.0" = f (sc "types" "retry") "0.12.0" (ir "https://registry.yarnpkg.com/@types/retry/-/retry-0.12.0.tgz") "2b35eccfcee7d38cd72ad99232fbd58bffb3c84d" [];
        "@types/sax@1.2.4" = f (sc "types" "sax") "1.2.4" (ir "https://registry.yarnpkg.com/@types/sax/-/sax-1.2.4.tgz") "8221affa7f4f3cb21abd22f244cfabfa63e6a69e" [
          (s."@types/node@*")
          ];
        "@types/sax@^1.2.1" = s."@types/sax@1.2.4";
        "@types/scheduler@*" = s."@types/scheduler@0.16.2";
        "@types/scheduler@0.16.2" = f (sc "types" "scheduler") "0.16.2" (ir "https://registry.yarnpkg.com/@types/scheduler/-/scheduler-0.16.2.tgz") "1a62f89525723dde24ba1b01b092bf5df8ad4d39" [];
        "@types/serve-index@1.9.1" = f (sc "types" "serve-index") "1.9.1" (ir "https://registry.yarnpkg.com/@types/serve-index/-/serve-index-1.9.1.tgz") "1b5e85370a192c01ec6cec4735cf2917337a6278" [
          (s."@types/express@*")
          ];
        "@types/serve-index@^1.9.1" = s."@types/serve-index@1.9.1";
        "@types/serve-static@*" = s."@types/serve-static@1.13.10";
        "@types/serve-static@1.13.10" = f (sc "types" "serve-static") "1.13.10" (ir "https://registry.yarnpkg.com/@types/serve-static/-/serve-static-1.13.10.tgz") "f5e0ce8797d2d7cc5ebeda48a52c96c4fa47a8d9" [
          (s."@types/mime@^1")
          (s."@types/node@*")
          ];
        "@types/serve-static@^1.13.10" = s."@types/serve-static@1.13.10";
        "@types/sockjs@0.3.33" = f (sc "types" "sockjs") "0.3.33" (ir "https://registry.yarnpkg.com/@types/sockjs/-/sockjs-0.3.33.tgz") "570d3a0b99ac995360e3136fd6045113b1bd236f" [
          (s."@types/node@*")
          ];
        "@types/sockjs@^0.3.33" = s."@types/sockjs@0.3.33";
        "@types/source-list-map@*" = s."@types/source-list-map@0.1.2";
        "@types/source-list-map@0.1.2" = f (sc "types" "source-list-map") "0.1.2" (ir "https://registry.yarnpkg.com/@types/source-list-map/-/source-list-map-0.1.2.tgz") "0078836063ffaf17412349bba364087e0ac02ec9" [];
        "@types/stack-utils@2.0.1" = f (sc "types" "stack-utils") "2.0.1" (ir "https://registry.yarnpkg.com/@types/stack-utils/-/stack-utils-2.0.1.tgz") "20f18294f797f2209b5f65c8e3b5c8e8261d127c" [];
        "@types/stack-utils@^2.0.0" = s."@types/stack-utils@2.0.1";
        "@types/styled-components@5.1.25" = f (sc "types" "styled-components") "5.1.25" (ir "https://registry.yarnpkg.com/@types/styled-components/-/styled-components-5.1.25.tgz") "0177c4ab5fa7c6ed0565d36f597393dae3f380ad" [
          (s."@types/hoist-non-react-statics@*")
          (s."@types/react@*")
          (s."csstype@^3.0.2")
          ];
        "@types/styled-components@^5.1.24" = s."@types/styled-components@5.1.25";
        "@types/tapable@1.0.8" = f (sc "types" "tapable") "1.0.8" (ir "https://registry.yarnpkg.com/@types/tapable/-/tapable-1.0.8.tgz") "b94a4391c85666c7b73299fd3ad79d4faa435310" [];
        "@types/tapable@^1" = s."@types/tapable@1.0.8";
        "@types/tapable@^1.0.5" = s."@types/tapable@1.0.8";
        "@types/testing-library__jest-dom@5.14.5" = f (sc "types" "testing-library__jest-dom") "5.14.5" (ir "https://registry.yarnpkg.com/@types/testing-library__jest-dom/-/testing-library__jest-dom-5.14.5.tgz") "d113709c90b3c75fdb127ec338dad7d5f86c974f" [
          (s."@types/jest@*")
          ];
        "@types/testing-library__jest-dom@^5.9.1" = s."@types/testing-library__jest-dom@5.14.5";
        "@types/trusted-types@2.0.2" = f (sc "types" "trusted-types") "2.0.2" (ir "https://registry.yarnpkg.com/@types/trusted-types/-/trusted-types-2.0.2.tgz") "fc25ad9943bcac11cceb8168db4f275e0e72e756" [];
        "@types/trusted-types@^2.0.2" = s."@types/trusted-types@2.0.2";
        "@types/uglify-js@*" = s."@types/uglify-js@3.16.0";
        "@types/uglify-js@3.16.0" = f (sc "types" "uglify-js") "3.16.0" (ir "https://registry.yarnpkg.com/@types/uglify-js/-/uglify-js-3.16.0.tgz") "2cf74a0e6ebb6cd54c0d48e509d5bd91160a9602" [
          (s."source-map@^0.6.1")
          ];
        "@types/unist@*" = s."@types/unist@2.0.6";
        "@types/unist@2.0.6" = f (sc "types" "unist") "2.0.6" (ir "https://registry.yarnpkg.com/@types/unist/-/unist-2.0.6.tgz") "250a7b16c3b91f672a24552ec64678eeb1d3a08d" [];
        "@types/unist@^2.0.0" = s."@types/unist@2.0.6";
        "@types/unist@^2.0.2" = s."@types/unist@2.0.6";
        "@types/unist@^2.0.3" = s."@types/unist@2.0.6";
        "@types/vscode@1.69.0" = f (sc "types" "vscode") "1.69.0" (ir "https://registry.yarnpkg.com/@types/vscode/-/vscode-1.69.0.tgz") "a472011af392fbcf82cbb82f60b4c239c21b921c" [];
        "@types/vscode@^1.69.0" = s."@types/vscode@1.69.0";
        "@types/webpack-env@1.17.0" = f (sc "types" "webpack-env") "1.17.0" (ir "https://registry.yarnpkg.com/@types/webpack-env/-/webpack-env-1.17.0.tgz") "f99ce359f1bfd87da90cc4a57cab0a18f34a48d0" [];
        "@types/webpack-env@^1.16.0" = s."@types/webpack-env@1.17.0";
        "@types/webpack-sources@*" = s."@types/webpack-sources@3.2.0";
        "@types/webpack-sources@3.2.0" = f (sc "types" "webpack-sources") "3.2.0" (ir "https://registry.yarnpkg.com/@types/webpack-sources/-/webpack-sources-3.2.0.tgz") "16d759ba096c289034b26553d2df1bf45248d38b" [
          (s."@types/node@*")
          (s."@types/source-list-map@*")
          (s."source-map@^0.7.3")
          ];
        "@types/webpack@4.41.32" = f (sc "types" "webpack") "4.41.32" (ir "https://registry.yarnpkg.com/@types/webpack/-/webpack-4.41.32.tgz") "a7bab03b72904070162b2f169415492209e94212" [
          (s."@types/node@*")
          (s."@types/tapable@^1")
          (s."@types/uglify-js@*")
          (s."@types/webpack-sources@*")
          (s."anymatch@^3.0.0")
          (s."source-map@^0.6.0")
          ];
        "@types/webpack@5.28.0" = f (sc "types" "webpack") "5.28.0" (ir "https://registry.yarnpkg.com/@types/webpack/-/webpack-5.28.0.tgz") "78dde06212f038d77e54116cfe69e88ae9ed2c03" [
          (s."@types/node@*")
          (s."tapable@^2.2.0")
          (s."webpack@^5")
          ];
        "@types/webpack@^4.41.26" = s."@types/webpack@4.41.32";
        "@types/webpack@^4.41.8" = s."@types/webpack@4.41.32";
        "@types/webpack@^5.28.0" = s."@types/webpack@5.28.0";
        "@types/ws@8.5.3" = f (sc "types" "ws") "8.5.3" (ir "https://registry.yarnpkg.com/@types/ws/-/ws-8.5.3.tgz") "7d25a1ffbecd3c4f2d35068d0b283c037003274d" [
          (s."@types/node@*")
          ];
        "@types/ws@^8.5.1" = s."@types/ws@8.5.3";
        "@types/yargs-parser@*" = s."@types/yargs-parser@21.0.0";
        "@types/yargs-parser@21.0.0" = f (sc "types" "yargs-parser") "21.0.0" (ir "https://registry.yarnpkg.com/@types/yargs-parser/-/yargs-parser-21.0.0.tgz") "0c60e537fa790f5f9472ed2776c2b71ec117351b" [];
        "@types/yargs@15.0.14" = f (sc "types" "yargs") "15.0.14" (ir "https://registry.yarnpkg.com/@types/yargs/-/yargs-15.0.14.tgz") "26d821ddb89e70492160b66d10a0eb6df8f6fb06" [
          (s."@types/yargs-parser@*")
          ];
        "@types/yargs@16.0.4" = f (sc "types" "yargs") "16.0.4" (ir "https://registry.yarnpkg.com/@types/yargs/-/yargs-16.0.4.tgz") "26aad98dd2c2a38e421086ea9ad42b9e51642977" [
          (s."@types/yargs-parser@*")
          ];
        "@types/yargs@17.0.10" = f (sc "types" "yargs") "17.0.10" (ir "https://registry.yarnpkg.com/@types/yargs/-/yargs-17.0.10.tgz") "591522fce85d8739bca7b8bb90d048e4478d186a" [
          (s."@types/yargs-parser@*")
          ];
        "@types/yargs@^15.0.0" = s."@types/yargs@15.0.14";
        "@types/yargs@^16.0.0" = s."@types/yargs@16.0.4";
        "@types/yargs@^17.0.8" = s."@types/yargs@17.0.10";
        "@typescript-eslint/eslint-plugin@5.32.0" = f (sc "typescript-eslint" "eslint-plugin") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/eslint-plugin/-/eslint-plugin-5.32.0.tgz") "e27e38cffa4a61226327c874a7be965e9a861624" [
          (s."@typescript-eslint/scope-manager@5.32.0")
          (s."@typescript-eslint/type-utils@5.32.0")
          (s."@typescript-eslint/utils@5.32.0")
          (s."debug@^4.3.4")
          (s."functional-red-black-tree@^1.0.1")
          (s."ignore@^5.2.0")
          (s."regexpp@^3.2.0")
          (s."semver@^7.3.7")
          (s."tsutils@^3.21.0")
          ];
        "@typescript-eslint/eslint-plugin@^5.32.0" = s."@typescript-eslint/eslint-plugin@5.32.0";
        "@typescript-eslint/eslint-plugin@^5.5.0" = s."@typescript-eslint/eslint-plugin@5.32.0";
        "@typescript-eslint/experimental-utils@5.29.0" = f (sc "typescript-eslint" "experimental-utils") "5.29.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/experimental-utils/-/experimental-utils-5.29.0.tgz") "abed79020f623ac4fb76c7fdf917552a17171704" [
          (s."@typescript-eslint/utils@5.29.0")
          ];
        "@typescript-eslint/experimental-utils@^5.0.0" = s."@typescript-eslint/experimental-utils@5.29.0";
        "@typescript-eslint/parser@5.32.0" = f (sc "typescript-eslint" "parser") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/parser/-/parser-5.32.0.tgz") "1de243443bc6186fb153b9e395b842e46877ca5d" [
          (s."@typescript-eslint/scope-manager@5.32.0")
          (s."@typescript-eslint/types@5.32.0")
          (s."@typescript-eslint/typescript-estree@5.32.0")
          (s."debug@^4.3.4")
          ];
        "@typescript-eslint/parser@^5.32.0" = s."@typescript-eslint/parser@5.32.0";
        "@typescript-eslint/parser@^5.5.0" = s."@typescript-eslint/parser@5.32.0";
        "@typescript-eslint/scope-manager@5.29.0" = f (sc "typescript-eslint" "scope-manager") "5.29.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.29.0.tgz") "2a6a32e3416cb133e9af8dcf54bf077a916aeed3" [
          (s."@typescript-eslint/types@5.29.0")
          (s."@typescript-eslint/visitor-keys@5.29.0")
          ];
        "@typescript-eslint/scope-manager@5.32.0" = f (sc "typescript-eslint" "scope-manager") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/scope-manager/-/scope-manager-5.32.0.tgz") "763386e963a8def470580cc36cf9228864190b95" [
          (s."@typescript-eslint/types@5.32.0")
          (s."@typescript-eslint/visitor-keys@5.32.0")
          ];
        "@typescript-eslint/type-utils@5.32.0" = f (sc "typescript-eslint" "type-utils") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/type-utils/-/type-utils-5.32.0.tgz") "45a14506fe3fb908600b4cef2f70778f7b5cdc79" [
          (s."@typescript-eslint/utils@5.32.0")
          (s."debug@^4.3.4")
          (s."tsutils@^3.21.0")
          ];
        "@typescript-eslint/types@5.29.0" = f (sc "typescript-eslint" "types") "5.29.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.29.0.tgz") "7861d3d288c031703b2d97bc113696b4d8c19aab" [];
        "@typescript-eslint/types@5.32.0" = f (sc "typescript-eslint" "types") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/types/-/types-5.32.0.tgz") "484273021eeeae87ddb288f39586ef5efeb6dcd8" [];
        "@typescript-eslint/typescript-estree@5.29.0" = f (sc "typescript-eslint" "typescript-estree") "5.29.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.29.0.tgz") "e83d19aa7fd2e74616aab2f25dfbe4de4f0b5577" [
          (s."@typescript-eslint/types@5.29.0")
          (s."@typescript-eslint/visitor-keys@5.29.0")
          (s."debug@^4.3.4")
          (s."globby@^11.1.0")
          (s."is-glob@^4.0.3")
          (s."semver@^7.3.7")
          (s."tsutils@^3.21.0")
          ];
        "@typescript-eslint/typescript-estree@5.32.0" = f (sc "typescript-eslint" "typescript-estree") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/typescript-estree/-/typescript-estree-5.32.0.tgz") "282943f34babf07a4afa7b0ff347a8e7b6030d12" [
          (s."@typescript-eslint/types@5.32.0")
          (s."@typescript-eslint/visitor-keys@5.32.0")
          (s."debug@^4.3.4")
          (s."globby@^11.1.0")
          (s."is-glob@^4.0.3")
          (s."semver@^7.3.7")
          (s."tsutils@^3.21.0")
          ];
        "@typescript-eslint/utils@5.29.0" = f (sc "typescript-eslint" "utils") "5.29.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-5.29.0.tgz") "775046effd5019667bd086bcf326acbe32cd0082" [
          (s."@types/json-schema@^7.0.9")
          (s."@typescript-eslint/scope-manager@5.29.0")
          (s."@typescript-eslint/types@5.29.0")
          (s."@typescript-eslint/typescript-estree@5.29.0")
          (s."eslint-scope@^5.1.1")
          (s."eslint-utils@^3.0.0")
          ];
        "@typescript-eslint/utils@5.32.0" = f (sc "typescript-eslint" "utils") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/utils/-/utils-5.32.0.tgz") "eccb6b672b94516f1afc6508d05173c45924840c" [
          (s."@types/json-schema@^7.0.9")
          (s."@typescript-eslint/scope-manager@5.32.0")
          (s."@typescript-eslint/types@5.32.0")
          (s."@typescript-eslint/typescript-estree@5.32.0")
          (s."eslint-scope@^5.1.1")
          (s."eslint-utils@^3.0.0")
          ];
        "@typescript-eslint/utils@^5.13.0" = s."@typescript-eslint/utils@5.32.0";
        "@typescript-eslint/visitor-keys@5.29.0" = f (sc "typescript-eslint" "visitor-keys") "5.29.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.29.0.tgz") "7a4749fa7ef5160c44a451bf060ac1dc6dfb77ee" [
          (s."@typescript-eslint/types@5.29.0")
          (s."eslint-visitor-keys@^3.3.0")
          ];
        "@typescript-eslint/visitor-keys@5.32.0" = f (sc "typescript-eslint" "visitor-keys") "5.32.0" (ir "https://registry.yarnpkg.com/@typescript-eslint/visitor-keys/-/visitor-keys-5.32.0.tgz") "b9715d0b11fdb5dd10fd0c42ff13987470525394" [
          (s."@typescript-eslint/types@5.32.0")
          (s."eslint-visitor-keys@^3.3.0")
          ];
        "@webassemblyjs/ast@1.11.1" = f (sc "webassemblyjs" "ast") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.11.1.tgz") "2bfd767eae1a6996f432ff7e8d7fc75679c0b6a7" [
          (s."@webassemblyjs/helper-numbers@1.11.1")
          (s."@webassemblyjs/helper-wasm-bytecode@1.11.1")
          ];
        "@webassemblyjs/ast@1.9.0" = f (sc "webassemblyjs" "ast") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/ast/-/ast-1.9.0.tgz") "bd850604b4042459a5a41cd7d338cbed695ed964" [
          (s."@webassemblyjs/helper-module-context@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/wast-parser@1.9.0")
          ];
        "@webassemblyjs/floating-point-hex-parser@1.11.1" = f (sc "webassemblyjs" "floating-point-hex-parser") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.11.1.tgz") "f6c61a705f0fd7a6aecaa4e8198f23d9dc179e4f" [];
        "@webassemblyjs/floating-point-hex-parser@1.9.0" = f (sc "webassemblyjs" "floating-point-hex-parser") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/floating-point-hex-parser/-/floating-point-hex-parser-1.9.0.tgz") "3c3d3b271bddfc84deb00f71344438311d52ffb4" [];
        "@webassemblyjs/helper-api-error@1.11.1" = f (sc "webassemblyjs" "helper-api-error") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.11.1.tgz") "1a63192d8788e5c012800ba6a7a46c705288fd16" [];
        "@webassemblyjs/helper-api-error@1.9.0" = f (sc "webassemblyjs" "helper-api-error") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-api-error/-/helper-api-error-1.9.0.tgz") "203f676e333b96c9da2eeab3ccef33c45928b6a2" [];
        "@webassemblyjs/helper-buffer@1.11.1" = f (sc "webassemblyjs" "helper-buffer") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.11.1.tgz") "832a900eb444884cde9a7cad467f81500f5e5ab5" [];
        "@webassemblyjs/helper-buffer@1.9.0" = f (sc "webassemblyjs" "helper-buffer") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-buffer/-/helper-buffer-1.9.0.tgz") "a1442d269c5feb23fcbc9ef759dac3547f29de00" [];
        "@webassemblyjs/helper-code-frame@1.9.0" = f (sc "webassemblyjs" "helper-code-frame") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-code-frame/-/helper-code-frame-1.9.0.tgz") "647f8892cd2043a82ac0c8c5e75c36f1d9159f27" [
          (s."@webassemblyjs/wast-printer@1.9.0")
          ];
        "@webassemblyjs/helper-fsm@1.9.0" = f (sc "webassemblyjs" "helper-fsm") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-fsm/-/helper-fsm-1.9.0.tgz") "c05256b71244214671f4b08ec108ad63b70eddb8" [];
        "@webassemblyjs/helper-module-context@1.9.0" = f (sc "webassemblyjs" "helper-module-context") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-module-context/-/helper-module-context-1.9.0.tgz") "25d8884b76839871a08a6c6f806c3979ef712f07" [];
        "@webassemblyjs/helper-numbers@1.11.1" = f (sc "webassemblyjs" "helper-numbers") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-numbers/-/helper-numbers-1.11.1.tgz") "64d81da219fbbba1e3bd1bfc74f6e8c4e10a62ae" [
          (s."@webassemblyjs/floating-point-hex-parser@1.11.1")
          (s."@webassemblyjs/helper-api-error@1.11.1")
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/helper-wasm-bytecode@1.11.1" = f (sc "webassemblyjs" "helper-wasm-bytecode") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.11.1.tgz") "f328241e41e7b199d0b20c18e88429c4433295e1" [];
        "@webassemblyjs/helper-wasm-bytecode@1.9.0" = f (sc "webassemblyjs" "helper-wasm-bytecode") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-bytecode/-/helper-wasm-bytecode-1.9.0.tgz") "4fed8beac9b8c14f8c58b70d124d549dd1fe5790" [];
        "@webassemblyjs/helper-wasm-section@1.11.1" = f (sc "webassemblyjs" "helper-wasm-section") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.11.1.tgz") "21ee065a7b635f319e738f0dd73bfbda281c097a" [
          (s."@webassemblyjs/ast@1.11.1")
          (s."@webassemblyjs/helper-buffer@1.11.1")
          (s."@webassemblyjs/helper-wasm-bytecode@1.11.1")
          (s."@webassemblyjs/wasm-gen@1.11.1")
          ];
        "@webassemblyjs/helper-wasm-section@1.9.0" = f (sc "webassemblyjs" "helper-wasm-section") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/helper-wasm-section/-/helper-wasm-section-1.9.0.tgz") "5a4138d5a6292ba18b04c5ae49717e4167965346" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-buffer@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/wasm-gen@1.9.0")
          ];
        "@webassemblyjs/ieee754@1.11.1" = f (sc "webassemblyjs" "ieee754") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.11.1.tgz") "963929e9bbd05709e7e12243a099180812992614" [
          (s."@xtuc/ieee754@^1.2.0")
          ];
        "@webassemblyjs/ieee754@1.9.0" = f (sc "webassemblyjs" "ieee754") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/ieee754/-/ieee754-1.9.0.tgz") "15c7a0fbaae83fb26143bbacf6d6df1702ad39e4" [
          (s."@xtuc/ieee754@^1.2.0")
          ];
        "@webassemblyjs/leb128@1.11.1" = f (sc "webassemblyjs" "leb128") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.11.1.tgz") "ce814b45574e93d76bae1fb2644ab9cdd9527aa5" [
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/leb128@1.9.0" = f (sc "webassemblyjs" "leb128") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/leb128/-/leb128-1.9.0.tgz") "f19ca0b76a6dc55623a09cffa769e838fa1e1c95" [
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/utf8@1.11.1" = f (sc "webassemblyjs" "utf8") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.11.1.tgz") "d1f8b764369e7c6e6bae350e854dec9a59f0a3ff" [];
        "@webassemblyjs/utf8@1.9.0" = f (sc "webassemblyjs" "utf8") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/utf8/-/utf8-1.9.0.tgz") "04d33b636f78e6a6813227e82402f7637b6229ab" [];
        "@webassemblyjs/wasm-edit@1.11.1" = f (sc "webassemblyjs" "wasm-edit") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.11.1.tgz") "ad206ebf4bf95a058ce9880a8c092c5dec8193d6" [
          (s."@webassemblyjs/ast@1.11.1")
          (s."@webassemblyjs/helper-buffer@1.11.1")
          (s."@webassemblyjs/helper-wasm-bytecode@1.11.1")
          (s."@webassemblyjs/helper-wasm-section@1.11.1")
          (s."@webassemblyjs/wasm-gen@1.11.1")
          (s."@webassemblyjs/wasm-opt@1.11.1")
          (s."@webassemblyjs/wasm-parser@1.11.1")
          (s."@webassemblyjs/wast-printer@1.11.1")
          ];
        "@webassemblyjs/wasm-edit@1.9.0" = f (sc "webassemblyjs" "wasm-edit") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-edit/-/wasm-edit-1.9.0.tgz") "3fe6d79d3f0f922183aa86002c42dd256cfee9cf" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-buffer@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/helper-wasm-section@1.9.0")
          (s."@webassemblyjs/wasm-gen@1.9.0")
          (s."@webassemblyjs/wasm-opt@1.9.0")
          (s."@webassemblyjs/wasm-parser@1.9.0")
          (s."@webassemblyjs/wast-printer@1.9.0")
          ];
        "@webassemblyjs/wasm-gen@1.11.1" = f (sc "webassemblyjs" "wasm-gen") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.11.1.tgz") "86c5ea304849759b7d88c47a32f4f039ae3c8f76" [
          (s."@webassemblyjs/ast@1.11.1")
          (s."@webassemblyjs/helper-wasm-bytecode@1.11.1")
          (s."@webassemblyjs/ieee754@1.11.1")
          (s."@webassemblyjs/leb128@1.11.1")
          (s."@webassemblyjs/utf8@1.11.1")
          ];
        "@webassemblyjs/wasm-gen@1.9.0" = f (sc "webassemblyjs" "wasm-gen") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-gen/-/wasm-gen-1.9.0.tgz") "50bc70ec68ded8e2763b01a1418bf43491a7a49c" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/ieee754@1.9.0")
          (s."@webassemblyjs/leb128@1.9.0")
          (s."@webassemblyjs/utf8@1.9.0")
          ];
        "@webassemblyjs/wasm-opt@1.11.1" = f (sc "webassemblyjs" "wasm-opt") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.11.1.tgz") "657b4c2202f4cf3b345f8a4c6461c8c2418985f2" [
          (s."@webassemblyjs/ast@1.11.1")
          (s."@webassemblyjs/helper-buffer@1.11.1")
          (s."@webassemblyjs/wasm-gen@1.11.1")
          (s."@webassemblyjs/wasm-parser@1.11.1")
          ];
        "@webassemblyjs/wasm-opt@1.9.0" = f (sc "webassemblyjs" "wasm-opt") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-opt/-/wasm-opt-1.9.0.tgz") "2211181e5b31326443cc8112eb9f0b9028721a61" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-buffer@1.9.0")
          (s."@webassemblyjs/wasm-gen@1.9.0")
          (s."@webassemblyjs/wasm-parser@1.9.0")
          ];
        "@webassemblyjs/wasm-parser@1.11.1" = f (sc "webassemblyjs" "wasm-parser") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.11.1.tgz") "86ca734534f417e9bd3c67c7a1c75d8be41fb199" [
          (s."@webassemblyjs/ast@1.11.1")
          (s."@webassemblyjs/helper-api-error@1.11.1")
          (s."@webassemblyjs/helper-wasm-bytecode@1.11.1")
          (s."@webassemblyjs/ieee754@1.11.1")
          (s."@webassemblyjs/leb128@1.11.1")
          (s."@webassemblyjs/utf8@1.11.1")
          ];
        "@webassemblyjs/wasm-parser@1.9.0" = f (sc "webassemblyjs" "wasm-parser") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wasm-parser/-/wasm-parser-1.9.0.tgz") "9d48e44826df4a6598294aa6c87469d642fff65e" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-api-error@1.9.0")
          (s."@webassemblyjs/helper-wasm-bytecode@1.9.0")
          (s."@webassemblyjs/ieee754@1.9.0")
          (s."@webassemblyjs/leb128@1.9.0")
          (s."@webassemblyjs/utf8@1.9.0")
          ];
        "@webassemblyjs/wast-parser@1.9.0" = f (sc "webassemblyjs" "wast-parser") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wast-parser/-/wast-parser-1.9.0.tgz") "3031115d79ac5bd261556cecc3fa90a3ef451914" [
          (s."@webassemblyjs/floating-point-hex-parser@1.9.0")
          (s."@webassemblyjs/helper-api-error@1.9.0")
          (s."@webassemblyjs/helper-code-frame@1.9.0")
          (s."@webassemblyjs/helper-fsm@1.9.0")
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/wast-printer@1.11.1" = f (sc "webassemblyjs" "wast-printer") "1.11.1" (ir "https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.11.1.tgz") "d0c73beda8eec5426f10ae8ef55cee5e7084c2f0" [
          (s."@webassemblyjs/ast@1.11.1")
          (s."@xtuc/long@4.2.2")
          ];
        "@webassemblyjs/wast-printer@1.9.0" = f (sc "webassemblyjs" "wast-printer") "1.9.0" (ir "https://registry.yarnpkg.com/@webassemblyjs/wast-printer/-/wast-printer-1.9.0.tgz") "4935d54c85fef637b00ce9f52377451d00d47899" [
          (s."@xtuc/long@4.2.2")
          ];
        "@webpack-cli/configtest@1.2.0" = f (sc "webpack-cli" "configtest") "1.2.0" (ir "https://registry.yarnpkg.com/@webpack-cli/configtest/-/configtest-1.2.0.tgz") "7b20ce1c12533912c3b217ea68262365fa29a6f5" [];
        "@webpack-cli/configtest@^1.2.0" = s."@webpack-cli/configtest@1.2.0";
        "@webpack-cli/info@1.5.0" = f (sc "webpack-cli" "info") "1.5.0" (ir "https://registry.yarnpkg.com/@webpack-cli/info/-/info-1.5.0.tgz") "6c78c13c5874852d6e2dd17f08a41f3fe4c261b1" [
          (s."envinfo@^7.7.3")
          ];
        "@webpack-cli/info@^1.5.0" = s."@webpack-cli/info@1.5.0";
        "@webpack-cli/serve@1.7.0" = f (sc "webpack-cli" "serve") "1.7.0" (ir "https://registry.yarnpkg.com/@webpack-cli/serve/-/serve-1.7.0.tgz") "e1993689ac42d2b16e9194376cfb6753f6254db1" [];
        "@webpack-cli/serve@^1.7.0" = s."@webpack-cli/serve@1.7.0";
        "@xobotyi/scrollbar-width@1.9.5" = f (sc "xobotyi" "scrollbar-width") "1.9.5" (ir "https://registry.yarnpkg.com/@xobotyi/scrollbar-width/-/scrollbar-width-1.9.5.tgz") "80224a6919272f405b87913ca13b92929bdf3c4d" [];
        "@xobotyi/scrollbar-width@^1.9.5" = s."@xobotyi/scrollbar-width@1.9.5";
        "@xtuc/ieee754@1.2.0" = f (sc "xtuc" "ieee754") "1.2.0" (ir "https://registry.yarnpkg.com/@xtuc/ieee754/-/ieee754-1.2.0.tgz") "eef014a3145ae477a1cbc00cd1e552336dceb790" [];
        "@xtuc/ieee754@^1.2.0" = s."@xtuc/ieee754@1.2.0";
        "@xtuc/long@4.2.2" = f (sc "xtuc" "long") "4.2.2" (ir "https://registry.yarnpkg.com/@xtuc/long/-/long-4.2.2.tgz") "d291c6a4e97989b5c61d9acf396ae4fe133a718d" [];
        "abab@2.0.6" = f "abab" "2.0.6" y "41b80f2c871d19686216b82309231cfd3cb3d291" [];
        "abab@^2.0.3" = s."abab@2.0.6";
        "abab@^2.0.5" = s."abab@2.0.6";
        "accepts@1.3.8" = f "accepts" "1.3.8" y "0bf0be125b67014adcb0b0921e62db7bffe16b2e" [
          (s."mime-types@~2.1.34")
          (s."negotiator@0.6.3")
          ];
        "accepts@~1.3.4" = s."accepts@1.3.8";
        "accepts@~1.3.5" = s."accepts@1.3.8";
        "accepts@~1.3.8" = s."accepts@1.3.8";
        "ace-builds@1.6.0" = f "ace-builds" "1.6.0" y "4e1652a0e33c4ae262dc841b1254dd2ad0beb5da" [];
        "ace-builds@^1.4.14" = s."ace-builds@1.6.0";
        "acorn-globals@6.0.0" = f "acorn-globals" "6.0.0" y "46cdd39f0f8ff08a876619b55f5ac8a6dc770b45" [
          (s."acorn@^7.1.1")
          (s."acorn-walk@^7.1.1")
          ];
        "acorn-globals@^6.0.0" = s."acorn-globals@6.0.0";
        "acorn-import-assertions@1.8.0" = f "acorn-import-assertions" "1.8.0" y "ba2b5939ce62c238db6d93d81c9b111b29b855e9" [];
        "acorn-import-assertions@^1.7.6" = s."acorn-import-assertions@1.8.0";
        "acorn-jsx@5.3.2" = f "acorn-jsx" "5.3.2" y "7ed5bb55908b3b2f1bc55c6af1653bada7f07937" [];
        "acorn-jsx@^5.3.1" = s."acorn-jsx@5.3.2";
        "acorn-jsx@^5.3.2" = s."acorn-jsx@5.3.2";
        "acorn-node@1.8.2" = f "acorn-node" "1.8.2" y "114c95d64539e53dede23de8b9d96df7c7ae2af8" [
          (s."acorn@^7.0.0")
          (s."acorn-walk@^7.0.0")
          (s."xtend@^4.0.2")
          ];
        "acorn-node@^1.8.2" = s."acorn-node@1.8.2";
        "acorn-walk@7.2.0" = f "acorn-walk" "7.2.0" y "0de889a601203909b0fbe07b8938dc21d2e967bc" [];
        "acorn-walk@8.2.0" = f "acorn-walk" "8.2.0" y "741210f2e2426454508853a2f44d0ab83b7f69c1" [];
        "acorn-walk@^7.0.0" = s."acorn-walk@7.2.0";
        "acorn-walk@^7.1.1" = s."acorn-walk@7.2.0";
        "acorn-walk@^7.2.0" = s."acorn-walk@7.2.0";
        "acorn-walk@^8.0.0" = s."acorn-walk@8.2.0";
        "acorn-walk@^8.1.1" = s."acorn-walk@8.2.0";
        "acorn@6.4.2" = f "acorn" "6.4.2" y "35866fd710528e92de10cf06016498e47e39e1e6" [];
        "acorn@7.4.1" = f "acorn" "7.4.1" y "feaed255973d2e77555b83dbc08851a6c63520fa" [];
        "acorn@8.7.1" = f "acorn" "8.7.1" y "0197122c843d1bf6d0a5e83220a788f278f63c30" [];
        "acorn@8.8.0" = f "acorn" "8.8.0" y "88c0187620435c7f6015803f5539dae05a9dbea8" [];
        "acorn@^6.4.1" = s."acorn@6.4.2";
        "acorn@^7.0.0" = s."acorn@7.4.1";
        "acorn@^7.1.1" = s."acorn@7.4.1";
        "acorn@^7.4.1" = s."acorn@7.4.1";
        "acorn@^8.0.4" = s."acorn@8.7.1";
        "acorn@^8.2.4" = s."acorn@8.7.1";
        "acorn@^8.4.1" = s."acorn@8.7.1";
        "acorn@^8.5.0" = s."acorn@8.7.1";
        "acorn@^8.7.1" = s."acorn@8.7.1";
        "acorn@^8.8.0" = s."acorn@8.8.0";
        "address@1.2.0" = f "address" "1.2.0" y "d352a62c92fee90f89a693eccd2a8b2139ab02d9" [];
        "address@^1.0.1" = s."address@1.2.0";
        "address@^1.1.2" = s."address@1.2.0";
        "adjust-sourcemap-loader@4.0.0" = f "adjust-sourcemap-loader" "4.0.0" y "fc4a0fd080f7d10471f30a7320f25560ade28c99" [
          (s."loader-utils@^2.0.0")
          (s."regex-parser@^2.2.11")
          ];
        "adjust-sourcemap-loader@^4.0.0" = s."adjust-sourcemap-loader@4.0.0";
        "agent-base@6" = s."agent-base@6.0.2";
        "agent-base@6.0.2" = f "agent-base" "6.0.2" y "49fff58577cfee3f37176feab4c22e00f86d7f77" [
          (s."debug@4")
          ];
        "aggregate-error@3.1.0" = f "aggregate-error" "3.1.0" y "92670ff50f5359bdb7a3e0d40d0ec30c5737687a" [
          (s."clean-stack@^2.0.0")
          (s."indent-string@^4.0.0")
          ];
        "aggregate-error@^3.0.0" = s."aggregate-error@3.1.0";
        "airbnb-js-shims@2.2.1" = f "airbnb-js-shims" "2.2.1" y "db481102d682b98ed1daa4c5baa697a05ce5c040" [
          (s."array-includes@^3.0.3")
          (s."array.prototype.flat@^1.2.1")
          (s."array.prototype.flatmap@^1.2.1")
          (s."es5-shim@^4.5.13")
          (s."es6-shim@^0.35.5")
          (s."function.prototype.name@^1.1.0")
          (s."globalthis@^1.0.0")
          (s."object.entries@^1.1.0")
          (s."object.fromentries@^2.0.0 || ^1.0.0")
          (s."object.getownpropertydescriptors@^2.0.3")
          (s."object.values@^1.1.0")
          (s."promise.allsettled@^1.0.0")
          (s."promise.prototype.finally@^3.1.0")
          (s."string.prototype.matchall@^4.0.0 || ^3.0.1")
          (s."string.prototype.padend@^3.0.0")
          (s."string.prototype.padstart@^3.0.0")
          (s."symbol.prototype.description@^1.0.0")
          ];
        "airbnb-js-shims@^2.2.1" = s."airbnb-js-shims@2.2.1";
        "ajv-errors@1.0.1" = f "ajv-errors" "1.0.1" y "f35986aceb91afadec4102fbd85014950cefa64d" [];
        "ajv-errors@^1.0.0" = s."ajv-errors@1.0.1";
        "ajv-formats@2.1.1" = f "ajv-formats" "2.1.1" y "6e669400659eb74973bbf2e33327180a0996b520" [
          (s."ajv@^8.0.0")
          ];
        "ajv-formats@^2.1.1" = s."ajv-formats@2.1.1";
        "ajv-keywords@3.5.2" = f "ajv-keywords" "3.5.2" y "31f29da5ab6e00d1c2d329acf7b5929614d5014d" [];
        "ajv-keywords@5.1.0" = f "ajv-keywords" "5.1.0" y "69d4d385a4733cdbeab44964a1170a88f87f0e16" [
          (s."fast-deep-equal@^3.1.3")
          ];
        "ajv-keywords@^3.1.0" = s."ajv-keywords@3.5.2";
        "ajv-keywords@^3.4.1" = s."ajv-keywords@3.5.2";
        "ajv-keywords@^3.5.2" = s."ajv-keywords@3.5.2";
        "ajv-keywords@^5.0.0" = s."ajv-keywords@5.1.0";
        "ajv@6.12.6" = f "ajv" "6.12.6" y "baf5a62e802b07d977034586f8c3baf5adf26df4" [
          (s."fast-deep-equal@^3.1.1")
          (s."fast-json-stable-stringify@^2.0.0")
          (s."json-schema-traverse@^0.4.1")
          (s."uri-js@^4.2.2")
          ];
        "ajv@8.11.0" = f "ajv" "8.11.0" y "977e91dd96ca669f54a11e23e378e33b884a565f" [
          (s."fast-deep-equal@^3.1.1")
          (s."json-schema-traverse@^1.0.0")
          (s."require-from-string@^2.0.2")
          (s."uri-js@^4.2.2")
          ];
        "ajv@^6.1.0" = s."ajv@6.12.6";
        "ajv@^6.10.0" = s."ajv@6.12.6";
        "ajv@^6.10.2" = s."ajv@6.12.6";
        "ajv@^6.12.2" = s."ajv@6.12.6";
        "ajv@^6.12.4" = s."ajv@6.12.6";
        "ajv@^6.12.5" = s."ajv@6.12.6";
        "ajv@^8.0.0" = s."ajv@8.11.0";
        "ajv@^8.6.0" = s."ajv@8.11.0";
        "ajv@^8.8.0" = s."ajv@8.11.0";
        "algoliasearch-helper@3.10.0" = f "algoliasearch-helper" "3.10.0" y "59a0f645dd3c7e55cf01faa568d1af50c49d36f6" [
          (s."@algolia/events@^4.0.1")
          ];
        "algoliasearch-helper@^3.10.0" = s."algoliasearch-helper@3.10.0";
        "algoliasearch@4.13.1" = f "algoliasearch" "4.13.1" y "54195c41c9e4bd13ed64982248cf49d4576974fe" [
          (s."@algolia/cache-browser-local-storage@4.13.1")
          (s."@algolia/cache-common@4.13.1")
          (s."@algolia/cache-in-memory@4.13.1")
          (s."@algolia/client-account@4.13.1")
          (s."@algolia/client-analytics@4.13.1")
          (s."@algolia/client-common@4.13.1")
          (s."@algolia/client-personalization@4.13.1")
          (s."@algolia/client-search@4.13.1")
          (s."@algolia/logger-common@4.13.1")
          (s."@algolia/logger-console@4.13.1")
          (s."@algolia/requester-browser-xhr@4.13.1")
          (s."@algolia/requester-common@4.13.1")
          (s."@algolia/requester-node-http@4.13.1")
          (s."@algolia/transporter@4.13.1")
          ];
        "algoliasearch@^4.0.0" = s."algoliasearch@4.13.1";
        "algoliasearch@^4.13.1" = s."algoliasearch@4.13.1";
        "ansi-align@3.0.1" = f "ansi-align" "3.0.1" y "0cdf12e111ace773a86e9a1fad1225c43cb19a59" [
          (s."string-width@^4.1.0")
          ];
        "ansi-align@^3.0.0" = s."ansi-align@3.0.1";
        "ansi-align@^3.0.1" = s."ansi-align@3.0.1";
        "ansi-colors@3.2.4" = f "ansi-colors" "3.2.4" y "e3a3da4bfbae6c86a9c285625de124a234026fbf" [];
        "ansi-colors@^3.0.0" = s."ansi-colors@3.2.4";
        "ansi-escapes@4.3.2" = f "ansi-escapes" "4.3.2" y "6b2291d1db7d98b6521d5f1efa42d0f3a9feb65e" [
          (s."type-fest@^0.21.3")
          ];
        "ansi-escapes@^4.2.1" = s."ansi-escapes@4.3.2";
        "ansi-escapes@^4.3.1" = s."ansi-escapes@4.3.2";
        "ansi-html-community@0.0.8" = f "ansi-html-community" "0.0.8" y "69fbc4d6ccbe383f9736934ae34c3f8290f1bf41" [];
        "ansi-html-community@^0.0.8" = s."ansi-html-community@0.0.8";
        "ansi-regex@2.1.1" = f "ansi-regex" "2.1.1" y "c3b33ab5ee360d86e0e628f0468ae7ef27d654df" [];
        "ansi-regex@5.0.1" = f "ansi-regex" "5.0.1" y "082cb2c89c9fe8659a311a53bd6a4dc5301db304" [];
        "ansi-regex@6.0.1" = f "ansi-regex" "6.0.1" y "3183e38fae9a65d7cb5e53945cd5897d0260a06a" [];
        "ansi-regex@^2.0.0" = s."ansi-regex@2.1.1";
        "ansi-regex@^5.0.1" = s."ansi-regex@5.0.1";
        "ansi-regex@^6.0.1" = s."ansi-regex@6.0.1";
        "ansi-styles@2.2.1" = f "ansi-styles" "2.2.1" y "b432dd3358b634cf75e1e4664368240533c1ddbe" [];
        "ansi-styles@3.2.1" = f "ansi-styles" "3.2.1" y "41fbb20243e50b12be0f04b8dedbf07520ce841d" [
          (s."color-convert@^1.9.0")
          ];
        "ansi-styles@4.3.0" = f "ansi-styles" "4.3.0" y "edd803628ae71c04c85ae7a0906edad34b648937" [
          (s."color-convert@^2.0.1")
          ];
        "ansi-styles@5.2.0" = f "ansi-styles" "5.2.0" y "07449690ad45777d1924ac2abb2fc8895dba836b" [];
        "ansi-styles@6.1.0" = f "ansi-styles" "6.1.0" y "87313c102b8118abd57371afab34618bf7350ed3" [];
        "ansi-styles@^2.2.1" = s."ansi-styles@2.2.1";
        "ansi-styles@^3.2.1" = s."ansi-styles@3.2.1";
        "ansi-styles@^4.0.0" = s."ansi-styles@4.3.0";
        "ansi-styles@^4.1.0" = s."ansi-styles@4.3.0";
        "ansi-styles@^5.0.0" = s."ansi-styles@5.2.0";
        "ansi-styles@^6.1.0" = s."ansi-styles@6.1.0";
        "ansi-to-html@0.6.15" = f "ansi-to-html" "0.6.15" y "ac6ad4798a00f6aa045535d7f6a9cb9294eebea7" [
          (s."entities@^2.0.0")
          ];
        "ansi-to-html@^0.6.11" = s."ansi-to-html@0.6.15";
        "anymatch@2.0.0" = f "anymatch" "2.0.0" y "bcb24b4f37934d9aa7ac17b4adaf89e7c76ef2eb" [
          (s."micromatch@^3.1.4")
          (s."normalize-path@^2.1.1")
          ];
        "anymatch@3.1.2" = f "anymatch" "3.1.2" y "c0557c096af32f106198f4f4e2a383537e378716" [
          (s."normalize-path@^3.0.0")
          (s."picomatch@^2.0.4")
          ];
        "anymatch@^2.0.0" = s."anymatch@2.0.0";
        "anymatch@^3.0.0" = s."anymatch@3.1.2";
        "anymatch@^3.0.3" = s."anymatch@3.1.2";
        "anymatch@~3.1.2" = s."anymatch@3.1.2";
        "app-root-dir@1.0.2" = f "app-root-dir" "1.0.2" y "38187ec2dea7577fff033ffcb12172692ff6e118" [];
        "app-root-dir@^1.0.2" = s."app-root-dir@1.0.2";
        "append-transform@2.0.0" = f "append-transform" "2.0.0" y "99d9d29c7b38391e6f428d28ce136551f0b77e12" [
          (s."default-require-extensions@^3.0.0")
          ];
        "append-transform@^2.0.0" = s."append-transform@2.0.0";
        "aproba@1.2.0" = f "aproba" "1.2.0" y "6802e6264efd18c790a1b0d517f0f2627bf2c94a" [];
        "aproba@2.0.0" = f "aproba" "2.0.0" y "52520b8ae5b569215b354efc0caa3fe1e45a8adc" [];
        "aproba@^1.0.3 || ^2.0.0" = s."aproba@2.0.0";
        "aproba@^1.1.1" = s."aproba@1.2.0";
        "archy@1.0.0" = f "archy" "1.0.0" y "f9c8c13757cc1dd7bc379ac77b2c62a5c2868c40" [];
        "archy@^1.0.0" = s."archy@1.0.0";
        "are-we-there-yet@2.0.0" = f "are-we-there-yet" "2.0.0" y "372e0e7bd279d8e94c653aaa1f67200884bf3e1c" [
          (s."delegates@^1.0.0")
          (s."readable-stream@^3.6.0")
          ];
        "are-we-there-yet@^2.0.0" = s."are-we-there-yet@2.0.0";
        "arg@4.1.3" = f "arg" "4.1.3" y "269fc7ad5b8e42cb63c896d5666017261c144089" [];
        "arg@5.0.2" = f "arg" "5.0.2" y "c81433cc427c92c4dcf4865142dbca6f15acd59c" [];
        "arg@^4.1.0" = s."arg@4.1.3";
        "arg@^5.0.0" = s."arg@5.0.2";
        "arg@^5.0.2" = s."arg@5.0.2";
        "argparse@1.0.10" = f "argparse" "1.0.10" y "bcd6791ea5ae09725e17e5ad988134cd40b3d911" [
          (s."sprintf-js@~1.0.2")
          ];
        "argparse@2.0.1" = f "argparse" "2.0.1" y "246f50f3ca78a3240f6c997e8a9bd1eac49e4b38" [];
        "argparse@^1.0.7" = s."argparse@1.0.10";
        "argparse@^2.0.1" = s."argparse@2.0.1";
        "argv@0.0.2" = f "argv" "0.0.2" y "ecbd16f8949b157183711b1bda334f37840185ab" [];
        "aria-hidden@1.1.3" = f "aria-hidden" "1.1.3" y "bb48de18dc84787a3c6eee113709c473c64ec254" [
          (s."tslib@^1.0.0")
          ];
        "aria-hidden@^1.1.3" = s."aria-hidden@1.1.3";
        "aria-query@4.2.2" = f "aria-query" "4.2.2" y "0d2ca6c9aceb56b8977e9fed6aed7e15bbd2f83b" [
          (s."@babel/runtime@^7.10.2")
          (s."@babel/runtime-corejs3@^7.10.2")
          ];
        "aria-query@5.0.0" = f "aria-query" "5.0.0" y "210c21aaf469613ee8c9a62c7f86525e058db52c" [];
        "aria-query@^4.2.2" = s."aria-query@4.2.2";
        "aria-query@^5.0.0" = s."aria-query@5.0.0";
        "arr-diff@4.0.0" = f "arr-diff" "4.0.0" y "d6461074febfec71e7e15235761a329a5dc7c520" [];
        "arr-diff@^4.0.0" = s."arr-diff@4.0.0";
        "arr-flatten@1.1.0" = f "arr-flatten" "1.1.0" y "36048bbff4e7b47e136644316c99669ea5ae91f1" [];
        "arr-flatten@^1.1.0" = s."arr-flatten@1.1.0";
        "arr-union@3.1.0" = f "arr-union" "3.1.0" y "e39b09aea9def866a8f206e288af63919bae39c4" [];
        "arr-union@^3.1.0" = s."arr-union@3.1.0";
        "array-find-index@1.0.2" = f "array-find-index" "1.0.2" y "df010aa1287e164bbda6f9723b0a96a1ec4187a1" [];
        "array-find-index@^1.0.1" = s."array-find-index@1.0.2";
        "array-flat-polyfill@1.0.1" = f "array-flat-polyfill" "1.0.1" y "1e3a4255be619dfbffbfd1d635c1cf357cd034e7" [];
        "array-flat-polyfill@^1.0.1" = s."array-flat-polyfill@1.0.1";
        "array-flatten@1.1.1" = f "array-flatten" "1.1.1" y "9a5f699051b1e7073328f2a008968b64ea2955d2" [];
        "array-flatten@2.1.2" = f "array-flatten" "2.1.2" y "24ef80a28c1a893617e2149b0c6d0d788293b099" [];
        "array-flatten@^2.1.2" = s."array-flatten@2.1.2";
        "array-includes@3.1.5" = f "array-includes" "3.1.5" y "2c320010db8d31031fd2a5f6b3bbd4b1aad31bdb" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.4")
          (s."es-abstract@^1.19.5")
          (s."get-intrinsic@^1.1.1")
          (s."is-string@^1.0.7")
          ];
        "array-includes@^3.0.3" = s."array-includes@3.1.5";
        "array-includes@^3.1.4" = s."array-includes@3.1.5";
        "array-includes@^3.1.5" = s."array-includes@3.1.5";
        "array-union@1.0.2" = f "array-union" "1.0.2" y "9a34410e4f4e3da23dea375be5be70f24778ec39" [
          (s."array-uniq@^1.0.1")
          ];
        "array-union@2.1.0" = f "array-union" "2.1.0" y "b798420adbeb1de828d84acd8a2e23d3efe85e8d" [];
        "array-union@^1.0.2" = s."array-union@1.0.2";
        "array-union@^2.1.0" = s."array-union@2.1.0";
        "array-uniq@1.0.3" = f "array-uniq" "1.0.3" y "af6ac877a25cc7f74e058894753858dfdb24fdb6" [];
        "array-uniq@^1.0.1" = s."array-uniq@1.0.3";
        "array-unique@0.3.2" = f "array-unique" "0.3.2" y "a894b75d4bc4f6cd679ef3244a9fd8f46ae2d428" [];
        "array-unique@^0.3.2" = s."array-unique@0.3.2";
        "array.prototype.flat@1.3.0" = f "array.prototype.flat" "1.3.0" y "0b0c1567bf57b38b56b4c97b8aa72ab45e4adc7b" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.2")
          (s."es-shim-unscopables@^1.0.0")
          ];
        "array.prototype.flat@^1.2.1" = s."array.prototype.flat@1.3.0";
        "array.prototype.flat@^1.2.5" = s."array.prototype.flat@1.3.0";
        "array.prototype.flatmap@1.3.0" = f "array.prototype.flatmap" "1.3.0" y "a7e8ed4225f4788a70cd910abcf0791e76a5534f" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.2")
          (s."es-shim-unscopables@^1.0.0")
          ];
        "array.prototype.flatmap@^1.2.1" = s."array.prototype.flatmap@1.3.0";
        "array.prototype.flatmap@^1.3.0" = s."array.prototype.flatmap@1.3.0";
        "array.prototype.map@1.0.4" = f "array.prototype.map" "1.0.4" y "0d97b640cfdd036c1b41cfe706a5e699aa0711f2" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.0")
          (s."es-array-method-boxes-properly@^1.0.0")
          (s."is-string@^1.0.7")
          ];
        "array.prototype.map@^1.0.4" = s."array.prototype.map@1.0.4";
        "array.prototype.reduce@1.0.4" = f "array.prototype.reduce" "1.0.4" y "8167e80089f78bff70a99e20bd4201d4663b0a6f" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.2")
          (s."es-array-method-boxes-properly@^1.0.0")
          (s."is-string@^1.0.7")
          ];
        "array.prototype.reduce@^1.0.4" = s."array.prototype.reduce@1.0.4";
        "arrify@2.0.1" = f "arrify" "2.0.1" y "c9655e9331e0abcd588d2a7cad7e9956f66701fa" [];
        "arrify@^2.0.1" = s."arrify@2.0.1";
        "asap@2.0.6" = f "asap" "2.0.6" y "e50347611d7e690943208bbdafebcbc2fb866d46" [];
        "asap@~2.0.3" = s."asap@2.0.6";
        "asap@~2.0.6" = s."asap@2.0.6";
        "asn1.js@5.4.1" = f "asn1.js" "5.4.1" y "11a980b84ebb91781ce35b0fdc2ee294e3783f07" [
          (s."bn.js@^4.0.0")
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          (s."safer-buffer@^2.1.0")
          ];
        "asn1.js@^5.2.0" = s."asn1.js@5.4.1";
        "assert@1.5.0" = f "assert" "1.5.0" y "55c109aaf6e0aefdb3dc4b71240c70bf574b18eb" [
          (s."object-assign@^4.1.1")
          (s."util@0.10.3")
          ];
        "assert@^1.1.1" = s."assert@1.5.0";
        "assign-symbols@1.0.0" = f "assign-symbols" "1.0.0" y "59667f41fadd4f20ccbc2bb96b8d4f7f78ec0367" [];
        "assign-symbols@^1.0.0" = s."assign-symbols@1.0.0";
        "ast-types-flow@0.0.7" = f "ast-types-flow" "0.0.7" y "f70b735c6bca1a5c9c22d982c3e39e7feba3bdad" [];
        "ast-types-flow@^0.0.7" = s."ast-types-flow@0.0.7";
        "ast-types@0.14.2" = f "ast-types" "0.14.2" y "600b882df8583e3cd4f2df5fa20fa83759d4bdfd" [
          (s."tslib@^2.0.1")
          ];
        "ast-types@^0.14.2" = s."ast-types@0.14.2";
        "async-each@1.0.3" = f "async-each" "1.0.3" y "b727dbf87d7651602f06f4d4ac387f47d91b0cbf" [];
        "async-each@^1.0.1" = s."async-each@1.0.3";
        "async@3.2.4" = f "async" "3.2.4" y "2d22e00f8cddeb5fde5dd33522b56d1cf569a81c" [];
        "async@^3.2.3" = s."async@3.2.4";
        "asynckit@0.4.0" = f "asynckit" "0.4.0" y "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79" [];
        "asynckit@^0.4.0" = s."asynckit@0.4.0";
        "at-least-node@1.0.0" = f "at-least-node" "1.0.0" y "602cd4b46e844ad4effc92a8011a3c46e0238dc2" [];
        "at-least-node@^1.0.0" = s."at-least-node@1.0.0";
        "atob@2.1.2" = f "atob" "2.1.2" y "6d9517eb9e030d2436666651e86bd9f6f13533c9" [];
        "atob@^2.1.2" = s."atob@2.1.2";
        "autoprefixer@10.4.7" = f "autoprefixer" "10.4.7" y "1db8d195f41a52ca5069b7593be167618edbbedf" [
          (s."browserslist@^4.20.3")
          (s."caniuse-lite@^1.0.30001335")
          (s."fraction.js@^4.2.0")
          (s."normalize-range@^0.1.2")
          (s."picocolors@^1.0.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "autoprefixer@9.8.8" = f "autoprefixer" "9.8.8" y "fd4bd4595385fa6f06599de749a4d5f7a474957a" [
          (s."browserslist@^4.12.0")
          (s."caniuse-lite@^1.0.30001109")
          (s."normalize-range@^0.1.2")
          (s."num2fraction@^1.2.2")
          (s."picocolors@^0.2.1")
          (s."postcss@^7.0.32")
          (s."postcss-value-parser@^4.1.0")
          ];
        "autoprefixer@^10.3.7" = s."autoprefixer@10.4.7";
        "autoprefixer@^10.4.7" = s."autoprefixer@10.4.7";
        "autoprefixer@^9.8.6" = s."autoprefixer@9.8.8";
        "axe-core@4.4.2" = f "axe-core" "4.4.2" y "dcf7fb6dea866166c3eab33d68208afe4d5f670c" [];
        "axe-core@^4.3.5" = s."axe-core@4.4.2";
        "axios@0.25.0" = f "axios" "0.25.0" y "349cfbb31331a9b4453190791760a8d35b093e0a" [
          (s."follow-redirects@^1.14.7")
          ];
        "axios@^0.25.0" = s."axios@0.25.0";
        "axobject-query@2.2.0" = f "axobject-query" "2.2.0" y "943d47e10c0b704aa42275e20edf3722648989be" [];
        "axobject-query@^2.2.0" = s."axobject-query@2.2.0";
        "azure-devops-node-api@7.2.0" = f "azure-devops-node-api" "7.2.0" y "131d4e01cf12ebc6e45569b5e0c5c249e4114d6d" [
          (s."os@0.1.1")
          (s."tunnel@0.0.4")
          (s."typed-rest-client@1.2.0")
          (s."underscore@1.8.3")
          ];
        "azure-devops-node-api@^7.2.0" = s."azure-devops-node-api@7.2.0";
        "babel-code-frame@6.26.0" = f "babel-code-frame" "6.26.0" y "63fd43f7dc1e3bb7ce35947db8fe369a3f58c74b" [
          (s."chalk@^1.1.3")
          (s."esutils@^2.0.2")
          (s."js-tokens@^3.0.2")
          ];
        "babel-code-frame@^6.26.0" = s."babel-code-frame@6.26.0";
        "babel-jest@27.5.1" = f "babel-jest" "27.5.1" y "a1bf8d61928edfefd21da27eb86a695bfd691444" [
          (s."@jest/transform@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/babel__core@^7.1.14")
          (s."babel-plugin-istanbul@^6.1.1")
          (s."babel-preset-jest@^27.5.1")
          (s."chalk@^4.0.0")
          (s."graceful-fs@^4.2.9")
          (s."slash@^3.0.0")
          ];
        "babel-jest@^27.4.2" = s."babel-jest@27.5.1";
        "babel-jest@^27.5.1" = s."babel-jest@27.5.1";
        "babel-loader@8.2.5" = f "babel-loader" "8.2.5" y "d45f585e654d5a5d90f5350a779d7647c5ed512e" [
          (s."find-cache-dir@^3.3.1")
          (s."loader-utils@^2.0.0")
          (s."make-dir@^3.1.0")
          (s."schema-utils@^2.6.5")
          ];
        "babel-loader@^8.0.0" = s."babel-loader@8.2.5";
        "babel-loader@^8.2.3" = s."babel-loader@8.2.5";
        "babel-loader@^8.2.5" = s."babel-loader@8.2.5";
        "babel-messages@6.23.0" = f "babel-messages" "6.23.0" y "f3cdf4703858035b2a2951c6ec5edf6c62f2630e" [
          (s."babel-runtime@^6.22.0")
          ];
        "babel-messages@^6.23.0" = s."babel-messages@6.23.0";
        "babel-plugin-add-react-displayname@0.0.5" = f "babel-plugin-add-react-displayname" "0.0.5" y "339d4cddb7b65fd62d1df9db9fe04de134122bd5" [];
        "babel-plugin-add-react-displayname@^0.0.5" = s."babel-plugin-add-react-displayname@0.0.5";
        "babel-plugin-apply-mdx-type-prop@1.6.22" = f "babel-plugin-apply-mdx-type-prop" "1.6.22" y "d216e8fd0de91de3f1478ef3231e05446bc8705b" [
          (s."@babel/helper-plugin-utils@7.10.4")
          (s."@mdx-js/util@1.6.22")
          ];
        "babel-plugin-dynamic-import-node@2.3.3" = f "babel-plugin-dynamic-import-node" "2.3.3" y "84fda19c976ec5c6defef57f9427b3def66e17a3" [
          (s."object.assign@^4.1.0")
          ];
        "babel-plugin-dynamic-import-node@^2.3.3" = s."babel-plugin-dynamic-import-node@2.3.3";
        "babel-plugin-extract-import-names@1.6.22" = f "babel-plugin-extract-import-names" "1.6.22" y "de5f9a28eb12f3eb2578bf74472204e66d1a13dc" [
          (s."@babel/helper-plugin-utils@7.10.4")
          ];
        "babel-plugin-istanbul@6.1.1" = f "babel-plugin-istanbul" "6.1.1" y "fa88ec59232fd9b4e36dbbc540a8ec9a9b47da73" [
          (s."@babel/helper-plugin-utils@^7.0.0")
          (s."@istanbuljs/load-nyc-config@^1.0.0")
          (s."@istanbuljs/schema@^0.1.2")
          (s."istanbul-lib-instrument@^5.0.4")
          (s."test-exclude@^6.0.0")
          ];
        "babel-plugin-istanbul@^6.0.0" = s."babel-plugin-istanbul@6.1.1";
        "babel-plugin-istanbul@^6.1.1" = s."babel-plugin-istanbul@6.1.1";
        "babel-plugin-jest-hoist@27.5.1" = f "babel-plugin-jest-hoist" "27.5.1" y "9be98ecf28c331eb9f5df9c72d6f89deb8181c2e" [
          (s."@babel/template@^7.3.3")
          (s."@babel/types@^7.3.3")
          (s."@types/babel__core@^7.0.0")
          (s."@types/babel__traverse@^7.0.6")
          ];
        "babel-plugin-jest-hoist@^27.5.1" = s."babel-plugin-jest-hoist@27.5.1";
        "babel-plugin-macros@3.1.0" = f "babel-plugin-macros" "3.1.0" y "9ef6dc74deb934b4db344dc973ee851d148c50c1" [
          (s."@babel/runtime@^7.12.5")
          (s."cosmiconfig@^7.0.0")
          (s."resolve@^1.19.0")
          ];
        "babel-plugin-macros@^3.0.1" = s."babel-plugin-macros@3.1.0";
        "babel-plugin-macros@^3.1.0" = s."babel-plugin-macros@3.1.0";
        "babel-plugin-named-asset-import@0.3.8" = f "babel-plugin-named-asset-import" "0.3.8" y "6b7fa43c59229685368683c28bc9734f24524cc2" [];
        "babel-plugin-named-asset-import@^0.3.8" = s."babel-plugin-named-asset-import@0.3.8";
        "babel-plugin-named-exports-order@0.0.2" = f "babel-plugin-named-exports-order" "0.0.2" y "ae14909521cf9606094a2048239d69847540cb09" [];
        "babel-plugin-named-exports-order@^0.0.2" = s."babel-plugin-named-exports-order@0.0.2";
        "babel-plugin-polyfill-corejs2@0.3.1" = f "babel-plugin-polyfill-corejs2" "0.3.1" y "440f1b70ccfaabc6b676d196239b138f8a2cfba5" [
          (s."@babel/compat-data@^7.13.11")
          (s."@babel/helper-define-polyfill-provider@^0.3.1")
          (s."semver@^6.1.1")
          ];
        "babel-plugin-polyfill-corejs2@^0.3.1" = s."babel-plugin-polyfill-corejs2@0.3.1";
        "babel-plugin-polyfill-corejs3@0.1.7" = f "babel-plugin-polyfill-corejs3" "0.1.7" y "80449d9d6f2274912e05d9e182b54816904befd0" [
          (s."@babel/helper-define-polyfill-provider@^0.1.5")
          (s."core-js-compat@^3.8.1")
          ];
        "babel-plugin-polyfill-corejs3@0.5.2" = f "babel-plugin-polyfill-corejs3" "0.5.2" y "aabe4b2fa04a6e038b688c5e55d44e78cd3a5f72" [
          (s."@babel/helper-define-polyfill-provider@^0.3.1")
          (s."core-js-compat@^3.21.0")
          ];
        "babel-plugin-polyfill-corejs3@^0.1.0" = s."babel-plugin-polyfill-corejs3@0.1.7";
        "babel-plugin-polyfill-corejs3@^0.5.2" = s."babel-plugin-polyfill-corejs3@0.5.2";
        "babel-plugin-polyfill-regenerator@0.3.1" = f "babel-plugin-polyfill-regenerator" "0.3.1" y "2c0678ea47c75c8cc2fbb1852278d8fb68233990" [
          (s."@babel/helper-define-polyfill-provider@^0.3.1")
          ];
        "babel-plugin-polyfill-regenerator@^0.3.1" = s."babel-plugin-polyfill-regenerator@0.3.1";
        "babel-plugin-react-docgen@4.2.1" = f "babel-plugin-react-docgen" "4.2.1" y "7cc8e2f94e8dc057a06e953162f0810e4e72257b" [
          (s."ast-types@^0.14.2")
          (s."lodash@^4.17.15")
          (s."react-docgen@^5.0.0")
          ];
        "babel-plugin-react-docgen@^4.1.0" = s."babel-plugin-react-docgen@4.2.1";
        "babel-plugin-react-docgen@^4.2.1" = s."babel-plugin-react-docgen@4.2.1";
        "babel-plugin-transform-es2015-modules-commonjs@6.26.2" = f "babel-plugin-transform-es2015-modules-commonjs" "6.26.2" y "58a793863a9e7ca870bdc5a881117ffac27db6f3" [
          (s."babel-plugin-transform-strict-mode@^6.24.1")
          (s."babel-runtime@^6.26.0")
          (s."babel-template@^6.26.0")
          (s."babel-types@^6.26.0")
          ];
        "babel-plugin-transform-es2015-modules-commonjs@^6.26.2" = s."babel-plugin-transform-es2015-modules-commonjs@6.26.2";
        "babel-plugin-transform-react-remove-prop-types@0.4.24" = f "babel-plugin-transform-react-remove-prop-types" "0.4.24" y "f2edaf9b4c6a5fbe5c1d678bfb531078c1555f3a" [];
        "babel-plugin-transform-react-remove-prop-types@^0.4.24" = s."babel-plugin-transform-react-remove-prop-types@0.4.24";
        "babel-plugin-transform-strict-mode@6.24.1" = f "babel-plugin-transform-strict-mode" "6.24.1" y "d5faf7aa578a65bbe591cf5edae04a0c67020758" [
          (s."babel-runtime@^6.22.0")
          (s."babel-types@^6.24.1")
          ];
        "babel-plugin-transform-strict-mode@^6.24.1" = s."babel-plugin-transform-strict-mode@6.24.1";
        "babel-preset-current-node-syntax@1.0.1" = f "babel-preset-current-node-syntax" "1.0.1" y "b4399239b89b2a011f9ddbe3e4f401fc40cff73b" [
          (s."@babel/plugin-syntax-async-generators@^7.8.4")
          (s."@babel/plugin-syntax-bigint@^7.8.3")
          (s."@babel/plugin-syntax-class-properties@^7.8.3")
          (s."@babel/plugin-syntax-import-meta@^7.8.3")
          (s."@babel/plugin-syntax-json-strings@^7.8.3")
          (s."@babel/plugin-syntax-logical-assignment-operators@^7.8.3")
          (s."@babel/plugin-syntax-nullish-coalescing-operator@^7.8.3")
          (s."@babel/plugin-syntax-numeric-separator@^7.8.3")
          (s."@babel/plugin-syntax-object-rest-spread@^7.8.3")
          (s."@babel/plugin-syntax-optional-catch-binding@^7.8.3")
          (s."@babel/plugin-syntax-optional-chaining@^7.8.3")
          (s."@babel/plugin-syntax-top-level-await@^7.8.3")
          ];
        "babel-preset-current-node-syntax@^1.0.0" = s."babel-preset-current-node-syntax@1.0.1";
        "babel-preset-jest@27.5.1" = f "babel-preset-jest" "27.5.1" y "91f10f58034cb7989cb4f962b69fa6eef6a6bc81" [
          (s."babel-plugin-jest-hoist@^27.5.1")
          (s."babel-preset-current-node-syntax@^1.0.0")
          ];
        "babel-preset-jest@^27.5.1" = s."babel-preset-jest@27.5.1";
        "babel-preset-react-app@10.0.1" = f "babel-preset-react-app" "10.0.1" y "ed6005a20a24f2c88521809fa9aea99903751584" [
          (s."@babel/core@^7.16.0")
          (s."@babel/plugin-proposal-class-properties@^7.16.0")
          (s."@babel/plugin-proposal-decorators@^7.16.4")
          (s."@babel/plugin-proposal-nullish-coalescing-operator@^7.16.0")
          (s."@babel/plugin-proposal-numeric-separator@^7.16.0")
          (s."@babel/plugin-proposal-optional-chaining@^7.16.0")
          (s."@babel/plugin-proposal-private-methods@^7.16.0")
          (s."@babel/plugin-transform-flow-strip-types@^7.16.0")
          (s."@babel/plugin-transform-react-display-name@^7.16.0")
          (s."@babel/plugin-transform-runtime@^7.16.4")
          (s."@babel/preset-env@^7.16.4")
          (s."@babel/preset-react@^7.16.0")
          (s."@babel/preset-typescript@^7.16.0")
          (s."@babel/runtime@^7.16.3")
          (s."babel-plugin-macros@^3.1.0")
          (s."babel-plugin-transform-react-remove-prop-types@^0.4.24")
          ];
        "babel-preset-react-app@^10.0.1" = s."babel-preset-react-app@10.0.1";
        "babel-runtime@6.26.0" = f "babel-runtime" "6.26.0" y "965c7058668e82b55d7bfe04ff2337bc8b5647fe" [
          (s."core-js@^2.4.0")
          (s."regenerator-runtime@^0.11.0")
          ];
        "babel-runtime@^6.22.0" = s."babel-runtime@6.26.0";
        "babel-runtime@^6.26.0" = s."babel-runtime@6.26.0";
        "babel-template@6.26.0" = f "babel-template" "6.26.0" y "de03e2d16396b069f46dd9fff8521fb1a0e35e02" [
          (s."babel-runtime@^6.26.0")
          (s."babel-traverse@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."lodash@^4.17.4")
          ];
        "babel-template@^6.26.0" = s."babel-template@6.26.0";
        "babel-traverse@6.26.0" = f "babel-traverse" "6.26.0" y "46a9cbd7edcc62c8e5c064e2d2d8d0f4035766ee" [
          (s."babel-code-frame@^6.26.0")
          (s."babel-messages@^6.23.0")
          (s."babel-runtime@^6.26.0")
          (s."babel-types@^6.26.0")
          (s."babylon@^6.18.0")
          (s."debug@^2.6.8")
          (s."globals@^9.18.0")
          (s."invariant@^2.2.2")
          (s."lodash@^4.17.4")
          ];
        "babel-traverse@^6.26.0" = s."babel-traverse@6.26.0";
        "babel-types@6.26.0" = f "babel-types" "6.26.0" y "a3b073f94ab49eb6fa55cd65227a334380632497" [
          (s."babel-runtime@^6.26.0")
          (s."esutils@^2.0.2")
          (s."lodash@^4.17.4")
          (s."to-fast-properties@^1.0.3")
          ];
        "babel-types@^6.24.1" = s."babel-types@6.26.0";
        "babel-types@^6.26.0" = s."babel-types@6.26.0";
        "babylon@6.18.0" = f "babylon" "6.18.0" y "af2f3b88fa6f5c1e4c634d1a0f8eac4f55b395e3" [];
        "babylon@^6.18.0" = s."babylon@6.18.0";
        "bail@1.0.5" = f "bail" "1.0.5" y "b6fa133404a392cbc1f8c4bf63f5953351e7a776" [];
        "bail@^1.0.0" = s."bail@1.0.5";
        "balanced-match@1.0.2" = f "balanced-match" "1.0.2" y "e83e3a7e3f300b34cb9d87f615fa0cbf357690ee" [];
        "balanced-match@^1.0.0" = s."balanced-match@1.0.2";
        "base16@1.0.0" = f "base16" "1.0.0" y "e297f60d7ec1014a7a971a39ebc8a98c0b681e70" [];
        "base16@^1.0.0" = s."base16@1.0.0";
        "base64-js@1.5.1" = f "base64-js" "1.5.1" y "1b1b440160a5bf7ad40b650f095963481903930a" [];
        "base64-js@^1.0.2" = s."base64-js@1.5.1";
        "base64-js@^1.5.1" = s."base64-js@1.5.1";
        "base@0.11.2" = f "base" "0.11.2" y "7bde5ced145b6d551a90db87f83c558b4eb48a8f" [
          (s."cache-base@^1.0.1")
          (s."class-utils@^0.3.5")
          (s."component-emitter@^1.2.1")
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.1")
          (s."mixin-deep@^1.2.0")
          (s."pascalcase@^0.1.1")
          ];
        "base@^0.11.1" = s."base@0.11.2";
        "batch@0.6.1" = f "batch" "0.6.1" y "dc34314f4e679318093fc760272525f94bf25c16" [];
        "better-opn@2.1.1" = f "better-opn" "2.1.1" y "94a55b4695dc79288f31d7d0e5f658320759f7c6" [
          (s."open@^7.0.3")
          ];
        "better-opn@^2.1.1" = s."better-opn@2.1.1";
        "bfj@7.0.2" = f "bfj" "7.0.2" y "1988ce76f3add9ac2913fd8ba47aad9e651bfbb2" [
          (s."bluebird@^3.5.5")
          (s."check-types@^11.1.1")
          (s."hoopy@^0.1.4")
          (s."tryer@^1.0.1")
          ];
        "bfj@^7.0.2" = s."bfj@7.0.2";
        "big-integer@1.6.51" = f "big-integer" "1.6.51" y "0df92a5d9880560d3ff2d5fd20245c889d130686" [];
        "big-integer@^1.6.7" = s."big-integer@1.6.51";
        "big.js@5.2.2" = f "big.js" "5.2.2" y "65f0af382f578bcdc742bd9c281e9cb2d7768328" [];
        "big.js@^5.2.2" = s."big.js@5.2.2";
        "binary-extensions@1.13.1" = f "binary-extensions" "1.13.1" y "598afe54755b2868a5330d2aff9d4ebb53209b65" [];
        "binary-extensions@2.2.0" = f "binary-extensions" "2.2.0" y "75f502eeaf9ffde42fc98829645be4ea76bd9e2d" [];
        "binary-extensions@^1.0.0" = s."binary-extensions@1.13.1";
        "binary-extensions@^2.0.0" = s."binary-extensions@2.2.0";
        "bindings@1.5.0" = f "bindings" "1.5.0" y "10353c9e945334bc0511a6d90b38fbc7c9c504df" [
          (s."file-uri-to-path@1.0.0")
          ];
        "bindings@^1.5.0" = s."bindings@1.5.0";
        "bisect_ppx@2.7.1" = f "bisect_ppx" "2.7.1" y "8fde3e6f767a1a4ca190a266d0bd38800b088f66" [];
        "bisect_ppx@^2.7.1" = s."bisect_ppx@2.7.1";
        "bluebird@3.7.2" = f "bluebird" "3.7.2" y "9f229c15be272454ffa973ace0dbee79a1b0c36f" [];
        "bluebird@^3.5.5" = s."bluebird@3.7.2";
        "bn.js@4.12.0" = f "bn.js" "4.12.0" y "775b3f278efbb9718eec7361f483fb36fbbfea88" [];
        "bn.js@5.2.1" = f "bn.js" "5.2.1" y "0bc527a6a0d18d0aa8d5b0538ce4a77dccfa7b70" [];
        "bn.js@^4.0.0" = s."bn.js@4.12.0";
        "bn.js@^4.1.0" = s."bn.js@4.12.0";
        "bn.js@^4.11.9" = s."bn.js@4.12.0";
        "bn.js@^5.0.0" = s."bn.js@5.2.1";
        "bn.js@^5.1.1" = s."bn.js@5.2.1";
        "body-parser@1.20.0" = f "body-parser" "1.20.0" y "3de69bd89011c11573d7bfee6a64f11b6bd27cc5" [
          (s."bytes@3.1.2")
          (s."content-type@~1.0.4")
          (s."debug@2.6.9")
          (s."depd@2.0.0")
          (s."destroy@1.2.0")
          (s."http-errors@2.0.0")
          (s."iconv-lite@0.4.24")
          (s."on-finished@2.4.1")
          (s."qs@6.10.3")
          (s."raw-body@2.5.1")
          (s."type-is@~1.6.18")
          (s."unpipe@1.0.0")
          ];
        "bonjour-service@1.0.13" = f "bonjour-service" "1.0.13" y "4ac003dc1626023252d58adf2946f57e5da450c1" [
          (s."array-flatten@^2.1.2")
          (s."dns-equal@^1.0.0")
          (s."fast-deep-equal@^3.1.3")
          (s."multicast-dns@^7.2.5")
          ];
        "bonjour-service@^1.0.11" = s."bonjour-service@1.0.13";
        "boolbase@1.0.0" = f "boolbase" "1.0.0" y "68dff5fbe60c51eb37725ea9e3ed310dcc1e776e" [];
        "boolbase@^1.0.0" = s."boolbase@1.0.0";
        "boolbase@~1.0.0" = s."boolbase@1.0.0";
        "boxen@5.1.2" = f "boxen" "5.1.2" y "788cb686fc83c1f486dfa8a40c68fc2b831d2b50" [
          (s."ansi-align@^3.0.0")
          (s."camelcase@^6.2.0")
          (s."chalk@^4.1.0")
          (s."cli-boxes@^2.2.1")
          (s."string-width@^4.2.2")
          (s."type-fest@^0.20.2")
          (s."widest-line@^3.1.0")
          (s."wrap-ansi@^7.0.0")
          ];
        "boxen@6.2.1" = f "boxen" "6.2.1" y "b098a2278b2cd2845deef2dff2efc38d329b434d" [
          (s."ansi-align@^3.0.1")
          (s."camelcase@^6.2.0")
          (s."chalk@^4.1.2")
          (s."cli-boxes@^3.0.0")
          (s."string-width@^5.0.1")
          (s."type-fest@^2.5.0")
          (s."widest-line@^4.0.1")
          (s."wrap-ansi@^8.0.1")
          ];
        "boxen@^5.0.0" = s."boxen@5.1.2";
        "boxen@^5.1.2" = s."boxen@5.1.2";
        "boxen@^6.2.1" = s."boxen@6.2.1";
        "bplist-parser@0.1.1" = f "bplist-parser" "0.1.1" y "d60d5dcc20cba6dc7e1f299b35d3e1f95dafbae6" [
          (s."big-integer@^1.6.7")
          ];
        "bplist-parser@^0.1.0" = s."bplist-parser@0.1.1";
        "brace-expansion@1.1.11" = f "brace-expansion" "1.1.11" y "3c7fcbf529d87226f3d2f52b966ff5271eb441dd" [
          (s."balanced-match@^1.0.0")
          (s."concat-map@0.0.1")
          ];
        "brace-expansion@2.0.1" = f "brace-expansion" "2.0.1" y "1edc459e0f0c548486ecf9fc99f2221364b9a0ae" [
          (s."balanced-match@^1.0.0")
          ];
        "brace-expansion@^1.1.7" = s."brace-expansion@1.1.11";
        "brace-expansion@^2.0.1" = s."brace-expansion@2.0.1";
        "braces@2.3.2" = f "braces" "2.3.2" y "5979fd3f14cd531565e5fa2df1abfff1dfaee729" [
          (s."arr-flatten@^1.1.0")
          (s."array-unique@^0.3.2")
          (s."extend-shallow@^2.0.1")
          (s."fill-range@^4.0.0")
          (s."isobject@^3.0.1")
          (s."repeat-element@^1.1.2")
          (s."snapdragon@^0.8.1")
          (s."snapdragon-node@^2.0.1")
          (s."split-string@^3.0.2")
          (s."to-regex@^3.0.1")
          ];
        "braces@3.0.2" = f "braces" "3.0.2" y "3454e1a462ee8d599e236df336cd9ea4f8afe107" [
          (s."fill-range@^7.0.1")
          ];
        "braces@^2.3.1" = s."braces@2.3.2";
        "braces@^2.3.2" = s."braces@2.3.2";
        "braces@^3.0.2" = s."braces@3.0.2";
        "braces@~3.0.2" = s."braces@3.0.2";
        "brorand@1.1.0" = f "brorand" "1.1.0" y "12c25efe40a45e3c323eb8675a0a0ce57b22371f" [];
        "brorand@^1.0.1" = s."brorand@1.1.0";
        "brorand@^1.1.0" = s."brorand@1.1.0";
        "browser-assert@1.2.1" = f "browser-assert" "1.2.1" y "9aaa5a2a8c74685c2ae05bfe46efd606f068c200" [];
        "browser-assert@^1.2.1" = s."browser-assert@1.2.1";
        "browser-process-hrtime@1.0.0" = f "browser-process-hrtime" "1.0.0" y "3c9b4b7d782c8121e56f10106d84c0d0ffc94626" [];
        "browser-process-hrtime@^1.0.0" = s."browser-process-hrtime@1.0.0";
        "browserify-aes@1.2.0" = f "browserify-aes" "1.2.0" y "326734642f403dabc3003209853bb70ad428ef48" [
          (s."buffer-xor@^1.0.3")
          (s."cipher-base@^1.0.0")
          (s."create-hash@^1.1.0")
          (s."evp_bytestokey@^1.0.3")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "browserify-aes@^1.0.0" = s."browserify-aes@1.2.0";
        "browserify-aes@^1.0.4" = s."browserify-aes@1.2.0";
        "browserify-cipher@1.0.1" = f "browserify-cipher" "1.0.1" y "8d6474c1b870bfdabcd3bcfcc1934a10e94f15f0" [
          (s."browserify-aes@^1.0.4")
          (s."browserify-des@^1.0.0")
          (s."evp_bytestokey@^1.0.0")
          ];
        "browserify-cipher@^1.0.0" = s."browserify-cipher@1.0.1";
        "browserify-des@1.0.2" = f "browserify-des" "1.0.2" y "3af4f1f59839403572f1c66204375f7a7f703e9c" [
          (s."cipher-base@^1.0.1")
          (s."des.js@^1.0.0")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "browserify-des@^1.0.0" = s."browserify-des@1.0.2";
        "browserify-rsa@4.1.0" = f "browserify-rsa" "4.1.0" y "b2fd06b5b75ae297f7ce2dc651f918f5be158c8d" [
          (s."bn.js@^5.0.0")
          (s."randombytes@^2.0.1")
          ];
        "browserify-rsa@^4.0.0" = s."browserify-rsa@4.1.0";
        "browserify-rsa@^4.0.1" = s."browserify-rsa@4.1.0";
        "browserify-sign@4.2.1" = f "browserify-sign" "4.2.1" y "eaf4add46dd54be3bb3b36c0cf15abbeba7956c3" [
          (s."bn.js@^5.1.1")
          (s."browserify-rsa@^4.0.1")
          (s."create-hash@^1.2.0")
          (s."create-hmac@^1.1.7")
          (s."elliptic@^6.5.3")
          (s."inherits@^2.0.4")
          (s."parse-asn1@^5.1.5")
          (s."readable-stream@^3.6.0")
          (s."safe-buffer@^5.2.0")
          ];
        "browserify-sign@^4.0.0" = s."browserify-sign@4.2.1";
        "browserify-zlib@0.2.0" = f "browserify-zlib" "0.2.0" y "2869459d9aa3be245fe8fe2ca1f46e2e7f54d73f" [
          (s."pako@~1.0.5")
          ];
        "browserify-zlib@^0.2.0" = s."browserify-zlib@0.2.0";
        "browserslist@4.21.0" = f "browserslist" "4.21.0" y "7ab19572361a140ecd1e023e2c1ed95edda0cefe" [
          (s."caniuse-lite@^1.0.30001358")
          (s."electron-to-chromium@^1.4.164")
          (s."node-releases@^2.0.5")
          (s."update-browserslist-db@^1.0.0")
          ];
        "browserslist@^4.0.0" = s."browserslist@4.21.0";
        "browserslist@^4.12.0" = s."browserslist@4.21.0";
        "browserslist@^4.14.5" = s."browserslist@4.21.0";
        "browserslist@^4.16.6" = s."browserslist@4.21.0";
        "browserslist@^4.18.1" = s."browserslist@4.21.0";
        "browserslist@^4.20.2" = s."browserslist@4.21.0";
        "browserslist@^4.20.3" = s."browserslist@4.21.0";
        "browserslist@^4.20.4" = s."browserslist@4.21.0";
        "bs-logger@0.2.6" = f "bs-logger" "0.2.6" y "eb7d365307a72cf974cc6cda76b68354ad336bd8" [
          (s."fast-json-stable-stringify@2.x")
          ];
        "bs-logger@0.x" = s."bs-logger@0.2.6";
        "bser@2.1.1" = f "bser" "2.1.1" y "e6787da20ece9d07998533cfd9de6f5c38f4bc05" [
          (s."node-int64@^0.4.0")
          ];
        "buffer-crc32@0.2.13" = f "buffer-crc32" "0.2.13" y "0d333e3f00eac50aa1454abd30ef8c2a5d9a7242" [];
        "buffer-crc32@~0.2.3" = s."buffer-crc32@0.2.13";
        "buffer-from@1.1.2" = f "buffer-from" "1.1.2" y "2b146a6fd72e80b4f55d255f35ed59a3a9a41bd5" [];
        "buffer-from@^1.0.0" = s."buffer-from@1.1.2";
        "buffer-xor@1.0.3" = f "buffer-xor" "1.0.3" y "26e61ed1422fb70dd42e6e36729ed51d855fe8d9" [];
        "buffer-xor@^1.0.3" = s."buffer-xor@1.0.3";
        "buffer@4.9.2" = f "buffer" "4.9.2" y "230ead344002988644841ab0244af8c44bbe3ef8" [
          (s."base64-js@^1.0.2")
          (s."ieee754@^1.1.4")
          (s."isarray@^1.0.0")
          ];
        "buffer@^4.3.0" = s."buffer@4.9.2";
        "builtin-modules@3.3.0" = f "builtin-modules" "3.3.0" y "cae62812b89801e9656336e46223e030386be7b6" [];
        "builtin-modules@^3.1.0" = s."builtin-modules@3.3.0";
        "builtin-status-codes@3.0.0" = f "builtin-status-codes" "3.0.0" y "85982878e21b98e1c66425e03d0174788f569ee8" [];
        "builtin-status-codes@^3.0.0" = s."builtin-status-codes@3.0.0";
        "bytes@3.0.0" = f "bytes" "3.0.0" y "d32815404d689699f85a4ea4fa8755dd13a96048" [];
        "bytes@3.1.2" = f "bytes" "3.1.2" y "8b0beeb98605adf1b128fa4386403c009e0221a5" [];
        "c8@7.11.3" = f "c8" "7.11.3" y "88c8459c1952ed4f701b619493c9ae732b057163" [
          (s."@bcoe/v8-coverage@^0.2.3")
          (s."@istanbuljs/schema@^0.1.3")
          (s."find-up@^5.0.0")
          (s."foreground-child@^2.0.0")
          (s."istanbul-lib-coverage@^3.2.0")
          (s."istanbul-lib-report@^3.0.0")
          (s."istanbul-reports@^3.1.4")
          (s."rimraf@^3.0.2")
          (s."test-exclude@^6.0.0")
          (s."v8-to-istanbul@^9.0.0")
          (s."yargs@^16.2.0")
          (s."yargs-parser@^20.2.9")
          ];
        "c8@^7.6.0" = s."c8@7.11.3";
        "cacache@12.0.4" = f "cacache" "12.0.4" y "668bcbd105aeb5f1d92fe25570ec9525c8faa40c" [
          (s."bluebird@^3.5.5")
          (s."chownr@^1.1.1")
          (s."figgy-pudding@^3.5.1")
          (s."glob@^7.1.4")
          (s."graceful-fs@^4.1.15")
          (s."infer-owner@^1.0.3")
          (s."lru-cache@^5.1.1")
          (s."mississippi@^3.0.0")
          (s."mkdirp@^0.5.1")
          (s."move-concurrently@^1.0.1")
          (s."promise-inflight@^1.0.1")
          (s."rimraf@^2.6.3")
          (s."ssri@^6.0.1")
          (s."unique-filename@^1.1.1")
          (s."y18n@^4.0.0")
          ];
        "cacache@15.3.0" = f "cacache" "15.3.0" y "dc85380fb2f556fe3dda4c719bfa0ec875a7f1eb" [
          (s."@npmcli/fs@^1.0.0")
          (s."@npmcli/move-file@^1.0.1")
          (s."chownr@^2.0.0")
          (s."fs-minipass@^2.0.0")
          (s."glob@^7.1.4")
          (s."infer-owner@^1.0.4")
          (s."lru-cache@^6.0.0")
          (s."minipass@^3.1.1")
          (s."minipass-collect@^1.0.2")
          (s."minipass-flush@^1.0.5")
          (s."minipass-pipeline@^1.2.2")
          (s."mkdirp@^1.0.3")
          (s."p-map@^4.0.0")
          (s."promise-inflight@^1.0.1")
          (s."rimraf@^3.0.2")
          (s."ssri@^8.0.1")
          (s."tar@^6.0.2")
          (s."unique-filename@^1.1.1")
          ];
        "cacache@^12.0.2" = s."cacache@12.0.4";
        "cacache@^15.0.5" = s."cacache@15.3.0";
        "cache-base@1.0.1" = f "cache-base" "1.0.1" y "0a7f46416831c8b662ee36fe4e7c59d76f666ab2" [
          (s."collection-visit@^1.0.0")
          (s."component-emitter@^1.2.1")
          (s."get-value@^2.0.6")
          (s."has-value@^1.0.0")
          (s."isobject@^3.0.1")
          (s."set-value@^2.0.0")
          (s."to-object-path@^0.3.0")
          (s."union-value@^1.0.0")
          (s."unset-value@^1.0.0")
          ];
        "cache-base@^1.0.1" = s."cache-base@1.0.1";
        "cacheable-request@6.1.0" = f "cacheable-request" "6.1.0" y "20ffb8bd162ba4be11e9567d823db651052ca912" [
          (s."clone-response@^1.0.2")
          (s."get-stream@^5.1.0")
          (s."http-cache-semantics@^4.0.0")
          (s."keyv@^3.0.0")
          (s."lowercase-keys@^2.0.0")
          (s."normalize-url@^4.1.0")
          (s."responselike@^1.0.2")
          ];
        "cacheable-request@^6.0.0" = s."cacheable-request@6.1.0";
        "caching-transform@4.0.0" = f "caching-transform" "4.0.0" y "00d297a4206d71e2163c39eaffa8157ac0651f0f" [
          (s."hasha@^5.0.0")
          (s."make-dir@^3.0.0")
          (s."package-hash@^4.0.0")
          (s."write-file-atomic@^3.0.0")
          ];
        "caching-transform@^4.0.0" = s."caching-transform@4.0.0";
        "call-bind@1.0.2" = f "call-bind" "1.0.2" y "b1d4e89e688119c3c9a903ad30abb2f6a919be3c" [
          (s."function-bind@^1.1.1")
          (s."get-intrinsic@^1.0.2")
          ];
        "call-bind@^1.0.0" = s."call-bind@1.0.2";
        "call-bind@^1.0.2" = s."call-bind@1.0.2";
        "call-me-maybe@1.0.1" = f "call-me-maybe" "1.0.1" y "26d208ea89e37b5cbde60250a15f031c16a4d66b" [];
        "call-me-maybe@^1.0.1" = s."call-me-maybe@1.0.1";
        "callsites@3.1.0" = f "callsites" "3.1.0" y "b3630abd8943432f54b3f0519238e33cd7df2f73" [];
        "callsites@^3.0.0" = s."callsites@3.1.0";
        "camel-case@4.1.2" = f "camel-case" "4.1.2" y "9728072a954f805228225a6deea6b38461e1bd5a" [
          (s."pascal-case@^3.1.2")
          (s."tslib@^2.0.3")
          ];
        "camel-case@^4.1.1" = s."camel-case@4.1.2";
        "camel-case@^4.1.2" = s."camel-case@4.1.2";
        "camelcase-css@2.0.1" = f "camelcase-css" "2.0.1" y "ee978f6947914cc30c6b44741b6ed1df7f043fd5" [];
        "camelcase-css@^2.0.1" = s."camelcase-css@2.0.1";
        "camelcase-keys@2.1.0" = f "camelcase-keys" "2.1.0" y "308beeaffdf28119051efa1d932213c91b8f92e7" [
          (s."camelcase@^2.0.0")
          (s."map-obj@^1.0.0")
          ];
        "camelcase-keys@^2.0.0" = s."camelcase-keys@2.1.0";
        "camelcase@2.1.1" = f "camelcase" "2.1.1" y "7c1d16d679a1bbe59ca02cacecfb011e201f5a1f" [];
        "camelcase@5.3.1" = f "camelcase" "5.3.1" y "e3c9b31569e106811df242f715725a1f4c494320" [];
        "camelcase@6.3.0" = f "camelcase" "6.3.0" y "5685b95eb209ac9c0c177467778c9c84df58ba9a" [];
        "camelcase@^2.0.0" = s."camelcase@2.1.1";
        "camelcase@^5.0.0" = s."camelcase@5.3.1";
        "camelcase@^5.3.1" = s."camelcase@5.3.1";
        "camelcase@^6.2.0" = s."camelcase@6.3.0";
        "camelcase@^6.2.1" = s."camelcase@6.3.0";
        "caniuse-api@3.0.0" = f "caniuse-api" "3.0.0" y "5e4d90e2274961d46291997df599e3ed008ee4c0" [
          (s."browserslist@^4.0.0")
          (s."caniuse-lite@^1.0.0")
          (s."lodash.memoize@^4.1.2")
          (s."lodash.uniq@^4.5.0")
          ];
        "caniuse-api@^3.0.0" = s."caniuse-api@3.0.0";
        "caniuse-lite@1.0.30001358" = f "caniuse-lite" "1.0.30001358" y "473d35dabf5e448b463095cab7924e96ccfb8c00" [];
        "caniuse-lite@^1.0.0" = s."caniuse-lite@1.0.30001358";
        "caniuse-lite@^1.0.30001109" = s."caniuse-lite@1.0.30001358";
        "caniuse-lite@^1.0.30001335" = s."caniuse-lite@1.0.30001358";
        "caniuse-lite@^1.0.30001358" = s."caniuse-lite@1.0.30001358";
        "capture-exit@2.0.0" = f "capture-exit" "2.0.0" y "fb953bfaebeb781f62898239dabb426d08a509a4" [
          (s."rsvp@^4.8.4")
          ];
        "capture-exit@^2.0.0" = s."capture-exit@2.0.0";
        "case-sensitive-paths-webpack-plugin@2.4.0" = f "case-sensitive-paths-webpack-plugin" "2.4.0" y "db64066c6422eed2e08cc14b986ca43796dbc6d4" [];
        "case-sensitive-paths-webpack-plugin@^2.3.0" = s."case-sensitive-paths-webpack-plugin@2.4.0";
        "case-sensitive-paths-webpack-plugin@^2.4.0" = s."case-sensitive-paths-webpack-plugin@2.4.0";
        "ccount@1.1.0" = f "ccount" "1.1.0" y "246687debb6014735131be8abab2d93898f8d043" [];
        "ccount@^1.0.0" = s."ccount@1.1.0";
        "chalk@1.1.3" = f "chalk" "1.1.3" y "a8115c55e4a702fe4d150abd3872822a7e09fc98" [
          (s."ansi-styles@^2.2.1")
          (s."escape-string-regexp@^1.0.2")
          (s."has-ansi@^2.0.0")
          (s."strip-ansi@^3.0.0")
          (s."supports-color@^2.0.0")
          ];
        "chalk@2.4.2" = f "chalk" "2.4.2" y "cd42541677a54333cf541a49108c1432b44c9424" [
          (s."ansi-styles@^3.2.1")
          (s."escape-string-regexp@^1.0.5")
          (s."supports-color@^5.3.0")
          ];
        "chalk@3.0.0" = f "chalk" "3.0.0" y "3f73c2bf526591f574cc492c51e2456349f844e4" [
          (s."ansi-styles@^4.1.0")
          (s."supports-color@^7.1.0")
          ];
        "chalk@4.1.2" = f "chalk" "4.1.2" y "aac4e2b7734a740867aeb16bf02aad556a1e7a01" [
          (s."ansi-styles@^4.1.0")
          (s."supports-color@^7.1.0")
          ];
        "chalk@5.0.1" = f "chalk" "5.0.1" y "ca57d71e82bb534a296df63bbacc4a1c22b2a4b6" [];
        "chalk@^1.1.3" = s."chalk@1.1.3";
        "chalk@^2.0.0" = s."chalk@2.4.2";
        "chalk@^2.4.1" = s."chalk@2.4.2";
        "chalk@^2.4.2" = s."chalk@2.4.2";
        "chalk@^3.0.0" = s."chalk@3.0.0";
        "chalk@^4.0.0" = s."chalk@4.1.2";
        "chalk@^4.0.2" = s."chalk@4.1.2";
        "chalk@^4.1.0" = s."chalk@4.1.2";
        "chalk@^4.1.2" = s."chalk@4.1.2";
        "chalk@^5.0.1" = s."chalk@5.0.1";
        "char-regex@1.0.2" = f "char-regex" "1.0.2" y "d744358226217f981ed58f479b1d6bcc29545dcf" [];
        "char-regex@2.0.1" = f "char-regex" "2.0.1" y "6dafdb25f9d3349914079f010ba8d0e6ff9cd01e" [];
        "char-regex@^1.0.2" = s."char-regex@1.0.2";
        "char-regex@^2.0.0" = s."char-regex@2.0.1";
        "character-entities-legacy@1.1.4" = f "character-entities-legacy" "1.1.4" y "94bc1845dce70a5bb9d2ecc748725661293d8fc1" [];
        "character-entities-legacy@^1.0.0" = s."character-entities-legacy@1.1.4";
        "character-entities@1.2.4" = f "character-entities" "1.2.4" y "e12c3939b7eaf4e5b15e7ad4c5e28e1d48c5b16b" [];
        "character-entities@^1.0.0" = s."character-entities@1.2.4";
        "character-reference-invalid@1.1.4" = f "character-reference-invalid" "1.1.4" y "083329cda0eae272ab3dbbf37e9a382c13af1560" [];
        "character-reference-invalid@^1.0.0" = s."character-reference-invalid@1.1.4";
        "charcodes@0.2.0" = f "charcodes" "0.2.0" y "5208d327e6cc05f99eb80ffc814707572d1f14e4" [];
        "charcodes@^0.2.0" = s."charcodes@0.2.0";
        "check-types@11.1.2" = f "check-types" "11.1.2" y "86a7c12bf5539f6324eb0e70ca8896c0e38f3e2f" [];
        "check-types@^11.1.1" = s."check-types@11.1.2";
        "cheerio-select@2.1.0" = f "cheerio-select" "2.1.0" y "4d8673286b8126ca2a8e42740d5e3c4884ae21b4" [
          (s."boolbase@^1.0.0")
          (s."css-select@^5.1.0")
          (s."css-what@^6.1.0")
          (s."domelementtype@^2.3.0")
          (s."domhandler@^5.0.3")
          (s."domutils@^3.0.1")
          ];
        "cheerio-select@^2.1.0" = s."cheerio-select@2.1.0";
        "cheerio@1.0.0-rc.11" = f "cheerio" "1.0.0-rc.11" y "1be84be1a126958366bcc57a11648cd9b30a60c2" [
          (s."cheerio-select@^2.1.0")
          (s."dom-serializer@^2.0.0")
          (s."domhandler@^5.0.3")
          (s."domutils@^3.0.1")
          (s."htmlparser2@^8.0.1")
          (s."parse5@^7.0.0")
          (s."parse5-htmlparser2-tree-adapter@^7.0.0")
          (s."tslib@^2.4.0")
          ];
        "cheerio@1.0.0-rc.12" = f "cheerio" "1.0.0-rc.12" y "788bf7466506b1c6bf5fae51d24a2c4d62e47683" [
          (s."cheerio-select@^2.1.0")
          (s."dom-serializer@^2.0.0")
          (s."domhandler@^5.0.3")
          (s."domutils@^3.0.1")
          (s."htmlparser2@^8.0.1")
          (s."parse5@^7.0.0")
          (s."parse5-htmlparser2-tree-adapter@^7.0.0")
          ];
        "cheerio@^1.0.0-rc.1" = s."cheerio@1.0.0-rc.11";
        "cheerio@^1.0.0-rc.12" = s."cheerio@1.0.0-rc.12";
        "chokidar@2.1.8" = f "chokidar" "2.1.8" y "804b3a7b6a99358c3c5c61e71d8728f041cff917" [
          (s."anymatch@^2.0.0")
          (s."async-each@^1.0.1")
          (s."braces@^2.3.2")
          (s."glob-parent@^3.1.0")
          (s."inherits@^2.0.3")
          (s."is-binary-path@^1.0.0")
          (s."is-glob@^4.0.0")
          (s."normalize-path@^3.0.0")
          (s."path-is-absolute@^1.0.0")
          (s."readdirp@^2.2.1")
          (s."upath@^1.1.1")
          (s."fsevents@^1.2.7")
          ];
        "chokidar@3.5.3" = f "chokidar" "3.5.3" y "1cf37c8707b932bd1af1ae22c0432e2acd1903bd" [
          (s."anymatch@~3.1.2")
          (s."braces@~3.0.2")
          (s."glob-parent@~5.1.2")
          (s."is-binary-path@~2.1.0")
          (s."is-glob@~4.0.1")
          (s."normalize-path@~3.0.0")
          (s."readdirp@~3.6.0")
          (s."fsevents@~2.3.2")
          ];
        "chokidar@^2.1.8" = s."chokidar@2.1.8";
        "chokidar@^3.3.0" = s."chokidar@3.5.3";
        "chokidar@^3.4.1" = s."chokidar@3.5.3";
        "chokidar@^3.4.2" = s."chokidar@3.5.3";
        "chokidar@^3.5.3" = s."chokidar@3.5.3";
        "chownr@1.1.4" = f "chownr" "1.1.4" y "6fc9d7b42d32a583596337666e7d08084da2cc6b" [];
        "chownr@2.0.0" = f "chownr" "2.0.0" y "15bfbe53d2eab4cf70f18a8cd68ebe5b3cb1dece" [];
        "chownr@^1.1.1" = s."chownr@1.1.4";
        "chownr@^2.0.0" = s."chownr@2.0.0";
        "chrome-trace-event@1.0.3" = f "chrome-trace-event" "1.0.3" y "1015eced4741e15d06664a957dbbf50d041e26ac" [];
        "chrome-trace-event@^1.0.2" = s."chrome-trace-event@1.0.3";
        "ci-info@2.0.0" = f "ci-info" "2.0.0" y "67a9e964be31a51e15e5010d58e6f12834002f46" [];
        "ci-info@3.3.2" = f "ci-info" "3.3.2" y "6d2967ffa407466481c6c90b6e16b3098f080128" [];
        "ci-info@^2.0.0" = s."ci-info@2.0.0";
        "ci-info@^3.2.0" = s."ci-info@3.3.2";
        "cipher-base@1.0.4" = f "cipher-base" "1.0.4" y "8760e4ecc272f4c363532f926d874aae2c1397de" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "cipher-base@^1.0.0" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.1" = s."cipher-base@1.0.4";
        "cipher-base@^1.0.3" = s."cipher-base@1.0.4";
        "cjs-module-lexer@1.2.2" = f "cjs-module-lexer" "1.2.2" y "9f84ba3244a512f3a54e5277e8eef4c489864e40" [];
        "cjs-module-lexer@^1.0.0" = s."cjs-module-lexer@1.2.2";
        "class-utils@0.3.6" = f "class-utils" "0.3.6" y "f93369ae8b9a7ce02fd41faad0ca83033190c463" [
          (s."arr-union@^3.1.0")
          (s."define-property@^0.2.5")
          (s."isobject@^3.0.0")
          (s."static-extend@^0.1.1")
          ];
        "class-utils@^0.3.5" = s."class-utils@0.3.6";
        "clean-css@4.2.4" = f "clean-css" "4.2.4" y "733bf46eba4e607c6891ea57c24a989356831178" [
          (s."source-map@~0.6.0")
          ];
        "clean-css@5.3.0" = f "clean-css" "5.3.0" y "ad3d8238d5f3549e83d5f87205189494bc7cbb59" [
          (s."source-map@~0.6.0")
          ];
        "clean-css@^4.2.3" = s."clean-css@4.2.4";
        "clean-css@^5.2.2" = s."clean-css@5.3.0";
        "clean-css@^5.3.0" = s."clean-css@5.3.0";
        "clean-stack@2.2.0" = f "clean-stack" "2.2.0" y "ee8472dbb129e727b31e8a10a427dee9dfe4008b" [];
        "clean-stack@^2.0.0" = s."clean-stack@2.2.0";
        "cli-boxes@2.2.1" = f "cli-boxes" "2.2.1" y "ddd5035d25094fce220e9cab40a45840a440318f" [];
        "cli-boxes@3.0.0" = f "cli-boxes" "3.0.0" y "71a10c716feeba005e4504f36329ef0b17cf3145" [];
        "cli-boxes@^2.2.1" = s."cli-boxes@2.2.1";
        "cli-boxes@^3.0.0" = s."cli-boxes@3.0.0";
        "cli-table3@0.6.2" = f "cli-table3" "0.6.2" y "aaf5df9d8b5bf12634dc8b3040806a0c07120d2a" [
          (s."string-width@^4.2.0")
          (s."@colors/colors@1.5.0")
          ];
        "cli-table3@^0.6.1" = s."cli-table3@0.6.2";
        "cli-table3@^0.6.2" = s."cli-table3@0.6.2";
        "cliui@6.0.0" = f "cliui" "6.0.0" y "511d702c0c4e41ca156d7d0e96021f23e13225b1" [
          (s."string-width@^4.2.0")
          (s."strip-ansi@^6.0.0")
          (s."wrap-ansi@^6.2.0")
          ];
        "cliui@7.0.4" = f "cliui" "7.0.4" y "a0265ee655476fc807aea9df3df8df7783808b4f" [
          (s."string-width@^4.2.0")
          (s."strip-ansi@^6.0.0")
          (s."wrap-ansi@^7.0.0")
          ];
        "cliui@^6.0.0" = s."cliui@6.0.0";
        "cliui@^7.0.2" = s."cliui@7.0.4";
        "clone-deep@4.0.1" = f "clone-deep" "4.0.1" y "c19fd9bdbbf85942b4fd979c84dcf7d5f07c2387" [
          (s."is-plain-object@^2.0.4")
          (s."kind-of@^6.0.2")
          (s."shallow-clone@^3.0.0")
          ];
        "clone-deep@^4.0.1" = s."clone-deep@4.0.1";
        "clone-response@1.0.2" = f "clone-response" "1.0.2" y "d1dc973920314df67fbeb94223b4ee350239e96b" [
          (s."mimic-response@^1.0.0")
          ];
        "clone-response@^1.0.2" = s."clone-response@1.0.2";
        "clone@2.1.2" = f "clone" "2.1.2" y "1b7f4b9f591f1e8f83670401600345a02887435f" [];
        "clone@~2.1.2" = s."clone@2.1.2";
        "clsx@1.2.1" = f "clsx" "1.2.1" y "0ddc4a20a549b59c93a4116bb26f5294ca17dc12" [];
        "clsx@^1.2.1" = s."clsx@1.2.1";
        "co@4.6.0" = f "co" "4.6.0" y "6ea6bdf3d853ae54ccb8e47bfa0bf3f9031fb184" [];
        "co@^4.6.0" = s."co@4.6.0";
        "coa@2.0.2" = f "coa" "2.0.2" y "43f6c21151b4ef2bf57187db0d73de229e3e7ec3" [
          (s."@types/q@^1.5.1")
          (s."chalk@^2.4.1")
          (s."q@^1.1.2")
          ];
        "coa@^2.0.2" = s."coa@2.0.2";
        "codecov@3.8.3" = f "codecov" "3.8.3" y "9c3e364b8a700c597346ae98418d09880a3fdbe7" [
          (s."argv@0.0.2")
          (s."ignore-walk@3.0.4")
          (s."js-yaml@3.14.1")
          (s."teeny-request@7.1.1")
          (s."urlgrey@1.0.0")
          ];
        "codecov@^3.8.3" = s."codecov@3.8.3";
        "collapse-white-space@1.0.6" = f "collapse-white-space" "1.0.6" y "e63629c0016665792060dbbeb79c42239d2c5287" [];
        "collapse-white-space@^1.0.2" = s."collapse-white-space@1.0.6";
        "collect-v8-coverage@1.0.1" = f "collect-v8-coverage" "1.0.1" y "cc2c8e94fc18bbdffe64d6534570c8a673b27f59" [];
        "collect-v8-coverage@^1.0.0" = s."collect-v8-coverage@1.0.1";
        "collection-visit@1.0.0" = f "collection-visit" "1.0.0" y "4bc0373c164bc3291b4d368c829cf1a80a59dca0" [
          (s."map-visit@^1.0.0")
          (s."object-visit@^1.0.0")
          ];
        "collection-visit@^1.0.0" = s."collection-visit@1.0.0";
        "color-convert@1.9.3" = f "color-convert" "1.9.3" y "bb71850690e1f136567de629d2d5471deda4c1e8" [
          (s."color-name@1.1.3")
          ];
        "color-convert@2.0.1" = f "color-convert" "2.0.1" y "72d3a68d598c9bdb3af2ad1e84f21d896abd4de3" [
          (s."color-name@~1.1.4")
          ];
        "color-convert@^1.9.0" = s."color-convert@1.9.3";
        "color-convert@^2.0.1" = s."color-convert@2.0.1";
        "color-name@1.1.3" = f "color-name" "1.1.3" y "a7d0558bd89c42f795dd42328f740831ca53bc25" [];
        "color-name@1.1.4" = f "color-name" "1.1.4" y "c2a09a87acbde69543de6f63fa3995c826c536a2" [];
        "color-name@^1.1.4" = s."color-name@1.1.4";
        "color-name@~1.1.4" = s."color-name@1.1.4";
        "color-support@1.1.3" = f "color-support" "1.1.3" y "93834379a1cc9a0c61f82f52f0d04322251bd5a2" [];
        "color-support@^1.1.2" = s."color-support@1.1.3";
        "colord@2.9.2" = f "colord" "2.9.2" y "25e2bacbbaa65991422c07ea209e2089428effb1" [];
        "colord@^2.9.1" = s."colord@2.9.2";
        "colorette@1.4.0" = f "colorette" "1.4.0" y "5190fbb87276259a86ad700bff2c6d6faa3fca40" [];
        "colorette@2.0.19" = f "colorette" "2.0.19" y "cdf044f47ad41a0f4b56b3a0d5b4e6e1a2d5a798" [];
        "colorette@^1.2.2" = s."colorette@1.4.0";
        "colorette@^2.0.10" = s."colorette@2.0.19";
        "colorette@^2.0.14" = s."colorette@2.0.19";
        "combine-promises@1.1.0" = f "combine-promises" "1.1.0" y "72db90743c0ca7aab7d0d8d2052fd7b0f674de71" [];
        "combine-promises@^1.1.0" = s."combine-promises@1.1.0";
        "combined-stream@1.0.8" = f "combined-stream" "1.0.8" y "c3d45a8b34fd730631a110a8a2520682b31d5a7f" [
          (s."delayed-stream@~1.0.0")
          ];
        "combined-stream@^1.0.8" = s."combined-stream@1.0.8";
        "comma-separated-tokens@1.0.8" = f "comma-separated-tokens" "1.0.8" y "632b80b6117867a158f1080ad498b2fbe7e3f5ea" [];
        "comma-separated-tokens@^1.0.0" = s."comma-separated-tokens@1.0.8";
        "commander@2" = s."commander@2.20.3";
        "commander@2.20.3" = f "commander" "2.20.3" y "fd485e84c03eb4881c20722ba48035e8531aeb33" [];
        "commander@4.1.1" = f "commander" "4.1.1" y "9fd602bd936294e9e9ef46a3f4d6964044b18068" [];
        "commander@5.1.0" = f "commander" "5.1.0" y "46abbd1652f8e059bddaef99bbdcb2ad9cf179ae" [];
        "commander@6.2.1" = f "commander" "6.2.1" y "0792eb682dfbc325999bb2b84fddddba110ac73c" [];
        "commander@7" = s."commander@7.2.0";
        "commander@7.2.0" = f "commander" "7.2.0" y "a36cb57d0b501ce108e4d20559a150a391d97ab7" [];
        "commander@8.3.0" = f "commander" "8.3.0" y "4837ea1b2da67b9c616a67afbb0fafee567bca66" [];
        "commander@9.4.0" = f "commander" "9.4.0" y "bc4a40918fefe52e22450c111ecd6b7acce6f11c" [];
        "commander@^2.19.0" = s."commander@2.20.3";
        "commander@^2.20.0" = s."commander@2.20.3";
        "commander@^2.8.1" = s."commander@2.20.3";
        "commander@^4.1.1" = s."commander@4.1.1";
        "commander@^5.1.0" = s."commander@5.1.0";
        "commander@^6.2.1" = s."commander@6.2.1";
        "commander@^7.0.0" = s."commander@7.2.0";
        "commander@^7.2.0" = s."commander@7.2.0";
        "commander@^8.0.0" = s."commander@8.3.0";
        "commander@^8.3.0" = s."commander@8.3.0";
        "commander@^9.3.0" = s."commander@9.4.0";
        "commander@^9.4.0" = s."commander@9.4.0";
        "common-path-prefix@3.0.0" = f "common-path-prefix" "3.0.0" y "7d007a7e07c58c4b4d5f433131a19141b29f11e0" [];
        "common-path-prefix@^3.0.0" = s."common-path-prefix@3.0.0";
        "common-tags@1.8.2" = f "common-tags" "1.8.2" y "94ebb3c076d26032745fd54face7f688ef5ac9c6" [];
        "common-tags@^1.8.0" = s."common-tags@1.8.2";
        "commondir@1.0.1" = f "commondir" "1.0.1" y "ddd800da0c66127393cca5950ea968a3aaf1253b" [];
        "commondir@^1.0.1" = s."commondir@1.0.1";
        "complex.js@2.1.1" = f "complex.js" "2.1.1" y "0675dac8e464ec431fb2ab7d30f41d889fb25c31" [];
        "complex.js@^2.1.1" = s."complex.js@2.1.1";
        "component-emitter@1.3.0" = f "component-emitter" "1.3.0" y "16e4070fba8ae29b679f2215853ee181ab2eabc0" [];
        "component-emitter@^1.2.1" = s."component-emitter@1.3.0";
        "compressible@2.0.18" = f "compressible" "2.0.18" y "af53cca6b070d4c3c0750fbd77286a6d7cc46fba" [
          (s."mime-db@>= 1.43.0 < 2")
          ];
        "compressible@~2.0.16" = s."compressible@2.0.18";
        "compression@1.7.4" = f "compression" "1.7.4" y "95523eff170ca57c29a0ca41e6fe131f41e5bb8f" [
          (s."accepts@~1.3.5")
          (s."bytes@3.0.0")
          (s."compressible@~2.0.16")
          (s."debug@2.6.9")
          (s."on-headers@~1.0.2")
          (s."safe-buffer@5.1.2")
          (s."vary@~1.1.2")
          ];
        "compression@^1.7.4" = s."compression@1.7.4";
        "concat-map@0.0.1" = f "concat-map" "0.0.1" y "d8a96bd77fd68df7793a73036a3ba0d5405d477b" [];
        "concat-stream@1.6.2" = f "concat-stream" "1.6.2" y "904bdf194cd3122fc675c77fc4ac3d4ff0fd1a34" [
          (s."buffer-from@^1.0.0")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.2.2")
          (s."typedarray@^0.0.6")
          ];
        "concat-stream@^1.5.0" = s."concat-stream@1.6.2";
        "configstore@5.0.1" = f "configstore" "5.0.1" y "d365021b5df4b98cdd187d6a3b0e3f6a7cc5ed96" [
          (s."dot-prop@^5.2.0")
          (s."graceful-fs@^4.1.2")
          (s."make-dir@^3.0.0")
          (s."unique-string@^2.0.0")
          (s."write-file-atomic@^3.0.0")
          (s."xdg-basedir@^4.0.0")
          ];
        "configstore@^5.0.1" = s."configstore@5.0.1";
        "confusing-browser-globals@1.0.11" = f "confusing-browser-globals" "1.0.11" y "ae40e9b57cdd3915408a2805ebd3a5585608dc81" [];
        "confusing-browser-globals@^1.0.11" = s."confusing-browser-globals@1.0.11";
        "connect-history-api-fallback@2.0.0" = f "connect-history-api-fallback" "2.0.0" y "647264845251a0daf25b97ce87834cace0f5f1c8" [];
        "connect-history-api-fallback@^2.0.0" = s."connect-history-api-fallback@2.0.0";
        "consola@2.15.3" = f "consola" "2.15.3" y "2e11f98d6a4be71ff72e0bdf07bd23e12cb61550" [];
        "consola@^2.15.3" = s."consola@2.15.3";
        "console-browserify@1.2.0" = f "console-browserify" "1.2.0" y "67063cef57ceb6cf4993a2ab3a55840ae8c49336" [];
        "console-browserify@^1.1.0" = s."console-browserify@1.2.0";
        "console-control-strings@1.1.0" = f "console-control-strings" "1.1.0" y "3d7cf4464db6446ea644bf4b39507f9851008e8e" [];
        "console-control-strings@^1.0.0" = s."console-control-strings@1.1.0";
        "console-control-strings@^1.1.0" = s."console-control-strings@1.1.0";
        "constants-browserify@1.0.0" = f "constants-browserify" "1.0.0" y "c20b96d8c617748aaf1c16021760cd27fcb8cb75" [];
        "constants-browserify@^1.0.0" = s."constants-browserify@1.0.0";
        "content-disposition@0.5.2" = f "content-disposition" "0.5.2" y "0cf68bb9ddf5f2be7961c3a85178cb85dba78cb4" [];
        "content-disposition@0.5.4" = f "content-disposition" "0.5.4" y "8b82b4efac82512a02bb0b1dcec9d2c5e8eb5bfe" [
          (s."safe-buffer@5.2.1")
          ];
        "content-type@1.0.4" = f "content-type" "1.0.4" y "e138cc75e040c727b1966fe5e5f8c9aee256fe3b" [];
        "content-type@~1.0.4" = s."content-type@1.0.4";
        "convert-source-map@1.8.0" = f "convert-source-map" "1.8.0" y "f3373c32d21b4d780dd8004514684fb791ca4369" [
          (s."safe-buffer@~5.1.1")
          ];
        "convert-source-map@^1.4.0" = s."convert-source-map@1.8.0";
        "convert-source-map@^1.6.0" = s."convert-source-map@1.8.0";
        "convert-source-map@^1.7.0" = s."convert-source-map@1.8.0";
        "cookie-signature@1.0.6" = f "cookie-signature" "1.0.6" y "e303a882b342cc3ee8ca513a79999734dab3ae2c" [];
        "cookie@0.5.0" = f "cookie" "0.5.0" y "d1f5d71adec6558c58f389987c366aa47e994f8b" [];
        "copy-concurrently@1.0.5" = f "copy-concurrently" "1.0.5" y "92297398cae34937fcafd6ec8139c18051f0b5e0" [
          (s."aproba@^1.1.1")
          (s."fs-write-stream-atomic@^1.0.8")
          (s."iferr@^0.1.5")
          (s."mkdirp@^0.5.1")
          (s."rimraf@^2.5.4")
          (s."run-queue@^1.0.0")
          ];
        "copy-concurrently@^1.0.0" = s."copy-concurrently@1.0.5";
        "copy-descriptor@0.1.1" = f "copy-descriptor" "0.1.1" y "676f6eb3c39997c2ee1ac3a924fd6124748f578d" [];
        "copy-descriptor@^0.1.0" = s."copy-descriptor@0.1.1";
        "copy-text-to-clipboard@3.0.1" = f "copy-text-to-clipboard" "3.0.1" y "8cbf8f90e0a47f12e4a24743736265d157bce69c" [];
        "copy-text-to-clipboard@^3.0.1" = s."copy-text-to-clipboard@3.0.1";
        "copy-to-clipboard@3.3.1" = f "copy-to-clipboard" "3.3.1" y "115aa1a9998ffab6196f93076ad6da3b913662ae" [
          (s."toggle-selection@^1.0.6")
          ];
        "copy-to-clipboard@^3.3.1" = s."copy-to-clipboard@3.3.1";
        "copy-webpack-plugin@11.0.0" = f "copy-webpack-plugin" "11.0.0" y "96d4dbdb5f73d02dd72d0528d1958721ab72e04a" [
          (s."fast-glob@^3.2.11")
          (s."glob-parent@^6.0.1")
          (s."globby@^13.1.1")
          (s."normalize-path@^3.0.0")
          (s."schema-utils@^4.0.0")
          (s."serialize-javascript@^6.0.0")
          ];
        "copy-webpack-plugin@^11.0.0" = s."copy-webpack-plugin@11.0.0";
        "core-js-compat@3.23.2" = f "core-js-compat" "3.23.2" y "5cbf8a9c8812d665392845b85ae91b5bcc7b615c" [
          (s."browserslist@^4.20.4")
          (s."semver@7.0.0")
          ];
        "core-js-compat@^3.21.0" = s."core-js-compat@3.23.2";
        "core-js-compat@^3.22.1" = s."core-js-compat@3.23.2";
        "core-js-compat@^3.8.1" = s."core-js-compat@3.23.2";
        "core-js-pure@3.23.2" = f "core-js-pure" "3.23.2" y "efe5e486469c5ed2d088d76e973eb12e74a930e7" [];
        "core-js-pure@^3.20.2" = s."core-js-pure@3.23.2";
        "core-js-pure@^3.8.1" = s."core-js-pure@3.23.2";
        "core-js@2.6.12" = f "core-js" "2.6.12" y "d9333dfa7b065e347cc5682219d6f690859cc2ec" [];
        "core-js@3.23.4" = f "core-js" "3.23.4" y "92d640faa7f48b90bbd5da239986602cfc402aa6" [];
        "core-js@^2.4.0" = s."core-js@2.6.12";
        "core-js@^3.0.4" = s."core-js@3.23.4";
        "core-js@^3.19.2" = s."core-js@3.23.4";
        "core-js@^3.23.3" = s."core-js@3.23.4";
        "core-js@^3.6.5" = s."core-js@3.23.4";
        "core-js@^3.8.2" = s."core-js@3.23.4";
        "core-util-is@1.0.3" = f "core-util-is" "1.0.3" y "a6042d3634c2b27e9328f837b965fac83808db85" [];
        "core-util-is@~1.0.0" = s."core-util-is@1.0.3";
        "cosmiconfig@6.0.0" = f "cosmiconfig" "6.0.0" y "da4fee853c52f6b1e6935f41c1a2fc50bd4a9982" [
          (s."@types/parse-json@^4.0.0")
          (s."import-fresh@^3.1.0")
          (s."parse-json@^5.0.0")
          (s."path-type@^4.0.0")
          (s."yaml@^1.7.2")
          ];
        "cosmiconfig@7.0.1" = f "cosmiconfig" "7.0.1" y "714d756522cace867867ccb4474c5d01bbae5d6d" [
          (s."@types/parse-json@^4.0.0")
          (s."import-fresh@^3.2.1")
          (s."parse-json@^5.0.0")
          (s."path-type@^4.0.0")
          (s."yaml@^1.10.0")
          ];
        "cosmiconfig@^6.0.0" = s."cosmiconfig@6.0.0";
        "cosmiconfig@^7.0.0" = s."cosmiconfig@7.0.1";
        "cosmiconfig@^7.0.1" = s."cosmiconfig@7.0.1";
        "cp-file@7.0.0" = f "cp-file" "7.0.0" y "b9454cfd07fe3b974ab9ea0e5f29655791a9b8cd" [
          (s."graceful-fs@^4.1.2")
          (s."make-dir@^3.0.0")
          (s."nested-error-stacks@^2.0.0")
          (s."p-event@^4.1.0")
          ];
        "cp-file@^7.0.0" = s."cp-file@7.0.0";
        "cpy@8.1.2" = f "cpy" "8.1.2" y "e339ea54797ad23f8e3919a5cffd37bfc3f25935" [
          (s."arrify@^2.0.1")
          (s."cp-file@^7.0.0")
          (s."globby@^9.2.0")
          (s."has-glob@^1.0.0")
          (s."junk@^3.1.0")
          (s."nested-error-stacks@^2.1.0")
          (s."p-all@^2.1.0")
          (s."p-filter@^2.1.0")
          (s."p-map@^3.0.0")
          ];
        "cpy@^8.1.2" = s."cpy@8.1.2";
        "create-ecdh@4.0.4" = f "create-ecdh" "4.0.4" y "d6e7f4bffa66736085a0762fd3a632684dabcc4e" [
          (s."bn.js@^4.1.0")
          (s."elliptic@^6.5.3")
          ];
        "create-ecdh@^4.0.0" = s."create-ecdh@4.0.4";
        "create-hash@1.2.0" = f "create-hash" "1.2.0" y "889078af11a63756bcfb59bd221996be3a9ef196" [
          (s."cipher-base@^1.0.1")
          (s."inherits@^2.0.1")
          (s."md5.js@^1.3.4")
          (s."ripemd160@^2.0.1")
          (s."sha.js@^2.4.0")
          ];
        "create-hash@^1.1.0" = s."create-hash@1.2.0";
        "create-hash@^1.1.2" = s."create-hash@1.2.0";
        "create-hash@^1.2.0" = s."create-hash@1.2.0";
        "create-hmac@1.1.7" = f "create-hmac" "1.1.7" y "69170c78b3ab957147b2b8b04572e47ead2243ff" [
          (s."cipher-base@^1.0.3")
          (s."create-hash@^1.1.0")
          (s."inherits@^2.0.1")
          (s."ripemd160@^2.0.0")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
          ];
        "create-hmac@^1.1.0" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.4" = s."create-hmac@1.1.7";
        "create-hmac@^1.1.7" = s."create-hmac@1.1.7";
        "create-require@1.1.1" = f "create-require" "1.1.1" y "c1d7e8f1e5f6cfc9ff65f9cd352d37348756c333" [];
        "create-require@^1.1.0" = s."create-require@1.1.1";
        "cross-env@7.0.3" = f "cross-env" "7.0.3" y "865264b29677dc015ba8418918965dd232fc54cf" [
          (s."cross-spawn@^7.0.1")
          ];
        "cross-env@^7.0.3" = s."cross-env@7.0.3";
        "cross-fetch@3.1.5" = f "cross-fetch" "3.1.5" y "e1389f44d9e7ba767907f7af8454787952ab534f" [
          (s."node-fetch@2.6.7")
          ];
        "cross-fetch@^3.1.5" = s."cross-fetch@3.1.5";
        "cross-spawn@6.0.5" = f "cross-spawn" "6.0.5" y "4a5ec7c64dfae22c3a14124dbacdee846d80cbc4" [
          (s."nice-try@^1.0.4")
          (s."path-key@^2.0.1")
          (s."semver@^5.5.0")
          (s."shebang-command@^1.2.0")
          (s."which@^1.2.9")
          ];
        "cross-spawn@7.0.3" = f "cross-spawn" "7.0.3" y "f73a85b9d5d41d045551c177e2882d4ac85728a6" [
          (s."path-key@^3.1.0")
          (s."shebang-command@^2.0.0")
          (s."which@^2.0.1")
          ];
        "cross-spawn@^6.0.0" = s."cross-spawn@6.0.5";
        "cross-spawn@^7.0.0" = s."cross-spawn@7.0.3";
        "cross-spawn@^7.0.1" = s."cross-spawn@7.0.3";
        "cross-spawn@^7.0.2" = s."cross-spawn@7.0.3";
        "cross-spawn@^7.0.3" = s."cross-spawn@7.0.3";
        "crypto-browserify@3.12.0" = f "crypto-browserify" "3.12.0" y "396cf9f3137f03e4b8e532c58f698254e00f80ec" [
          (s."browserify-cipher@^1.0.0")
          (s."browserify-sign@^4.0.0")
          (s."create-ecdh@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."create-hmac@^1.1.0")
          (s."diffie-hellman@^5.0.0")
          (s."inherits@^2.0.1")
          (s."pbkdf2@^3.0.3")
          (s."public-encrypt@^4.0.0")
          (s."randombytes@^2.0.0")
          (s."randomfill@^1.0.3")
          ];
        "crypto-browserify@^3.11.0" = s."crypto-browserify@3.12.0";
        "crypto-random-string@2.0.0" = f "crypto-random-string" "2.0.0" y "ef2a7a966ec11083388369baa02ebead229b30d5" [];
        "crypto-random-string@^2.0.0" = s."crypto-random-string@2.0.0";
        "css-blank-pseudo@3.0.3" = f "css-blank-pseudo" "3.0.3" y "36523b01c12a25d812df343a32c322d2a2324561" [
          (s."postcss-selector-parser@^6.0.9")
          ];
        "css-blank-pseudo@^3.0.3" = s."css-blank-pseudo@3.0.3";
        "css-declaration-sorter@6.3.0" = f "css-declaration-sorter" "6.3.0" y "72ebd995c8f4532ff0036631f7365cce9759df14" [];
        "css-declaration-sorter@^6.3.0" = s."css-declaration-sorter@6.3.0";
        "css-has-pseudo@3.0.4" = f "css-has-pseudo" "3.0.4" y "57f6be91ca242d5c9020ee3e51bbb5b89fc7af73" [
          (s."postcss-selector-parser@^6.0.9")
          ];
        "css-has-pseudo@^3.0.4" = s."css-has-pseudo@3.0.4";
        "css-in-js-utils@2.0.1" = f "css-in-js-utils" "2.0.1" y "3b472b398787291b47cfe3e44fecfdd9e914ba99" [
          (s."hyphenate-style-name@^1.0.2")
          (s."isobject@^3.0.1")
          ];
        "css-in-js-utils@^2.0.0" = s."css-in-js-utils@2.0.1";
        "css-loader@3.6.0" = f "css-loader" "3.6.0" y "2e4b2c7e6e2d27f8c8f28f61bffcd2e6c91ef645" [
          (s."camelcase@^5.3.1")
          (s."cssesc@^3.0.0")
          (s."icss-utils@^4.1.1")
          (s."loader-utils@^1.2.3")
          (s."normalize-path@^3.0.0")
          (s."postcss@^7.0.32")
          (s."postcss-modules-extract-imports@^2.0.0")
          (s."postcss-modules-local-by-default@^3.0.2")
          (s."postcss-modules-scope@^2.2.0")
          (s."postcss-modules-values@^3.0.0")
          (s."postcss-value-parser@^4.1.0")
          (s."schema-utils@^2.7.0")
          (s."semver@^6.3.0")
          ];
        "css-loader@5.2.7" = f "css-loader" "5.2.7" y "9b9f111edf6fb2be5dc62525644cbc9c232064ae" [
          (s."icss-utils@^5.1.0")
          (s."loader-utils@^2.0.0")
          (s."postcss@^8.2.15")
          (s."postcss-modules-extract-imports@^3.0.0")
          (s."postcss-modules-local-by-default@^4.0.0")
          (s."postcss-modules-scope@^3.0.0")
          (s."postcss-modules-values@^4.0.0")
          (s."postcss-value-parser@^4.1.0")
          (s."schema-utils@^3.0.0")
          (s."semver@^7.3.5")
          ];
        "css-loader@6.7.1" = f "css-loader" "6.7.1" y "e98106f154f6e1baf3fc3bc455cb9981c1d5fd2e" [
          (s."icss-utils@^5.1.0")
          (s."postcss@^8.4.7")
          (s."postcss-modules-extract-imports@^3.0.0")
          (s."postcss-modules-local-by-default@^4.0.0")
          (s."postcss-modules-scope@^3.0.0")
          (s."postcss-modules-values@^4.0.0")
          (s."postcss-value-parser@^4.2.0")
          (s."semver@^7.3.5")
          ];
        "css-loader@^3.6.0" = s."css-loader@3.6.0";
        "css-loader@^5.0.1" = s."css-loader@5.2.7";
        "css-loader@^6.5.1" = s."css-loader@6.7.1";
        "css-loader@^6.7.1" = s."css-loader@6.7.1";
        "css-minimizer-webpack-plugin@3.4.1" = f "css-minimizer-webpack-plugin" "3.4.1" y "ab78f781ced9181992fe7b6e4f3422e76429878f" [
          (s."cssnano@^5.0.6")
          (s."jest-worker@^27.0.2")
          (s."postcss@^8.3.5")
          (s."schema-utils@^4.0.0")
          (s."serialize-javascript@^6.0.0")
          (s."source-map@^0.6.1")
          ];
        "css-minimizer-webpack-plugin@4.0.0" = f "css-minimizer-webpack-plugin" "4.0.0" y "e11800388c19c2b7442c39cc78ac8ae3675c9605" [
          (s."cssnano@^5.1.8")
          (s."jest-worker@^27.5.1")
          (s."postcss@^8.4.13")
          (s."schema-utils@^4.0.0")
          (s."serialize-javascript@^6.0.0")
          (s."source-map@^0.6.1")
          ];
        "css-minimizer-webpack-plugin@^3.2.0" = s."css-minimizer-webpack-plugin@3.4.1";
        "css-minimizer-webpack-plugin@^4.0.0" = s."css-minimizer-webpack-plugin@4.0.0";
        "css-prefers-color-scheme@6.0.3" = f "css-prefers-color-scheme" "6.0.3" y "ca8a22e5992c10a5b9d315155e7caee625903349" [];
        "css-prefers-color-scheme@^6.0.3" = s."css-prefers-color-scheme@6.0.3";
        "css-select-base-adapter@0.1.1" = f "css-select-base-adapter" "0.1.1" y "3b2ff4972cc362ab88561507a95408a1432135d7" [];
        "css-select-base-adapter@^0.1.1" = s."css-select-base-adapter@0.1.1";
        "css-select@2.1.0" = f "css-select" "2.1.0" y "6a34653356635934a81baca68d0255432105dbef" [
          (s."boolbase@^1.0.0")
          (s."css-what@^3.2.1")
          (s."domutils@^1.7.0")
          (s."nth-check@^1.0.2")
          ];
        "css-select@4.3.0" = f "css-select" "4.3.0" y "db7129b2846662fd8628cfc496abb2b59e41529b" [
          (s."boolbase@^1.0.0")
          (s."css-what@^6.0.1")
          (s."domhandler@^4.3.1")
          (s."domutils@^2.8.0")
          (s."nth-check@^2.0.1")
          ];
        "css-select@5.1.0" = f "css-select" "5.1.0" y "b8ebd6554c3637ccc76688804ad3f6a6fdaea8a6" [
          (s."boolbase@^1.0.0")
          (s."css-what@^6.1.0")
          (s."domhandler@^5.0.2")
          (s."domutils@^3.0.1")
          (s."nth-check@^2.0.1")
          ];
        "css-select@^2.0.0" = s."css-select@2.1.0";
        "css-select@^4.1.3" = s."css-select@4.3.0";
        "css-select@^5.1.0" = s."css-select@5.1.0";
        "css-tree@1.0.0-alpha.37" = f "css-tree" "1.0.0-alpha.37" y "98bebd62c4c1d9f960ec340cf9f7522e30709a22" [
          (s."mdn-data@2.0.4")
          (s."source-map@^0.6.1")
          ];
        "css-tree@1.1.3" = f "css-tree" "1.1.3" y "eb4870fb6fd7707327ec95c2ff2ab09b5e8db91d" [
          (s."mdn-data@2.0.14")
          (s."source-map@^0.6.1")
          ];
        "css-tree@^1.1.2" = s."css-tree@1.1.3";
        "css-tree@^1.1.3" = s."css-tree@1.1.3";
        "css-what@3.4.2" = f "css-what" "3.4.2" y "ea7026fcb01777edbde52124e21f327e7ae950e4" [];
        "css-what@6.1.0" = f "css-what" "6.1.0" y "fb5effcf76f1ddea2c81bdfaa4de44e79bac70f4" [];
        "css-what@^3.2.1" = s."css-what@3.4.2";
        "css-what@^6.0.1" = s."css-what@6.1.0";
        "css-what@^6.1.0" = s."css-what@6.1.0";
        "css.escape@1.5.1" = f "css.escape" "1.5.1" y "42e27d4fa04ae32f931a4b4d4191fa9cddee97cb" [];
        "css.escape@^1.5.1" = s."css.escape@1.5.1";
        "css@3.0.0" = f "css" "3.0.0" y "4447a4d58fdd03367c516ca9f64ae365cee4aa5d" [
          (s."inherits@^2.0.4")
          (s."source-map@^0.6.1")
          (s."source-map-resolve@^0.6.0")
          ];
        "css@^3.0.0" = s."css@3.0.0";
        "cssdb@6.6.3" = f "cssdb" "6.6.3" y "1f331a2fab30c18d9f087301e6122a878bb1e505" [];
        "cssdb@^6.6.3" = s."cssdb@6.6.3";
        "cssesc@3.0.0" = f "cssesc" "3.0.0" y "37741919903b868565e1c09ea747445cd18983ee" [];
        "cssesc@^3.0.0" = s."cssesc@3.0.0";
        "cssnano-preset-advanced@5.3.8" = f "cssnano-preset-advanced" "5.3.8" y "027b1d05ef896d908178c483f0ec4190cb50ef9a" [
          (s."autoprefixer@^10.3.7")
          (s."cssnano-preset-default@^5.2.12")
          (s."postcss-discard-unused@^5.1.0")
          (s."postcss-merge-idents@^5.1.1")
          (s."postcss-reduce-idents@^5.2.0")
          (s."postcss-zindex@^5.1.0")
          ];
        "cssnano-preset-advanced@^5.3.8" = s."cssnano-preset-advanced@5.3.8";
        "cssnano-preset-default@5.2.12" = f "cssnano-preset-default" "5.2.12" y "ebe6596ec7030e62c3eb2b3c09f533c0644a9a97" [
          (s."css-declaration-sorter@^6.3.0")
          (s."cssnano-utils@^3.1.0")
          (s."postcss-calc@^8.2.3")
          (s."postcss-colormin@^5.3.0")
          (s."postcss-convert-values@^5.1.2")
          (s."postcss-discard-comments@^5.1.2")
          (s."postcss-discard-duplicates@^5.1.0")
          (s."postcss-discard-empty@^5.1.1")
          (s."postcss-discard-overridden@^5.1.0")
          (s."postcss-merge-longhand@^5.1.6")
          (s."postcss-merge-rules@^5.1.2")
          (s."postcss-minify-font-values@^5.1.0")
          (s."postcss-minify-gradients@^5.1.1")
          (s."postcss-minify-params@^5.1.3")
          (s."postcss-minify-selectors@^5.2.1")
          (s."postcss-normalize-charset@^5.1.0")
          (s."postcss-normalize-display-values@^5.1.0")
          (s."postcss-normalize-positions@^5.1.1")
          (s."postcss-normalize-repeat-style@^5.1.1")
          (s."postcss-normalize-string@^5.1.0")
          (s."postcss-normalize-timing-functions@^5.1.0")
          (s."postcss-normalize-unicode@^5.1.0")
          (s."postcss-normalize-url@^5.1.0")
          (s."postcss-normalize-whitespace@^5.1.1")
          (s."postcss-ordered-values@^5.1.3")
          (s."postcss-reduce-initial@^5.1.0")
          (s."postcss-reduce-transforms@^5.1.0")
          (s."postcss-svgo@^5.1.0")
          (s."postcss-unique-selectors@^5.1.1")
          ];
        "cssnano-preset-default@^5.2.12" = s."cssnano-preset-default@5.2.12";
        "cssnano-utils@3.1.0" = f "cssnano-utils" "3.1.0" y "95684d08c91511edfc70d2636338ca37ef3a6861" [];
        "cssnano-utils@^3.1.0" = s."cssnano-utils@3.1.0";
        "cssnano@5.1.12" = f "cssnano" "5.1.12" y "bcd0b64d6be8692de79332c501daa7ece969816c" [
          (s."cssnano-preset-default@^5.2.12")
          (s."lilconfig@^2.0.3")
          (s."yaml@^1.10.2")
          ];
        "cssnano@^5.0.6" = s."cssnano@5.1.12";
        "cssnano@^5.1.12" = s."cssnano@5.1.12";
        "cssnano@^5.1.8" = s."cssnano@5.1.12";
        "csso@4.2.0" = f "csso" "4.2.0" y "ea3a561346e8dc9f546d6febedd50187cf389529" [
          (s."css-tree@^1.1.2")
          ];
        "csso@^4.0.2" = s."csso@4.2.0";
        "csso@^4.2.0" = s."csso@4.2.0";
        "cssom@0.3.8" = f "cssom" "0.3.8" y "9f1276f5b2b463f2114d3f2c75250af8c1a36f4a" [];
        "cssom@0.4.4" = f "cssom" "0.4.4" y "5a66cf93d2d0b661d80bf6a44fb65f5c2e4e0a10" [];
        "cssom@^0.4.4" = s."cssom@0.4.4";
        "cssom@~0.3.6" = s."cssom@0.3.8";
        "cssstyle@2.3.0" = f "cssstyle" "2.3.0" y "ff665a0ddbdc31864b09647f34163443d90b0852" [
          (s."cssom@~0.3.6")
          ];
        "cssstyle@^2.3.0" = s."cssstyle@2.3.0";
        "csstype@3.1.0" = f "csstype" "3.1.0" y "4ddcac3718d787cf9df0d1b7d15033925c8f29f2" [];
        "csstype@^3.0.2" = s."csstype@3.1.0";
        "csstype@^3.0.6" = s."csstype@3.1.0";
        "currently-unhandled@0.4.1" = f "currently-unhandled" "0.4.1" y "988df33feab191ef799a61369dd76c17adf957ea" [
          (s."array-find-index@^1.0.1")
          ];
        "currently-unhandled@^0.4.1" = s."currently-unhandled@0.4.1";
        "cyclist@1.0.1" = f "cyclist" "1.0.1" y "596e9698fd0c80e12038c2b82d6eb1b35b6224d9" [];
        "cyclist@^1.0.1" = s."cyclist@1.0.1";
        "d3-array@1 - 3" = s."d3-array@3.1.6";
        "d3-array@2 - 3" = s."d3-array@3.1.6";
        "d3-array@2.10.0 - 3" = s."d3-array@3.1.6";
        "d3-array@2.5.0 - 3" = s."d3-array@3.1.6";
        "d3-array@3.1.1" = f "d3-array" "3.1.1" y "7797eb53ead6b9083c75a45a681e93fc41bc468c" [
          (s."internmap@1 - 2")
          ];
        "d3-array@3.1.6" = f "d3-array" "3.1.6" y "0342c835925826f49b4d16eb7027aec334ffc97d" [
          (s."internmap@1 - 2")
          ];
        "d3-array@^3.1.1" = s."d3-array@3.1.6";
        "d3-color@1 - 3" = s."d3-color@3.1.0";
        "d3-color@3.1.0" = f "d3-color" "3.1.0" y "395b2833dfac71507f12ac2f7af23bf819de24e2" [];
        "d3-color@^3.0.1" = s."d3-color@3.1.0";
        "d3-delaunay@6.0.2" = f "d3-delaunay" "6.0.2" y "7fd3717ad0eade2fc9939f4260acfb503f984e92" [
          (s."delaunator@5")
          ];
        "d3-delaunay@^6.0.2" = s."d3-delaunay@6.0.2";
        "d3-dispatch@1 - 3" = s."d3-dispatch@3.0.1";
        "d3-dispatch@3.0.1" = f "d3-dispatch" "3.0.1" y "5fc75284e9c2375c36c839411a0cf550cbfc4d5e" [];
        "d3-dsv@3.0.1" = f "d3-dsv" "3.0.1" y "c63af978f4d6a0d084a52a673922be2160789b73" [
          (s."commander@7")
          (s."iconv-lite@0.6")
          (s."rw@1")
          ];
        "d3-dsv@^3.0.1" = s."d3-dsv@3.0.1";
        "d3-force@3.0.0" = f "d3-force" "3.0.0" y "3e2ba1a61e70888fe3d9194e30d6d14eece155c4" [
          (s."d3-dispatch@1 - 3")
          (s."d3-quadtree@1 - 3")
          (s."d3-timer@1 - 3")
          ];
        "d3-force@^3.0.0" = s."d3-force@3.0.0";
        "d3-format@1 - 3" = s."d3-format@3.1.0";
        "d3-format@3.1.0" = f "d3-format" "3.1.0" y "9260e23a28ea5cb109e93b21a06e24e2ebd55641" [];
        "d3-format@^3.1.0" = s."d3-format@3.1.0";
        "d3-geo-projection@4.0.0" = f "d3-geo-projection" "4.0.0" y "dc229e5ead78d31869a4e87cf1f45bd2716c48ca" [
          (s."commander@7")
          (s."d3-array@1 - 3")
          (s."d3-geo@1.12.0 - 3")
          ];
        "d3-geo-projection@^4.0.0" = s."d3-geo-projection@4.0.0";
        "d3-geo@1.12.0 - 3" = s."d3-geo@3.0.1";
        "d3-geo@3.0.1" = f "d3-geo" "3.0.1" y "4f92362fd8685d93e3b1fae0fd97dc8980b1ed7e" [
          (s."d3-array@2.5.0 - 3")
          ];
        "d3-geo@^3.0.1" = s."d3-geo@3.0.1";
        "d3-hierarchy@3.1.2" = f "d3-hierarchy" "3.1.2" y "b01cd42c1eed3d46db77a5966cf726f8c09160c6" [];
        "d3-hierarchy@^3.1.0" = s."d3-hierarchy@3.1.2";
        "d3-interpolate@1.2.0 - 3" = s."d3-interpolate@3.0.1";
        "d3-interpolate@3.0.1" = f "d3-interpolate" "3.0.1" y "3c47aa5b32c5b3dfb56ef3fd4342078a632b400d" [
          (s."d3-color@1 - 3")
          ];
        "d3-interpolate@^3.0.1" = s."d3-interpolate@3.0.1";
        "d3-path@1 - 3" = s."d3-path@3.0.1";
        "d3-path@3.0.1" = f "d3-path" "3.0.1" y "f09dec0aaffd770b7995f1a399152bf93052321e" [];
        "d3-path@^3.0.1" = s."d3-path@3.0.1";
        "d3-quadtree@1 - 3" = s."d3-quadtree@3.0.1";
        "d3-quadtree@3.0.1" = f "d3-quadtree" "3.0.1" y "6dca3e8be2b393c9a9d514dabbd80a92deef1a4f" [];
        "d3-scale@4.0.2" = f "d3-scale" "4.0.2" y "82b38e8e8ff7080764f8dcec77bd4be393689396" [
          (s."d3-array@2.10.0 - 3")
          (s."d3-format@1 - 3")
          (s."d3-interpolate@1.2.0 - 3")
          (s."d3-time@2.1.1 - 3")
          (s."d3-time-format@2 - 4")
          ];
        "d3-scale@^4.0.2" = s."d3-scale@4.0.2";
        "d3-shape@3.1.0" = f "d3-shape" "3.1.0" y "c8a495652d83ea6f524e482fca57aa3f8bc32556" [
          (s."d3-path@1 - 3")
          ];
        "d3-shape@^3.1.0" = s."d3-shape@3.1.0";
        "d3-time-format@2 - 4" = s."d3-time-format@4.1.0";
        "d3-time-format@4.1.0" = f "d3-time-format" "4.1.0" y "7ab5257a5041d11ecb4fe70a5c7d16a195bb408a" [
          (s."d3-time@1 - 3")
          ];
        "d3-time-format@^4.1.0" = s."d3-time-format@4.1.0";
        "d3-time@1 - 3" = s."d3-time@3.0.0";
        "d3-time@2.1.1 - 3" = s."d3-time@3.0.0";
        "d3-time@3.0.0" = f "d3-time" "3.0.0" y "65972cb98ae2d4954ef5c932e8704061335d4975" [
          (s."d3-array@2 - 3")
          ];
        "d3-time@^3.0.0" = s."d3-time@3.0.0";
        "d3-timer@1 - 3" = s."d3-timer@3.0.1";
        "d3-timer@3.0.1" = f "d3-timer" "3.0.1" y "6284d2a2708285b1abb7e201eda4380af35e63b0" [];
        "d3-timer@^3.0.1" = s."d3-timer@3.0.1";
        "damerau-levenshtein@1.0.8" = f "damerau-levenshtein" "1.0.8" y "b43d286ccbd36bc5b2f7ed41caf2d0aba1f8a6e7" [];
        "damerau-levenshtein@^1.0.7" = s."damerau-levenshtein@1.0.8";
        "data-urls@2.0.0" = f "data-urls" "2.0.0" y "156485a72963a970f5d5821aaf642bef2bf2db9b" [
          (s."abab@^2.0.3")
          (s."whatwg-mimetype@^2.3.0")
          (s."whatwg-url@^8.0.0")
          ];
        "data-urls@^2.0.0" = s."data-urls@2.0.0";
        "debug@2.6.9" = f "debug" "2.6.9" y "5d128515df134ff327e90a4c93f4e077a536341f" [
          (s."ms@2.0.0")
          ];
        "debug@3.2.7" = f "debug" "3.2.7" y "72580b7e9145fb39b6676f9c5e5fb100b934179a" [
          (s."ms@^2.1.1")
          ];
        "debug@4" = s."debug@4.3.4";
        "debug@4.3.4" = f "debug" "4.3.4" y "1319f6579357f2338d3337d2cdd4914bb5dcc865" [
          (s."ms@2.1.2")
          ];
        "debug@^2.2.0" = s."debug@2.6.9";
        "debug@^2.3.3" = s."debug@2.6.9";
        "debug@^2.6.0" = s."debug@2.6.9";
        "debug@^2.6.8" = s."debug@2.6.9";
        "debug@^2.6.9" = s."debug@2.6.9";
        "debug@^3.0.0" = s."debug@3.2.7";
        "debug@^3.2.7" = s."debug@3.2.7";
        "debug@^4.1.0" = s."debug@4.3.4";
        "debug@^4.1.1" = s."debug@4.3.4";
        "debug@^4.3.2" = s."debug@4.3.4";
        "debug@^4.3.4" = s."debug@4.3.4";
        "decamelize@1.2.0" = f "decamelize" "1.2.0" y "f6534d15148269b20352e7bee26f501f9a191290" [];
        "decamelize@^1.1.2" = s."decamelize@1.2.0";
        "decamelize@^1.2.0" = s."decamelize@1.2.0";
        "decimal.js@10.3.1" = f "decimal.js" "10.3.1" y "d8c3a444a9c6774ba60ca6ad7261c3a94fd5e783" [];
        "decimal.js@^10.2.1" = s."decimal.js@10.3.1";
        "decimal.js@^10.3.1" = s."decimal.js@10.3.1";
        "decode-uri-component@0.2.0" = f "decode-uri-component" "0.2.0" y "eb3913333458775cb84cd1a1fae062106bb87545" [];
        "decode-uri-component@^0.2.0" = s."decode-uri-component@0.2.0";
        "decompress-response@3.3.0" = f "decompress-response" "3.3.0" y "80a4dd323748384bfa248083622aedec982adff3" [
          (s."mimic-response@^1.0.0")
          ];
        "decompress-response@^3.3.0" = s."decompress-response@3.3.0";
        "dedent@0.7.0" = f "dedent" "0.7.0" y "2495ddbaf6eb874abb0e1be9df22d2e5a544326c" [];
        "dedent@^0.7.0" = s."dedent@0.7.0";
        "deep-extend@0.6.0" = f "deep-extend" "0.6.0" y "c4fa7c95404a17a9c3e8ca7e1537312b736330ac" [];
        "deep-extend@^0.6.0" = s."deep-extend@0.6.0";
        "deep-is@0.1.4" = f "deep-is" "0.1.4" y "a6f2dce612fadd2ef1f519b73551f17e85199831" [];
        "deep-is@^0.1.3" = s."deep-is@0.1.4";
        "deep-is@~0.1.3" = s."deep-is@0.1.4";
        "deepmerge@4.2.2" = f "deepmerge" "4.2.2" y "44d2ea3679b8f4d4ffba33f03d865fc1e7bf4955" [];
        "deepmerge@^4.2.2" = s."deepmerge@4.2.2";
        "default-browser-id@1.0.4" = f "default-browser-id" "1.0.4" y "e59d09a5d157b828b876c26816e61c3d2a2c203a" [
          (s."bplist-parser@^0.1.0")
          (s."meow@^3.1.0")
          (s."untildify@^2.0.0")
          ];
        "default-browser-id@^1.0.4" = s."default-browser-id@1.0.4";
        "default-gateway@6.0.3" = f "default-gateway" "6.0.3" y "819494c888053bdb743edbf343d6cdf7f2943a71" [
          (s."execa@^5.0.0")
          ];
        "default-gateway@^6.0.3" = s."default-gateway@6.0.3";
        "default-require-extensions@3.0.0" = f "default-require-extensions" "3.0.0" y "e03f93aac9b2b6443fc52e5e4a37b3ad9ad8df96" [
          (s."strip-bom@^4.0.0")
          ];
        "default-require-extensions@^3.0.0" = s."default-require-extensions@3.0.0";
        "defer-to-connect@1.1.3" = f "defer-to-connect" "1.1.3" y "331ae050c08dcf789f8c83a7b81f0ed94f4ac591" [];
        "defer-to-connect@^1.0.1" = s."defer-to-connect@1.1.3";
        "define-lazy-prop@2.0.0" = f "define-lazy-prop" "2.0.0" y "3f7ae421129bcaaac9bc74905c98a0009ec9ee7f" [];
        "define-lazy-prop@^2.0.0" = s."define-lazy-prop@2.0.0";
        "define-properties@1.1.4" = f "define-properties" "1.1.4" y "0b14d7bd7fbeb2f3572c3a7eda80ea5d57fb05b1" [
          (s."has-property-descriptors@^1.0.0")
          (s."object-keys@^1.1.1")
          ];
        "define-properties@^1.1.2" = s."define-properties@1.1.4";
        "define-properties@^1.1.3" = s."define-properties@1.1.4";
        "define-properties@^1.1.4" = s."define-properties@1.1.4";
        "define-property@0.2.5" = f "define-property" "0.2.5" y "c35b1ef918ec3c990f9a5bc57be04aacec5c8116" [
          (s."is-descriptor@^0.1.0")
          ];
        "define-property@1.0.0" = f "define-property" "1.0.0" y "769ebaaf3f4a63aad3af9e8d304c9bbe79bfb0e6" [
          (s."is-descriptor@^1.0.0")
          ];
        "define-property@2.0.2" = f "define-property" "2.0.2" y "d459689e8d654ba77e02a817f8710d702cb16e9d" [
          (s."is-descriptor@^1.0.2")
          (s."isobject@^3.0.1")
          ];
        "define-property@^0.2.5" = s."define-property@0.2.5";
        "define-property@^1.0.0" = s."define-property@1.0.0";
        "define-property@^2.0.2" = s."define-property@2.0.2";
        "defined@1.0.0" = f "defined" "1.0.0" y "c98d9bcef75674188e110969151199e39b1fa693" [];
        "defined@^1.0.0" = s."defined@1.0.0";
        "del@6.1.1" = f "del" "6.1.1" y "3b70314f1ec0aa325c6b14eb36b95786671edb7a" [
          (s."globby@^11.0.1")
          (s."graceful-fs@^4.2.4")
          (s."is-glob@^4.0.1")
          (s."is-path-cwd@^2.2.0")
          (s."is-path-inside@^3.0.2")
          (s."p-map@^4.0.0")
          (s."rimraf@^3.0.2")
          (s."slash@^3.0.0")
          ];
        "del@^6.1.1" = s."del@6.1.1";
        "delaunator@5" = s."delaunator@5.0.0";
        "delaunator@5.0.0" = f "delaunator" "5.0.0" y "60f052b28bd91c9b4566850ebf7756efe821d81b" [
          (s."robust-predicates@^3.0.0")
          ];
        "delayed-stream@1.0.0" = f "delayed-stream" "1.0.0" y "df3ae199acadfb7d440aaae0b29e2272b24ec619" [];
        "delayed-stream@~1.0.0" = s."delayed-stream@1.0.0";
        "delegates@1.0.0" = f "delegates" "1.0.0" y "84c6e159b81904fdca59a0ef44cd870d31250f9a" [];
        "delegates@^1.0.0" = s."delegates@1.0.0";
        "denodeify@1.2.1" = f "denodeify" "1.2.1" y "3a36287f5034e699e7577901052c2e6c94251631" [];
        "denodeify@^1.2.1" = s."denodeify@1.2.1";
        "depd@1.1.2" = f "depd" "1.1.2" y "9bcd52e14c097763e749b274c4346ed2e560b5a9" [];
        "depd@2.0.0" = f "depd" "2.0.0" y "b696163cc757560d09cf22cc8fad1571b79e76df" [];
        "depd@~1.1.2" = s."depd@1.1.2";
        "dependency-graph@0.11.0" = f "dependency-graph" "0.11.0" y "ac0ce7ed68a54da22165a85e97a01d53f5eb2e27" [];
        "dependency-graph@^0.11.0" = s."dependency-graph@0.11.0";
        "des.js@1.0.1" = f "des.js" "1.0.1" y "5382142e1bdc53f85d86d53e5f4aa7deb91e0843" [
          (s."inherits@^2.0.1")
          (s."minimalistic-assert@^1.0.0")
          ];
        "des.js@^1.0.0" = s."des.js@1.0.1";
        "destroy@1.0.4" = f "destroy" "1.0.4" y "978857442c44749e4206613e37946205826abd80" [];
        "destroy@1.2.0" = f "destroy" "1.2.0" y "4803735509ad8be552934c67df614f94e66fa015" [];
        "destroy@~1.0.4" = s."destroy@1.0.4";
        "detab@2.0.4" = f "detab" "2.0.4" y "b927892069aff405fbb9a186fe97a44a92a94b43" [
          (s."repeat-string@^1.5.4")
          ];
        "detect-newline@3.1.0" = f "detect-newline" "3.1.0" y "576f5dfc63ae1a192ff192d8ad3af6308991b651" [];
        "detect-newline@^3.0.0" = s."detect-newline@3.1.0";
        "detect-node@2.1.0" = f "detect-node" "2.1.0" y "c9c70775a49c3d03bc2c06d9a73be550f978f8b1" [];
        "detect-node@^2.0.4" = s."detect-node@2.1.0";
        "detect-package-manager@2.0.1" = f "detect-package-manager" "2.0.1" y "6b182e3ae5e1826752bfef1de9a7b828cffa50d8" [
          (s."execa@^5.1.1")
          ];
        "detect-package-manager@^2.0.1" = s."detect-package-manager@2.0.1";
        "detect-port-alt@1.1.6" = f "detect-port-alt" "1.1.6" y "24707deabe932d4a3cf621302027c2b266568275" [
          (s."address@^1.0.1")
          (s."debug@^2.6.0")
          ];
        "detect-port-alt@^1.1.6" = s."detect-port-alt@1.1.6";
        "detect-port@1.3.0" = f "detect-port" "1.3.0" y "d9c40e9accadd4df5cac6a782aefd014d573d1f1" [
          (s."address@^1.0.1")
          (s."debug@^2.6.0")
          ];
        "detect-port@^1.3.0" = s."detect-port@1.3.0";
        "detective@5.2.1" = f "detective" "5.2.1" y "6af01eeda11015acb0e73f933242b70f24f91034" [
          (s."acorn-node@^1.8.2")
          (s."defined@^1.0.0")
          (s."minimist@^1.2.6")
          ];
        "detective@^5.2.1" = s."detective@5.2.1";
        "didyoumean@1.2.2" = f "didyoumean" "1.2.2" y "989346ffe9e839b4555ecf5666edea0d3e8ad037" [];
        "didyoumean@^1.2.1" = s."didyoumean@1.2.2";
        "didyoumean@^1.2.2" = s."didyoumean@1.2.2";
        "diff-match-patch@1.0.5" = f "diff-match-patch" "1.0.5" y "abb584d5f10cd1196dfc55aa03701592ae3f7b37" [];
        "diff-match-patch@^1.0.5" = s."diff-match-patch@1.0.5";
        "diff-sequences@27.5.1" = f "diff-sequences" "27.5.1" y "eaecc0d327fd68c8d9672a1e64ab8dccb2ef5327" [];
        "diff-sequences@28.1.1" = f "diff-sequences" "28.1.1" y "9989dc731266dc2903457a70e996f3a041913ac6" [];
        "diff-sequences@^27.5.1" = s."diff-sequences@27.5.1";
        "diff-sequences@^28.1.1" = s."diff-sequences@28.1.1";
        "diff@4.0.2" = f "diff" "4.0.2" y "60f3aecb89d5fae520c11aa19efc2bb982aade7d" [];
        "diff@^4.0.1" = s."diff@4.0.2";
        "diffie-hellman@5.0.3" = f "diffie-hellman" "5.0.3" y "40e8ee98f55a2149607146921c63e1ae5f3d2875" [
          (s."bn.js@^4.1.0")
          (s."miller-rabin@^4.0.0")
          (s."randombytes@^2.0.0")
          ];
        "diffie-hellman@^5.0.0" = s."diffie-hellman@5.0.3";
        "dir-glob@2.2.2" = f "dir-glob" "2.2.2" y "fa09f0694153c8918b18ba0deafae94769fc50c4" [
          (s."path-type@^3.0.0")
          ];
        "dir-glob@3.0.1" = f "dir-glob" "3.0.1" y "56dbf73d992a4a93ba1584f4534063fd2e41717f" [
          (s."path-type@^4.0.0")
          ];
        "dir-glob@^2.2.2" = s."dir-glob@2.2.2";
        "dir-glob@^3.0.1" = s."dir-glob@3.0.1";
        "dlv@1.1.3" = f "dlv" "1.1.3" y "5c198a8a11453596e751494d49874bc7732f2e79" [];
        "dlv@^1.1.3" = s."dlv@1.1.3";
        "dns-equal@1.0.0" = f "dns-equal" "1.0.0" y "b39e7f1da6eb0a75ba9c17324b34753c47e0654d" [];
        "dns-equal@^1.0.0" = s."dns-equal@1.0.0";
        "dns-packet@5.4.0" = f "dns-packet" "5.4.0" y "1f88477cf9f27e78a213fb6d118ae38e759a879b" [
          (s."@leichtgewicht/ip-codec@^2.0.1")
          ];
        "dns-packet@^5.2.2" = s."dns-packet@5.4.0";
        "doctrine@2.1.0" = f "doctrine" "2.1.0" y "5cd01fc101621b42c4cd7f5d1a66243716d3f39d" [
          (s."esutils@^2.0.2")
          ];
        "doctrine@3.0.0" = f "doctrine" "3.0.0" y "addebead72a6574db783639dc87a121773973961" [
          (s."esutils@^2.0.2")
          ];
        "doctrine@^2.1.0" = s."doctrine@2.1.0";
        "doctrine@^3.0.0" = s."doctrine@3.0.0";
        "dom-accessibility-api@0.5.14" = f "dom-accessibility-api" "0.5.14" y "56082f71b1dc7aac69d83c4285eef39c15d93f56" [];
        "dom-accessibility-api@^0.5.6" = s."dom-accessibility-api@0.5.14";
        "dom-accessibility-api@^0.5.9" = s."dom-accessibility-api@0.5.14";
        "dom-converter@0.2.0" = f "dom-converter" "0.2.0" y "6721a9daee2e293682955b6afe416771627bb768" [
          (s."utila@~0.4")
          ];
        "dom-converter@^0.2.0" = s."dom-converter@0.2.0";
        "dom-serializer@0" = s."dom-serializer@0.2.2";
        "dom-serializer@0.2.2" = f "dom-serializer" "0.2.2" y "1afb81f533717175d478655debc5e332d9f9bb51" [
          (s."domelementtype@^2.0.1")
          (s."entities@^2.0.0")
          ];
        "dom-serializer@1.4.1" = f "dom-serializer" "1.4.1" y "de5d41b1aea290215dc45a6dae8adcf1d32e2d30" [
          (s."domelementtype@^2.0.1")
          (s."domhandler@^4.2.0")
          (s."entities@^2.0.0")
          ];
        "dom-serializer@2.0.0" = f "dom-serializer" "2.0.0" y "e41b802e1eedf9f6cae183ce5e622d789d7d8e53" [
          (s."domelementtype@^2.3.0")
          (s."domhandler@^5.0.2")
          (s."entities@^4.2.0")
          ];
        "dom-serializer@^1.0.1" = s."dom-serializer@1.4.1";
        "dom-serializer@^2.0.0" = s."dom-serializer@2.0.0";
        "dom-walk@0.1.2" = f "dom-walk" "0.1.2" y "0c548bef048f4d1f2a97249002236060daa3fd84" [];
        "dom-walk@^0.1.0" = s."dom-walk@0.1.2";
        "domain-browser@1.2.0" = f "domain-browser" "1.2.0" y "3d31f50191a6749dd1375a7f522e823d42e54eda" [];
        "domain-browser@^1.1.1" = s."domain-browser@1.2.0";
        "domelementtype@1" = s."domelementtype@1.3.1";
        "domelementtype@1.3.1" = f "domelementtype" "1.3.1" y "d048c44b37b0d10a7f2a3d5fee3f4333d790481f" [];
        "domelementtype@2.3.0" = f "domelementtype" "2.3.0" y "5c45e8e869952626331d7aab326d01daf65d589d" [];
        "domelementtype@^2.0.1" = s."domelementtype@2.3.0";
        "domelementtype@^2.2.0" = s."domelementtype@2.3.0";
        "domelementtype@^2.3.0" = s."domelementtype@2.3.0";
        "domexception@2.0.1" = f "domexception" "2.0.1" y "fb44aefba793e1574b0af6aed2801d057529f304" [
          (s."webidl-conversions@^5.0.0")
          ];
        "domexception@^2.0.1" = s."domexception@2.0.1";
        "domhandler@4.3.1" = f "domhandler" "4.3.1" y "8d792033416f59d68bc03a5aa7b018c1ca89279c" [
          (s."domelementtype@^2.2.0")
          ];
        "domhandler@5.0.3" = f "domhandler" "5.0.3" y "cc385f7f751f1d1fc650c21374804254538c7d31" [
          (s."domelementtype@^2.3.0")
          ];
        "domhandler@^4.0.0" = s."domhandler@4.3.1";
        "domhandler@^4.2.0" = s."domhandler@4.3.1";
        "domhandler@^4.3.1" = s."domhandler@4.3.1";
        "domhandler@^5.0.1" = s."domhandler@5.0.3";
        "domhandler@^5.0.2" = s."domhandler@5.0.3";
        "domhandler@^5.0.3" = s."domhandler@5.0.3";
        "domutils@1.7.0" = f "domutils" "1.7.0" y "56ea341e834e06e6748af7a1cb25da67ea9f8c2a" [
          (s."dom-serializer@0")
          (s."domelementtype@1")
          ];
        "domutils@2.8.0" = f "domutils" "2.8.0" y "4437def5db6e2d1f5d6ee859bd95ca7d02048135" [
          (s."dom-serializer@^1.0.1")
          (s."domelementtype@^2.2.0")
          (s."domhandler@^4.2.0")
          ];
        "domutils@3.0.1" = f "domutils" "3.0.1" y "696b3875238338cb186b6c0612bd4901c89a4f1c" [
          (s."dom-serializer@^2.0.0")
          (s."domelementtype@^2.3.0")
          (s."domhandler@^5.0.1")
          ];
        "domutils@^1.7.0" = s."domutils@1.7.0";
        "domutils@^2.5.2" = s."domutils@2.8.0";
        "domutils@^2.8.0" = s."domutils@2.8.0";
        "domutils@^3.0.1" = s."domutils@3.0.1";
        "dot-case@3.0.4" = f "dot-case" "3.0.4" y "9b2b670d00a431667a8a75ba29cd1b98809ce751" [
          (s."no-case@^3.0.4")
          (s."tslib@^2.0.3")
          ];
        "dot-case@^3.0.4" = s."dot-case@3.0.4";
        "dot-prop@5.3.0" = f "dot-prop" "5.3.0" y "90ccce708cd9cd82cc4dc8c3ddd9abdd55b20e88" [
          (s."is-obj@^2.0.0")
          ];
        "dot-prop@^5.2.0" = s."dot-prop@5.3.0";
        "dotenv-expand@5.1.0" = f "dotenv-expand" "5.1.0" y "3fbaf020bfd794884072ea26b1e9791d45a629f0" [];
        "dotenv-expand@^5.1.0" = s."dotenv-expand@5.1.0";
        "dotenv@10.0.0" = f "dotenv" "10.0.0" y "3d4227b8fb95f81096cdd2b66653fb2c7085ba81" [];
        "dotenv@8.6.0" = f "dotenv" "8.6.0" y "061af664d19f7f4d8fc6e4ff9b584ce237adcb8b" [];
        "dotenv@^10.0.0" = s."dotenv@10.0.0";
        "dotenv@^8.0.0" = s."dotenv@8.6.0";
        "duplexer3@0.1.4" = f "duplexer3" "0.1.4" y "ee01dd1cac0ed3cbc7fdbea37dc0a8f1ce002ce2" [];
        "duplexer3@^0.1.4" = s."duplexer3@0.1.4";
        "duplexer@0.1.2" = f "duplexer" "0.1.2" y "3abe43aef3835f8ae077d136ddce0f276b0400e6" [];
        "duplexer@^0.1.2" = s."duplexer@0.1.2";
        "duplexify@3.7.1" = f "duplexify" "3.7.1" y "2a4df5317f6ccfd91f86d6fd25d8d8a103b88309" [
          (s."end-of-stream@^1.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.0")
          (s."stream-shift@^1.0.0")
          ];
        "duplexify@^3.4.2" = s."duplexify@3.7.1";
        "duplexify@^3.6.0" = s."duplexify@3.7.1";
        "eastasianwidth@0.2.0" = f "eastasianwidth" "0.2.0" y "696ce2ec0aa0e6ea93a397ffcf24aa7840c827cb" [];
        "eastasianwidth@^0.2.0" = s."eastasianwidth@0.2.0";
        "ee-first@1.1.1" = f "ee-first" "1.1.1" y "590c61156b0ae2f4f0255732a158b266bc56b21d" [];
        "ejs@3.1.8" = f "ejs" "3.1.8" y "758d32910c78047585c7ef1f92f9ee041c1c190b" [
          (s."jake@^10.8.5")
          ];
        "ejs@^3.1.6" = s."ejs@3.1.8";
        "electron-to-chromium@1.4.166" = f "electron-to-chromium" "1.4.166" y "83cd596e59c1a192425b99e6ecc64d9ffff50aff" [];
        "electron-to-chromium@^1.4.164" = s."electron-to-chromium@1.4.166";
        "elliptic@6.5.4" = f "elliptic" "6.5.4" y "da37cebd31e79a1367e941b592ed1fbebd58abbb" [
          (s."bn.js@^4.11.9")
          (s."brorand@^1.1.0")
          (s."hash.js@^1.0.0")
          (s."hmac-drbg@^1.0.1")
          (s."inherits@^2.0.4")
          (s."minimalistic-assert@^1.0.1")
          (s."minimalistic-crypto-utils@^1.0.1")
          ];
        "elliptic@^6.5.3" = s."elliptic@6.5.4";
        "emittery@0.10.2" = f "emittery" "0.10.2" y "902eec8aedb8c41938c46e9385e9db7e03182933" [];
        "emittery@0.8.1" = f "emittery" "0.8.1" y "bb23cc86d03b30aa75a7f734819dee2e1ba70860" [];
        "emittery@^0.10.2" = s."emittery@0.10.2";
        "emittery@^0.8.1" = s."emittery@0.8.1";
        "emoji-regex@8.0.0" = f "emoji-regex" "8.0.0" y "e818fd69ce5ccfcb404594f842963bf53164cc37" [];
        "emoji-regex@9.2.2" = f "emoji-regex" "9.2.2" y "840c8803b0d8047f4ff0cf963176b32d4ef3ed72" [];
        "emoji-regex@^8.0.0" = s."emoji-regex@8.0.0";
        "emoji-regex@^9.2.2" = s."emoji-regex@9.2.2";
        "emojis-list@3.0.0" = f "emojis-list" "3.0.0" y "5570662046ad29e2e916e71aae260abdff4f6a78" [];
        "emojis-list@^3.0.0" = s."emojis-list@3.0.0";
        "emoticon@3.2.0" = f "emoticon" "3.2.0" y "c008ca7d7620fac742fe1bf4af8ff8fed154ae7f" [];
        "emoticon@^3.2.0" = s."emoticon@3.2.0";
        "encodeurl@1.0.2" = f "encodeurl" "1.0.2" y "ad3ff4c86ec2d029322f5a02c3a9a606c95b3f59" [];
        "encodeurl@~1.0.2" = s."encodeurl@1.0.2";
        "end-of-stream@1.4.4" = f "end-of-stream" "1.4.4" y "5ae64a5f45057baf3626ec14da0ca5e4b2431eb0" [
          (s."once@^1.4.0")
          ];
        "end-of-stream@^1.0.0" = s."end-of-stream@1.4.4";
        "end-of-stream@^1.1.0" = s."end-of-stream@1.4.4";
        "endent@2.1.0" = f "endent" "2.1.0" y "5aaba698fb569e5e18e69e1ff7a28ff35373cd88" [
          (s."dedent@^0.7.0")
          (s."fast-json-parse@^1.0.3")
          (s."objectorarray@^1.0.5")
          ];
        "endent@^2.0.1" = s."endent@2.1.0";
        "enhanced-resolve@4.5.0" = f "enhanced-resolve" "4.5.0" y "2f3cfd84dbe3b487f18f2db2ef1e064a571ca5ec" [
          (s."graceful-fs@^4.1.2")
          (s."memory-fs@^0.5.0")
          (s."tapable@^1.0.0")
          ];
        "enhanced-resolve@5.10.0" = f "enhanced-resolve" "5.10.0" y "0dc579c3bb2a1032e357ac45b8f3a6f3ad4fb1e6" [
          (s."graceful-fs@^4.2.4")
          (s."tapable@^2.2.0")
          ];
        "enhanced-resolve@^4.5.0" = s."enhanced-resolve@4.5.0";
        "enhanced-resolve@^5.0.0" = s."enhanced-resolve@5.10.0";
        "enhanced-resolve@^5.10.0" = s."enhanced-resolve@5.10.0";
        "enhanced-resolve@^5.7.0" = s."enhanced-resolve@5.10.0";
        "entities@1.1.2" = f "entities" "1.1.2" y "bdfa735299664dfafd34529ed4f8522a275fea56" [];
        "entities@2.2.0" = f "entities" "2.2.0" y "098dc90ebb83d8dffa089d55256b351d34c4da55" [];
        "entities@3.0.1" = f "entities" "3.0.1" y "2b887ca62585e96db3903482d336c1006c3001d4" [];
        "entities@4.3.0" = f "entities" "4.3.0" y "62915f08d67353bb4eb67e3d62641a4059aec656" [];
        "entities@^2.0.0" = s."entities@2.2.0";
        "entities@^3.0.1" = s."entities@3.0.1";
        "entities@^4.2.0" = s."entities@4.3.0";
        "entities@^4.3.0" = s."entities@4.3.0";
        "entities@~1.1.1" = s."entities@1.1.2";
        "envinfo@7.8.1" = f "envinfo" "7.8.1" y "06377e3e5f4d379fea7ac592d5ad8927e0c4d475" [];
        "envinfo@^7.7.3" = s."envinfo@7.8.1";
        "errno@0.1.8" = f "errno" "0.1.8" y "8bb3e9c7d463be4976ff888f76b4809ebc2e811f" [
          (s."prr@~1.0.1")
          ];
        "errno@^0.1.3" = s."errno@0.1.8";
        "errno@~0.1.7" = s."errno@0.1.8";
        "error-ex@1.3.2" = f "error-ex" "1.3.2" y "b4ac40648107fdcdcfae242f428bea8a14d4f1bf" [
          (s."is-arrayish@^0.2.1")
          ];
        "error-ex@^1.2.0" = s."error-ex@1.3.2";
        "error-ex@^1.3.1" = s."error-ex@1.3.2";
        "error-stack-parser@2.1.4" = f "error-stack-parser" "2.1.4" y "229cb01cdbfa84440bfa91876285b94680188286" [
          (s."stackframe@^1.3.4")
          ];
        "error-stack-parser@^2.0.6" = s."error-stack-parser@2.1.4";
        "es-abstract@1.20.1" = f "es-abstract" "1.20.1" y "027292cd6ef44bd12b1913b828116f54787d1814" [
          (s."call-bind@^1.0.2")
          (s."es-to-primitive@^1.2.1")
          (s."function-bind@^1.1.1")
          (s."get-intrinsic@^1.1.1")
          (s."get-symbol-description@^1.0.0")
          (s."has@^1.0.3")
          (s."has-property-descriptors@^1.0.0")
          (s."has-symbols@^1.0.3")
          (s."internal-slot@^1.0.3")
          (s."is-callable@^1.2.4")
          (s."is-negative-zero@^2.0.2")
          (s."is-regex@^1.1.4")
          (s."is-shared-array-buffer@^1.0.2")
          (s."is-string@^1.0.7")
          (s."is-weakref@^1.0.2")
          (s."object-inspect@^1.12.0")
          (s."object-keys@^1.1.1")
          (s."object.assign@^4.1.2")
          (s."regexp.prototype.flags@^1.4.3")
          (s."string.prototype.trimend@^1.0.5")
          (s."string.prototype.trimstart@^1.0.5")
          (s."unbox-primitive@^1.0.2")
          ];
        "es-abstract@^1.17.2" = s."es-abstract@1.20.1";
        "es-abstract@^1.19.0" = s."es-abstract@1.20.1";
        "es-abstract@^1.19.1" = s."es-abstract@1.20.1";
        "es-abstract@^1.19.2" = s."es-abstract@1.20.1";
        "es-abstract@^1.19.5" = s."es-abstract@1.20.1";
        "es-abstract@^1.20.1" = s."es-abstract@1.20.1";
        "es-array-method-boxes-properly@1.0.0" = f "es-array-method-boxes-properly" "1.0.0" y "873f3e84418de4ee19c5be752990b2e44718d09e" [];
        "es-array-method-boxes-properly@^1.0.0" = s."es-array-method-boxes-properly@1.0.0";
        "es-get-iterator@1.1.2" = f "es-get-iterator" "1.1.2" y "9234c54aba713486d7ebde0220864af5e2b283f7" [
          (s."call-bind@^1.0.2")
          (s."get-intrinsic@^1.1.0")
          (s."has-symbols@^1.0.1")
          (s."is-arguments@^1.1.0")
          (s."is-map@^2.0.2")
          (s."is-set@^2.0.2")
          (s."is-string@^1.0.5")
          (s."isarray@^2.0.5")
          ];
        "es-get-iterator@^1.0.2" = s."es-get-iterator@1.1.2";
        "es-module-lexer@0.9.3" = f "es-module-lexer" "0.9.3" y "6f13db00cc38417137daf74366f535c8eb438f19" [];
        "es-module-lexer@^0.9.0" = s."es-module-lexer@0.9.3";
        "es-shim-unscopables@1.0.0" = f "es-shim-unscopables" "1.0.0" y "702e632193201e3edf8713635d083d378e510241" [
          (s."has@^1.0.3")
          ];
        "es-shim-unscopables@^1.0.0" = s."es-shim-unscopables@1.0.0";
        "es-to-primitive@1.2.1" = f "es-to-primitive" "1.2.1" y "e55cd4c9cdc188bcefb03b366c736323fc5c898a" [
          (s."is-callable@^1.1.4")
          (s."is-date-object@^1.0.1")
          (s."is-symbol@^1.0.2")
          ];
        "es-to-primitive@^1.2.1" = s."es-to-primitive@1.2.1";
        "es5-shim@4.6.7" = f "es5-shim" "4.6.7" y "bc67ae0fc3dd520636e0a1601cc73b450ad3e955" [];
        "es5-shim@^4.5.13" = s."es5-shim@4.6.7";
        "es6-error@4.1.1" = f "es6-error" "4.1.1" y "9e3af407459deed47e9a91f9b885a84eb05c561d" [];
        "es6-error@^4.0.1" = s."es6-error@4.1.1";
        "es6-shim@0.35.6" = f "es6-shim" "0.35.6" y "d10578301a83af2de58b9eadb7c2c9945f7388a0" [];
        "es6-shim@^0.35.5" = s."es6-shim@0.35.6";
        "escalade@3.1.1" = f "escalade" "3.1.1" y "d8cfdc7000965c5a0174b4a82eaa5c0552742e40" [];
        "escalade@^3.1.1" = s."escalade@3.1.1";
        "escape-goat@2.1.1" = f "escape-goat" "2.1.1" y "1b2dc77003676c457ec760b2dc68edb648188675" [];
        "escape-goat@^2.0.0" = s."escape-goat@2.1.1";
        "escape-html@1.0.3" = f "escape-html" "1.0.3" y "0258eae4d3d0c0974de1c169188ef0051d1d1988" [];
        "escape-html@^1.0.3" = s."escape-html@1.0.3";
        "escape-html@~1.0.3" = s."escape-html@1.0.3";
        "escape-latex@1.2.0" = f "escape-latex" "1.2.0" y "07c03818cf7dac250cce517f4fda1b001ef2bca1" [];
        "escape-latex@^1.2.0" = s."escape-latex@1.2.0";
        "escape-string-regexp@1.0.5" = f "escape-string-regexp" "1.0.5" y "1b61c0562190a8dff6ae3bb2cf0200ca130b86d4" [];
        "escape-string-regexp@2.0.0" = f "escape-string-regexp" "2.0.0" y "a30304e99daa32e23b2fd20f51babd07cffca344" [];
        "escape-string-regexp@4.0.0" = f "escape-string-regexp" "4.0.0" y "14ba83a5d373e3d311e5afca29cf5bfad965bf34" [];
        "escape-string-regexp@^1.0.2" = s."escape-string-regexp@1.0.5";
        "escape-string-regexp@^1.0.5" = s."escape-string-regexp@1.0.5";
        "escape-string-regexp@^2.0.0" = s."escape-string-regexp@2.0.0";
        "escape-string-regexp@^4.0.0" = s."escape-string-regexp@4.0.0";
        "escodegen@2.0.0" = f "escodegen" "2.0.0" y "5e32b12833e8aa8fa35e1bf0befa89380484c7dd" [
          (s."esprima@^4.0.1")
          (s."estraverse@^5.2.0")
          (s."esutils@^2.0.2")
          (s."optionator@^0.8.1")
          (s."source-map@~0.6.1")
          ];
        "escodegen@^2.0.0" = s."escodegen@2.0.0";
        "eslint-config-react-app@7.0.1" = f "eslint-config-react-app" "7.0.1" y "73ba3929978001c5c86274c017ea57eb5fa644b4" [
          (s."@babel/core@^7.16.0")
          (s."@babel/eslint-parser@^7.16.3")
          (s."@rushstack/eslint-patch@^1.1.0")
          (s."@typescript-eslint/eslint-plugin@^5.5.0")
          (s."@typescript-eslint/parser@^5.5.0")
          (s."babel-preset-react-app@^10.0.1")
          (s."confusing-browser-globals@^1.0.11")
          (s."eslint-plugin-flowtype@^8.0.3")
          (s."eslint-plugin-import@^2.25.3")
          (s."eslint-plugin-jest@^25.3.0")
          (s."eslint-plugin-jsx-a11y@^6.5.1")
          (s."eslint-plugin-react@^7.27.1")
          (s."eslint-plugin-react-hooks@^4.3.0")
          (s."eslint-plugin-testing-library@^5.0.1")
          ];
        "eslint-config-react-app@^7.0.1" = s."eslint-config-react-app@7.0.1";
        "eslint-import-resolver-node@0.3.6" = f "eslint-import-resolver-node" "0.3.6" y "4048b958395da89668252001dbd9eca6b83bacbd" [
          (s."debug@^3.2.7")
          (s."resolve@^1.20.0")
          ];
        "eslint-import-resolver-node@^0.3.6" = s."eslint-import-resolver-node@0.3.6";
        "eslint-module-utils@2.7.3" = f "eslint-module-utils" "2.7.3" y "ad7e3a10552fdd0642e1e55292781bd6e34876ee" [
          (s."debug@^3.2.7")
          (s."find-up@^2.1.0")
          ];
        "eslint-module-utils@^2.7.3" = s."eslint-module-utils@2.7.3";
        "eslint-plugin-flowtype@8.0.3" = f "eslint-plugin-flowtype" "8.0.3" y "e1557e37118f24734aa3122e7536a038d34a4912" [
          (s."lodash@^4.17.21")
          (s."string-natural-compare@^3.0.1")
          ];
        "eslint-plugin-flowtype@^8.0.3" = s."eslint-plugin-flowtype@8.0.3";
        "eslint-plugin-import@2.26.0" = f "eslint-plugin-import" "2.26.0" y "f812dc47be4f2b72b478a021605a59fc6fe8b88b" [
          (s."array-includes@^3.1.4")
          (s."array.prototype.flat@^1.2.5")
          (s."debug@^2.6.9")
          (s."doctrine@^2.1.0")
          (s."eslint-import-resolver-node@^0.3.6")
          (s."eslint-module-utils@^2.7.3")
          (s."has@^1.0.3")
          (s."is-core-module@^2.8.1")
          (s."is-glob@^4.0.3")
          (s."minimatch@^3.1.2")
          (s."object.values@^1.1.5")
          (s."resolve@^1.22.0")
          (s."tsconfig-paths@^3.14.1")
          ];
        "eslint-plugin-import@^2.25.3" = s."eslint-plugin-import@2.26.0";
        "eslint-plugin-jest@25.7.0" = f "eslint-plugin-jest" "25.7.0" y "ff4ac97520b53a96187bad9c9814e7d00de09a6a" [
          (s."@typescript-eslint/experimental-utils@^5.0.0")
          ];
        "eslint-plugin-jest@^25.3.0" = s."eslint-plugin-jest@25.7.0";
        "eslint-plugin-jsx-a11y@6.5.1" = f "eslint-plugin-jsx-a11y" "6.5.1" y "cdbf2df901040ca140b6ec14715c988889c2a6d8" [
          (s."@babel/runtime@^7.16.3")
          (s."aria-query@^4.2.2")
          (s."array-includes@^3.1.4")
          (s."ast-types-flow@^0.0.7")
          (s."axe-core@^4.3.5")
          (s."axobject-query@^2.2.0")
          (s."damerau-levenshtein@^1.0.7")
          (s."emoji-regex@^9.2.2")
          (s."has@^1.0.3")
          (s."jsx-ast-utils@^3.2.1")
          (s."language-tags@^1.0.5")
          (s."minimatch@^3.0.4")
          ];
        "eslint-plugin-jsx-a11y@^6.5.1" = s."eslint-plugin-jsx-a11y@6.5.1";
        "eslint-plugin-react-hooks@4.6.0" = f "eslint-plugin-react-hooks" "4.6.0" y "4c3e697ad95b77e93f8646aaa1630c1ba607edd3" [];
        "eslint-plugin-react-hooks@^4.3.0" = s."eslint-plugin-react-hooks@4.6.0";
        "eslint-plugin-react@7.30.0" = f "eslint-plugin-react" "7.30.0" y "8e7b1b2934b8426ac067a0febade1b13bd7064e3" [
          (s."array-includes@^3.1.5")
          (s."array.prototype.flatmap@^1.3.0")
          (s."doctrine@^2.1.0")
          (s."estraverse@^5.3.0")
          (s."jsx-ast-utils@^2.4.1 || ^3.0.0")
          (s."minimatch@^3.1.2")
          (s."object.entries@^1.1.5")
          (s."object.fromentries@^2.0.5")
          (s."object.hasown@^1.1.1")
          (s."object.values@^1.1.5")
          (s."prop-types@^15.8.1")
          (s."resolve@^2.0.0-next.3")
          (s."semver@^6.3.0")
          (s."string.prototype.matchall@^4.0.7")
          ];
        "eslint-plugin-react@^7.27.1" = s."eslint-plugin-react@7.30.0";
        "eslint-plugin-testing-library@5.5.1" = f "eslint-plugin-testing-library" "5.5.1" y "6fe602f9082a421b471bbae8aed692e26fe981b3" [
          (s."@typescript-eslint/utils@^5.13.0")
          ];
        "eslint-plugin-testing-library@^5.0.1" = s."eslint-plugin-testing-library@5.5.1";
        "eslint-scope@4.0.3" = f "eslint-scope" "4.0.3" y "ca03833310f6889a3264781aa82e63eb9cfe7848" [
          (s."esrecurse@^4.1.0")
          (s."estraverse@^4.1.1")
          ];
        "eslint-scope@5.1.1" = f "eslint-scope" "5.1.1" y "e786e59a66cb92b3f6c1fb0d508aab174848f48c" [
          (s."esrecurse@^4.3.0")
          (s."estraverse@^4.1.1")
          ];
        "eslint-scope@7.1.1" = f "eslint-scope" "7.1.1" y "fff34894c2f65e5226d3041ac480b4513a163642" [
          (s."esrecurse@^4.3.0")
          (s."estraverse@^5.2.0")
          ];
        "eslint-scope@^4.0.3" = s."eslint-scope@4.0.3";
        "eslint-scope@^5.1.1" = s."eslint-scope@5.1.1";
        "eslint-scope@^7.1.1" = s."eslint-scope@7.1.1";
        "eslint-utils@3.0.0" = f "eslint-utils" "3.0.0" y "8aebaface7345bb33559db0a1f13a1d2d48c3672" [
          (s."eslint-visitor-keys@^2.0.0")
          ];
        "eslint-utils@^3.0.0" = s."eslint-utils@3.0.0";
        "eslint-visitor-keys@2.1.0" = f "eslint-visitor-keys" "2.1.0" y "f65328259305927392c938ed44eb0a5c9b2bd303" [];
        "eslint-visitor-keys@3.3.0" = f "eslint-visitor-keys" "3.3.0" y "f6480fa6b1f30efe2d1968aa8ac745b862469826" [];
        "eslint-visitor-keys@^2.0.0" = s."eslint-visitor-keys@2.1.0";
        "eslint-visitor-keys@^2.1.0" = s."eslint-visitor-keys@2.1.0";
        "eslint-visitor-keys@^3.3.0" = s."eslint-visitor-keys@3.3.0";
        "eslint-webpack-plugin@3.1.1" = f "eslint-webpack-plugin" "3.1.1" y "83dad2395e5f572d6f4d919eedaa9cf902890fcb" [
          (s."@types/eslint@^7.28.2")
          (s."jest-worker@^27.3.1")
          (s."micromatch@^4.0.4")
          (s."normalize-path@^3.0.0")
          (s."schema-utils@^3.1.1")
          ];
        "eslint-webpack-plugin@^3.1.1" = s."eslint-webpack-plugin@3.1.1";
        "eslint@8.21.0" = f "eslint" "8.21.0" y "1940a68d7e0573cef6f50037addee295ff9be9ef" [
          (s."@eslint/eslintrc@^1.3.0")
          (s."@humanwhocodes/config-array@^0.10.4")
          (s."@humanwhocodes/gitignore-to-minimatch@^1.0.2")
          (s."ajv@^6.10.0")
          (s."chalk@^4.0.0")
          (s."cross-spawn@^7.0.2")
          (s."debug@^4.3.2")
          (s."doctrine@^3.0.0")
          (s."escape-string-regexp@^4.0.0")
          (s."eslint-scope@^7.1.1")
          (s."eslint-utils@^3.0.0")
          (s."eslint-visitor-keys@^3.3.0")
          (s."espree@^9.3.3")
          (s."esquery@^1.4.0")
          (s."esutils@^2.0.2")
          (s."fast-deep-equal@^3.1.3")
          (s."file-entry-cache@^6.0.1")
          (s."find-up@^5.0.0")
          (s."functional-red-black-tree@^1.0.1")
          (s."glob-parent@^6.0.1")
          (s."globals@^13.15.0")
          (s."globby@^11.1.0")
          (s."grapheme-splitter@^1.0.4")
          (s."ignore@^5.2.0")
          (s."import-fresh@^3.0.0")
          (s."imurmurhash@^0.1.4")
          (s."is-glob@^4.0.0")
          (s."js-yaml@^4.1.0")
          (s."json-stable-stringify-without-jsonify@^1.0.1")
          (s."levn@^0.4.1")
          (s."lodash.merge@^4.6.2")
          (s."minimatch@^3.1.2")
          (s."natural-compare@^1.4.0")
          (s."optionator@^0.9.1")
          (s."regexpp@^3.2.0")
          (s."strip-ansi@^6.0.1")
          (s."strip-json-comments@^3.1.0")
          (s."text-table@^0.2.0")
          (s."v8-compile-cache@^2.0.3")
          ];
        "eslint@^8.21.0" = s."eslint@8.21.0";
        "eslint@^8.3.0" = s."eslint@8.21.0";
        "espree@9.3.3" = f "espree" "9.3.3" y "2dd37c4162bb05f433ad3c1a52ddf8a49dc08e9d" [
          (s."acorn@^8.8.0")
          (s."acorn-jsx@^5.3.2")
          (s."eslint-visitor-keys@^3.3.0")
          ];
        "espree@^9.3.2" = s."espree@9.3.3";
        "espree@^9.3.3" = s."espree@9.3.3";
        "esprima@4.0.1" = f "esprima" "4.0.1" y "13b04cdb3e6c5d19df91ab6987a8695619b0aa71" [];
        "esprima@^4.0.0" = s."esprima@4.0.1";
        "esprima@^4.0.1" = s."esprima@4.0.1";
        "esquery@1.4.0" = f "esquery" "1.4.0" y "2148ffc38b82e8c7057dfed48425b3e61f0f24a5" [
          (s."estraverse@^5.1.0")
          ];
        "esquery@^1.4.0" = s."esquery@1.4.0";
        "esrecurse@4.3.0" = f "esrecurse" "4.3.0" y "7ad7964d679abb28bee72cec63758b1c5d2c9921" [
          (s."estraverse@^5.2.0")
          ];
        "esrecurse@^4.1.0" = s."esrecurse@4.3.0";
        "esrecurse@^4.3.0" = s."esrecurse@4.3.0";
        "estraverse@4.3.0" = f "estraverse" "4.3.0" y "398ad3f3c5a24948be7725e83d11a7de28cdbd1d" [];
        "estraverse@5.3.0" = f "estraverse" "5.3.0" y "2eea5290702f26ab8fe5370370ff86c965d21123" [];
        "estraverse@^4.1.1" = s."estraverse@4.3.0";
        "estraverse@^5.1.0" = s."estraverse@5.3.0";
        "estraverse@^5.2.0" = s."estraverse@5.3.0";
        "estraverse@^5.3.0" = s."estraverse@5.3.0";
        "estree-to-babel@3.2.1" = f "estree-to-babel" "3.2.1" y "82e78315275c3ca74475fdc8ac1a5103c8a75bf5" [
          (s."@babel/traverse@^7.1.6")
          (s."@babel/types@^7.2.0")
          (s."c8@^7.6.0")
          ];
        "estree-to-babel@^3.1.0" = s."estree-to-babel@3.2.1";
        "estree-walker@1.0.1" = f "estree-walker" "1.0.1" y "31bc5d612c96b704106b477e6dd5d8aa138cb700" [];
        "estree-walker@^1.0.1" = s."estree-walker@1.0.1";
        "esutils@2.0.3" = f "esutils" "2.0.3" y "74d2eb4de0b8da1293711910d50775b9b710ef64" [];
        "esutils@^2.0.2" = s."esutils@2.0.3";
        "eta@1.12.3" = f "eta" "1.12.3" y "2982d08adfbef39f9fa50e2fbd42d7337e7338b1" [];
        "eta@^1.12.3" = s."eta@1.12.3";
        "etag@1.8.1" = f "etag" "1.8.1" y "41ae2eeb65efa62268aebfea83ac7d79299b0887" [];
        "etag@~1.8.1" = s."etag@1.8.1";
        "eval@0.1.8" = f "eval" "0.1.8" y "2b903473b8cc1d1989b83a1e7923f883eb357f85" [
          (s."@types/node@*")
          (s."require-like@>= 0.1.1")
          ];
        "eval@^0.1.8" = s."eval@0.1.8";
        "eventemitter3@4.0.7" = f "eventemitter3" "4.0.7" y "2de9b68f6528d5644ef5c59526a1b4a07306169f" [];
        "eventemitter3@^4.0.0" = s."eventemitter3@4.0.7";
        "events@3.3.0" = f "events" "3.3.0" y "31a95ad0a924e2d2c419a813aeb2c4e878ea7400" [];
        "events@^3.0.0" = s."events@3.3.0";
        "events@^3.2.0" = s."events@3.3.0";
        "evp_bytestokey@1.0.3" = f "evp_bytestokey" "1.0.3" y "7fcbdb198dc71959432efe13842684e0525acb02" [
          (s."md5.js@^1.3.4")
          (s."safe-buffer@^5.1.1")
          ];
        "evp_bytestokey@^1.0.0" = s."evp_bytestokey@1.0.3";
        "evp_bytestokey@^1.0.3" = s."evp_bytestokey@1.0.3";
        "exec-sh@0.3.6" = f "exec-sh" "0.3.6" y "ff264f9e325519a60cb5e273692943483cca63bc" [];
        "exec-sh@^0.3.2" = s."exec-sh@0.3.6";
        "execa@1.0.0" = f "execa" "1.0.0" y "c6236a5bb4df6d6f15e88e7f017798216749ddd8" [
          (s."cross-spawn@^6.0.0")
          (s."get-stream@^4.0.0")
          (s."is-stream@^1.1.0")
          (s."npm-run-path@^2.0.0")
          (s."p-finally@^1.0.0")
          (s."signal-exit@^3.0.0")
          (s."strip-eof@^1.0.0")
          ];
        "execa@5.1.1" = f "execa" "5.1.1" y "f80ad9cbf4298f7bd1d4c9555c21e93741c411dd" [
          (s."cross-spawn@^7.0.3")
          (s."get-stream@^6.0.0")
          (s."human-signals@^2.1.0")
          (s."is-stream@^2.0.0")
          (s."merge-stream@^2.0.0")
          (s."npm-run-path@^4.0.1")
          (s."onetime@^5.1.2")
          (s."signal-exit@^3.0.3")
          (s."strip-final-newline@^2.0.0")
          ];
        "execa@^1.0.0" = s."execa@1.0.0";
        "execa@^5.0.0" = s."execa@5.1.1";
        "execa@^5.1.1" = s."execa@5.1.1";
        "exit@0.1.2" = f "exit" "0.1.2" y "0632638f8d877cc82107d30a0fff1a17cba1cd0c" [];
        "exit@^0.1.2" = s."exit@0.1.2";
        "expand-brackets@2.1.4" = f "expand-brackets" "2.1.4" y "b77735e315ce30f6b6eff0f83b04151a22449622" [
          (s."debug@^2.3.3")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."posix-character-classes@^0.1.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "expand-brackets@^2.1.4" = s."expand-brackets@2.1.4";
        "expect@27.5.1" = f "expect" "27.5.1" y "83ce59f1e5bdf5f9d2b94b61d2050db48f3fef74" [
          (s."@jest/types@^27.5.1")
          (s."jest-get-type@^27.5.1")
          (s."jest-matcher-utils@^27.5.1")
          (s."jest-message-util@^27.5.1")
          ];
        "expect@^27.5.1" = s."expect@27.5.1";
        "express@4.18.1" = f "express" "4.18.1" y "7797de8b9c72c857b9cd0e14a5eea80666267caf" [
          (s."accepts@~1.3.8")
          (s."array-flatten@1.1.1")
          (s."body-parser@1.20.0")
          (s."content-disposition@0.5.4")
          (s."content-type@~1.0.4")
          (s."cookie@0.5.0")
          (s."cookie-signature@1.0.6")
          (s."debug@2.6.9")
          (s."depd@2.0.0")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."finalhandler@1.2.0")
          (s."fresh@0.5.2")
          (s."http-errors@2.0.0")
          (s."merge-descriptors@1.0.1")
          (s."methods@~1.1.2")
          (s."on-finished@2.4.1")
          (s."parseurl@~1.3.3")
          (s."path-to-regexp@0.1.7")
          (s."proxy-addr@~2.0.7")
          (s."qs@6.10.3")
          (s."range-parser@~1.2.1")
          (s."safe-buffer@5.2.1")
          (s."send@0.18.0")
          (s."serve-static@1.15.0")
          (s."setprototypeof@1.2.0")
          (s."statuses@2.0.1")
          (s."type-is@~1.6.18")
          (s."utils-merge@1.0.1")
          (s."vary@~1.1.2")
          ];
        "express@^4.17.1" = s."express@4.18.1";
        "express@^4.17.3" = s."express@4.18.1";
        "extend-shallow@2.0.1" = f "extend-shallow" "2.0.1" y "51af7d614ad9a9f610ea1bafbb989d6b1c56890f" [
          (s."is-extendable@^0.1.0")
          ];
        "extend-shallow@3.0.2" = f "extend-shallow" "3.0.2" y "26a71aaf073b39fb2127172746131c2704028db8" [
          (s."assign-symbols@^1.0.0")
          (s."is-extendable@^1.0.1")
          ];
        "extend-shallow@^2.0.1" = s."extend-shallow@2.0.1";
        "extend-shallow@^3.0.0" = s."extend-shallow@3.0.2";
        "extend-shallow@^3.0.2" = s."extend-shallow@3.0.2";
        "extend@3.0.2" = f "extend" "3.0.2" y "f8b1136b4071fbd8eb140aff858b1019ec2915fa" [];
        "extend@^3.0.0" = s."extend@3.0.2";
        "extglob@2.0.4" = f "extglob" "2.0.4" y "ad00fe4dc612a9232e8718711dc5cb5ab0285543" [
          (s."array-unique@^0.3.2")
          (s."define-property@^1.0.0")
          (s."expand-brackets@^2.1.4")
          (s."extend-shallow@^2.0.1")
          (s."fragment-cache@^0.2.1")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "extglob@^2.0.4" = s."extglob@2.0.4";
        "fast-check@2.25.0" = f "fast-check" "2.25.0" y "5146601851bf3be0953bd17eb2b7d547936c6561" [
          (s."pure-rand@^5.0.1")
          ];
        "fast-check@3.1.1" = f "fast-check" "3.1.1" y "72c5ae7022a4e86504762e773adfb8a5b0b01252" [
          (s."pure-rand@^5.0.1")
          ];
        "fast-check@^2.17.0" = s."fast-check@2.25.0";
        "fast-check@^3.1.1" = s."fast-check@3.1.1";
        "fast-deep-equal@3.1.3" = f "fast-deep-equal" "3.1.3" y "3a7d56b559d6cbc3eb512325244e619a65c6c525" [];
        "fast-deep-equal@^3.1.1" = s."fast-deep-equal@3.1.3";
        "fast-deep-equal@^3.1.3" = s."fast-deep-equal@3.1.3";
        "fast-deep-equal@~3.1.3" = s."fast-deep-equal@3.1.3";
        "fast-glob@2.2.7" = f "fast-glob" "2.2.7" y "6953857c3afa475fff92ee6015d52da70a4cd39d" [
          (s."@mrmlnc/readdir-enhanced@^2.2.1")
          (s."@nodelib/fs.stat@^1.1.2")
          (s."glob-parent@^3.1.0")
          (s."is-glob@^4.0.0")
          (s."merge2@^1.2.3")
          (s."micromatch@^3.1.10")
          ];
        "fast-glob@3.2.11" = f "fast-glob" "3.2.11" y "a1172ad95ceb8a16e20caa5c5e56480e5129c1d9" [
          (s."@nodelib/fs.stat@^2.0.2")
          (s."@nodelib/fs.walk@^1.2.3")
          (s."glob-parent@^5.1.2")
          (s."merge2@^1.3.0")
          (s."micromatch@^4.0.4")
          ];
        "fast-glob@^2.2.6" = s."fast-glob@2.2.7";
        "fast-glob@^3.2.11" = s."fast-glob@3.2.11";
        "fast-glob@^3.2.9" = s."fast-glob@3.2.11";
        "fast-json-parse@1.0.3" = f "fast-json-parse" "1.0.3" y "43e5c61ee4efa9265633046b770fb682a7577c4d" [];
        "fast-json-parse@^1.0.3" = s."fast-json-parse@1.0.3";
        "fast-json-patch@3.1.1" = f "fast-json-patch" "3.1.1" y "85064ea1b1ebf97a3f7ad01e23f9337e72c66947" [];
        "fast-json-patch@^3.1.1" = s."fast-json-patch@3.1.1";
        "fast-json-stable-stringify@2.1.0" = f "fast-json-stable-stringify" "2.1.0" y "874bf69c6f404c2b5d99c481341399fd55892633" [];
        "fast-json-stable-stringify@2.x" = s."fast-json-stable-stringify@2.1.0";
        "fast-json-stable-stringify@^2.0.0" = s."fast-json-stable-stringify@2.1.0";
        "fast-json-stable-stringify@^2.1.0" = s."fast-json-stable-stringify@2.1.0";
        "fast-json-stable-stringify@~2.1.0" = s."fast-json-stable-stringify@2.1.0";
        "fast-levenshtein@2.0.6" = f "fast-levenshtein" "2.0.6" y "3d8a5c66883a16a30ca8643e851f19baa7797917" [];
        "fast-levenshtein@^2.0.6" = s."fast-levenshtein@2.0.6";
        "fast-levenshtein@~2.0.6" = s."fast-levenshtein@2.0.6";
        "fast-shallow-equal@1.0.0" = f "fast-shallow-equal" "1.0.0" y "d4dcaf6472440dcefa6f88b98e3251e27f25628b" [];
        "fast-shallow-equal@^1.0.0" = s."fast-shallow-equal@1.0.0";
        "fast-url-parser@1.1.3" = f "fast-url-parser" "1.1.3" y "f4af3ea9f34d8a271cf58ad2b3759f431f0b318d" [
          (s."punycode@^1.3.2")
          ];
        "fast-url-parser@^1.1.3" = s."fast-url-parser@1.1.3";
        "fastest-levenshtein@1.0.12" = f "fastest-levenshtein" "1.0.12" y "9990f7d3a88cc5a9ffd1f1745745251700d497e2" [];
        "fastest-levenshtein@^1.0.12" = s."fastest-levenshtein@1.0.12";
        "fastest-stable-stringify@2.0.2" = f "fastest-stable-stringify" "2.0.2" y "3757a6774f6ec8de40c4e86ec28ea02417214c76" [];
        "fastest-stable-stringify@^2.0.2" = s."fastest-stable-stringify@2.0.2";
        "fastq@1.13.0" = f "fastq" "1.13.0" y "616760f88a7526bdfc596b7cab8c18938c36b98c" [
          (s."reusify@^1.0.4")
          ];
        "fastq@^1.6.0" = s."fastq@1.13.0";
        "fault@1.0.4" = f "fault" "1.0.4" y "eafcfc0a6d214fc94601e170df29954a4f842f13" [
          (s."format@^0.2.0")
          ];
        "fault@^1.0.0" = s."fault@1.0.4";
        "faye-websocket@0.11.4" = f "faye-websocket" "0.11.4" y "7f0d9275cfdd86a1c963dc8b65fcc451edcbb1da" [
          (s."websocket-driver@>=0.5.1")
          ];
        "faye-websocket@^0.11.3" = s."faye-websocket@0.11.4";
        "fb-watchman@2.0.1" = f "fb-watchman" "2.0.1" y "fc84fb39d2709cf3ff6d743706157bb5708a8a85" [
          (s."bser@2.1.1")
          ];
        "fb-watchman@^2.0.0" = s."fb-watchman@2.0.1";
        "fbemitter@3.0.0" = f "fbemitter" "3.0.0" y "00b2a1af5411254aab416cd75f9e6289bee4bff3" [
          (s."fbjs@^3.0.0")
          ];
        "fbemitter@^3.0.0" = s."fbemitter@3.0.0";
        "fbjs-css-vars@1.0.2" = f "fbjs-css-vars" "1.0.2" y "216551136ae02fe255932c3ec8775f18e2c078b8" [];
        "fbjs-css-vars@^1.0.0" = s."fbjs-css-vars@1.0.2";
        "fbjs@3.0.4" = f "fbjs" "3.0.4" y "e1871c6bd3083bac71ff2da868ad5067d37716c6" [
          (s."cross-fetch@^3.1.5")
          (s."fbjs-css-vars@^1.0.0")
          (s."loose-envify@^1.0.0")
          (s."object-assign@^4.1.0")
          (s."promise@^7.1.1")
          (s."setimmediate@^1.0.5")
          (s."ua-parser-js@^0.7.30")
          ];
        "fbjs@^3.0.0" = s."fbjs@3.0.4";
        "fbjs@^3.0.1" = s."fbjs@3.0.4";
        "fd-slicer@1.1.0" = f "fd-slicer" "1.1.0" y "25c7c89cb1f9077f8891bbe61d8f390eae256f1e" [
          (s."pend@~1.2.0")
          ];
        "fd-slicer@~1.1.0" = s."fd-slicer@1.1.0";
        "feed@4.2.2" = f "feed" "4.2.2" y "865783ef6ed12579e2c44bbef3c9113bc4956a7e" [
          (s."xml-js@^1.6.11")
          ];
        "feed@^4.2.2" = s."feed@4.2.2";
        "fetch-retry@5.0.2" = f "fetch-retry" "5.0.2" y "4c55663a7c056cb45f182394e479464f0ff8f3e3" [];
        "fetch-retry@^5.0.2" = s."fetch-retry@5.0.2";
        "figgy-pudding@3.5.2" = f "figgy-pudding" "3.5.2" y "b4eee8148abb01dcf1d1ac34367d59e12fa61d6e" [];
        "figgy-pudding@^3.5.1" = s."figgy-pudding@3.5.2";
        "file-entry-cache@6.0.1" = f "file-entry-cache" "6.0.1" y "211b2dd9659cb0394b073e7323ac3c933d522027" [
          (s."flat-cache@^3.0.4")
          ];
        "file-entry-cache@^6.0.1" = s."file-entry-cache@6.0.1";
        "file-loader@6.2.0" = f "file-loader" "6.2.0" y "baef7cf8e1840df325e4390b4484879480eebe4d" [
          (s."loader-utils@^2.0.0")
          (s."schema-utils@^3.0.0")
          ];
        "file-loader@^6.2.0" = s."file-loader@6.2.0";
        "file-system-cache@1.1.0" = f "file-system-cache" "1.1.0" y "984de17b976b75a77a27e08d6828137c1aa80fa1" [
          (s."fs-extra@^10.1.0")
          (s."ramda@^0.28.0")
          ];
        "file-system-cache@^1.0.5" = s."file-system-cache@1.1.0";
        "file-uri-to-path@1.0.0" = f "file-uri-to-path" "1.0.0" y "553a7b8446ff6f684359c445f1e37a05dacc33dd" [];
        "filelist@1.0.4" = f "filelist" "1.0.4" y "f78978a1e944775ff9e62e744424f215e58352b5" [
          (s."minimatch@^5.0.1")
          ];
        "filelist@^1.0.1" = s."filelist@1.0.4";
        "filesize@8.0.7" = f "filesize" "8.0.7" y "695e70d80f4e47012c132d57a059e80c6b580bd8" [];
        "filesize@^8.0.6" = s."filesize@8.0.7";
        "fill-range@4.0.0" = f "fill-range" "4.0.0" y "d544811d428f98eb06a63dc402d2403c328c38f7" [
          (s."extend-shallow@^2.0.1")
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          (s."to-regex-range@^2.1.0")
          ];
        "fill-range@7.0.1" = f "fill-range" "7.0.1" y "1919a6a7c75fe38b2c7c77e5198535da9acdda40" [
          (s."to-regex-range@^5.0.1")
          ];
        "fill-range@^4.0.0" = s."fill-range@4.0.0";
        "fill-range@^7.0.1" = s."fill-range@7.0.1";
        "finalhandler@1.2.0" = f "finalhandler" "1.2.0" y "7d23fe5731b207b4640e4fcd00aec1f9207a7b32" [
          (s."debug@2.6.9")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."on-finished@2.4.1")
          (s."parseurl@~1.3.3")
          (s."statuses@2.0.1")
          (s."unpipe@~1.0.0")
          ];
        "find-cache-dir@2.1.0" = f "find-cache-dir" "2.1.0" y "8d0f94cd13fe43c6c7c261a0d86115ca918c05f7" [
          (s."commondir@^1.0.1")
          (s."make-dir@^2.0.0")
          (s."pkg-dir@^3.0.0")
          ];
        "find-cache-dir@3.3.2" = f "find-cache-dir" "3.3.2" y "b30c5b6eff0730731aea9bbd9dbecbd80256d64b" [
          (s."commondir@^1.0.1")
          (s."make-dir@^3.0.2")
          (s."pkg-dir@^4.1.0")
          ];
        "find-cache-dir@^2.0.0" = s."find-cache-dir@2.1.0";
        "find-cache-dir@^2.1.0" = s."find-cache-dir@2.1.0";
        "find-cache-dir@^3.2.0" = s."find-cache-dir@3.3.2";
        "find-cache-dir@^3.3.1" = s."find-cache-dir@3.3.2";
        "find-up@1.1.2" = f "find-up" "1.1.2" y "6b2e9822b1a2ce0a60ab64d610eccad53cb24d0f" [
          (s."path-exists@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          ];
        "find-up@2.1.0" = f "find-up" "2.1.0" y "45d1b7e506c717ddd482775a2b77920a3c0c57a7" [
          (s."locate-path@^2.0.0")
          ];
        "find-up@3.0.0" = f "find-up" "3.0.0" y "49169f1d7993430646da61ecc5ae355c21c97b73" [
          (s."locate-path@^3.0.0")
          ];
        "find-up@4.1.0" = f "find-up" "4.1.0" y "97afe7d6cdc0bc5928584b7c8d7b16e8a9aa5d19" [
          (s."locate-path@^5.0.0")
          (s."path-exists@^4.0.0")
          ];
        "find-up@5.0.0" = f "find-up" "5.0.0" y "4c92819ecb7083561e4f4a240a86be5198f536fc" [
          (s."locate-path@^6.0.0")
          (s."path-exists@^4.0.0")
          ];
        "find-up@^1.0.0" = s."find-up@1.1.2";
        "find-up@^2.1.0" = s."find-up@2.1.0";
        "find-up@^3.0.0" = s."find-up@3.0.0";
        "find-up@^4.0.0" = s."find-up@4.1.0";
        "find-up@^4.1.0" = s."find-up@4.1.0";
        "find-up@^5.0.0" = s."find-up@5.0.0";
        "flat-cache@3.0.4" = f "flat-cache" "3.0.4" y "61b0338302b2fe9f957dcc32fc2a87f1c3048b11" [
          (s."flatted@^3.1.0")
          (s."rimraf@^3.0.2")
          ];
        "flat-cache@^3.0.4" = s."flat-cache@3.0.4";
        "flatted@3.2.5" = f "flatted" "3.2.5" y "76c8584f4fc843db64702a6bd04ab7a8bd666da3" [];
        "flatted@^3.1.0" = s."flatted@3.2.5";
        "flush-write-stream@1.1.1" = f "flush-write-stream" "1.1.1" y "8dd7d873a1babc207d94ead0c2e0e44276ebf2e8" [
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.3.6")
          ];
        "flush-write-stream@^1.0.0" = s."flush-write-stream@1.1.1";
        "flux@4.0.3" = f "flux" "4.0.3" y "573b504a24982c4768fdfb59d8d2ea5637d72ee7" [
          (s."fbemitter@^3.0.0")
          (s."fbjs@^3.0.1")
          ];
        "flux@^4.0.1" = s."flux@4.0.3";
        "follow-redirects@1.15.1" = f "follow-redirects" "1.15.1" y "0ca6a452306c9b276e4d3127483e29575e207ad5" [];
        "follow-redirects@^1.0.0" = s."follow-redirects@1.15.1";
        "follow-redirects@^1.14.7" = s."follow-redirects@1.15.1";
        "for-in@1.0.2" = f "for-in" "1.0.2" y "81068d295a8142ec0ac726c6e2200c30fb6d5e80" [];
        "for-in@^1.0.2" = s."for-in@1.0.2";
        "foreground-child@2.0.0" = f "foreground-child" "2.0.0" y "71b32800c9f15aa8f2f83f4a6bd9bff35d861a53" [
          (s."cross-spawn@^7.0.0")
          (s."signal-exit@^3.0.2")
          ];
        "foreground-child@^2.0.0" = s."foreground-child@2.0.0";
        "fork-ts-checker-webpack-plugin@4.1.6" = f "fork-ts-checker-webpack-plugin" "4.1.6" y "5055c703febcf37fa06405d400c122b905167fc5" [
          (s."@babel/code-frame@^7.5.5")
          (s."chalk@^2.4.1")
          (s."micromatch@^3.1.10")
          (s."minimatch@^3.0.4")
          (s."semver@^5.6.0")
          (s."tapable@^1.0.0")
          (s."worker-rpc@^0.1.0")
          ];
        "fork-ts-checker-webpack-plugin@6.5.2" = f "fork-ts-checker-webpack-plugin" "6.5.2" y "4f67183f2f9eb8ba7df7177ce3cf3e75cdafb340" [
          (s."@babel/code-frame@^7.8.3")
          (s."@types/json-schema@^7.0.5")
          (s."chalk@^4.1.0")
          (s."chokidar@^3.4.2")
          (s."cosmiconfig@^6.0.0")
          (s."deepmerge@^4.2.2")
          (s."fs-extra@^9.0.0")
          (s."glob@^7.1.6")
          (s."memfs@^3.1.2")
          (s."minimatch@^3.0.4")
          (s."schema-utils@2.7.0")
          (s."semver@^7.3.2")
          (s."tapable@^1.0.0")
          ];
        "fork-ts-checker-webpack-plugin@^4.1.6" = s."fork-ts-checker-webpack-plugin@4.1.6";
        "fork-ts-checker-webpack-plugin@^6.0.4" = s."fork-ts-checker-webpack-plugin@6.5.2";
        "fork-ts-checker-webpack-plugin@^6.5.0" = s."fork-ts-checker-webpack-plugin@6.5.2";
        "form-data@3.0.1" = f "form-data" "3.0.1" y "ebd53791b78356a99af9a300d4282c4d5eb9755f" [
          (s."asynckit@^0.4.0")
          (s."combined-stream@^1.0.8")
          (s."mime-types@^2.1.12")
          ];
        "form-data@^3.0.0" = s."form-data@3.0.1";
        "format@0.2.2" = f "format" "0.2.2" y "d6170107e9efdc4ed30c9dc39016df942b5cb58b" [];
        "format@^0.2.0" = s."format@0.2.2";
        "forwarded@0.2.0" = f "forwarded" "0.2.0" y "2269936428aad4c15c7ebe9779a84bf0b2a81811" [];
        "fraction.js@4.2.0" = f "fraction.js" "4.2.0" y "448e5109a313a3527f5a3ab2119ec4cf0e0e2950" [];
        "fraction.js@^4.2.0" = s."fraction.js@4.2.0";
        "fragment-cache@0.2.1" = f "fragment-cache" "0.2.1" y "4290fad27f13e89be7f33799c6bc5a0abfff0d19" [
          (s."map-cache@^0.2.2")
          ];
        "fragment-cache@^0.2.1" = s."fragment-cache@0.2.1";
        "framer-motion@6.5.1" = f "framer-motion" "6.5.1" y "802448a16a6eb764124bf36d8cbdfa6dd6b931a7" [
          (s."@motionone/dom@10.12.0")
          (s."framesync@6.0.1")
          (s."hey-listen@^1.0.8")
          (s."popmotion@11.0.3")
          (s."style-value-types@5.0.0")
          (s."tslib@^2.1.0")
          (s."@emotion/is-prop-valid@^0.8.2")
          ];
        "framer-motion@^6.5.1" = s."framer-motion@6.5.1";
        "framesync@6.0.1" = f "framesync" "6.0.1" y "5e32fc01f1c42b39c654c35b16440e07a25d6f20" [
          (s."tslib@^2.1.0")
          ];
        "fresh@0.5.2" = f "fresh" "0.5.2" y "3d8cadd90d976569fa835ab1f8e4b23a105605a7" [];
        "from2@2.3.0" = f "from2" "2.3.0" y "8bfb5502bde4a4d36cfdeea007fcca21d7e382af" [
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.0.0")
          ];
        "from2@^2.1.0" = s."from2@2.3.0";
        "fromentries@1.3.2" = f "fromentries" "1.3.2" y "e4bca6808816bf8f93b52750f1127f5a6fd86e3a" [];
        "fromentries@^1.2.0" = s."fromentries@1.3.2";
        "fs-extra@10.1.0" = f "fs-extra" "10.1.0" y "02873cfbc4084dde127eaa5f9905eef2325d1abf" [
          (s."graceful-fs@^4.2.0")
          (s."jsonfile@^6.0.1")
          (s."universalify@^2.0.0")
          ];
        "fs-extra@9.1.0" = f "fs-extra" "9.1.0" y "5954460c764a8da2094ba3554bf839e6b9a7c86d" [
          (s."at-least-node@^1.0.0")
          (s."graceful-fs@^4.2.0")
          (s."jsonfile@^6.0.1")
          (s."universalify@^2.0.0")
          ];
        "fs-extra@^10.0.0" = s."fs-extra@10.1.0";
        "fs-extra@^10.1.0" = s."fs-extra@10.1.0";
        "fs-extra@^9.0.0" = s."fs-extra@9.1.0";
        "fs-extra@^9.0.1" = s."fs-extra@9.1.0";
        "fs-minipass@2.1.0" = f "fs-minipass" "2.1.0" y "7f5036fdbf12c63c169190cbe4199c852271f9fb" [
          (s."minipass@^3.0.0")
          ];
        "fs-minipass@^2.0.0" = s."fs-minipass@2.1.0";
        "fs-monkey@1.0.3" = f "fs-monkey" "1.0.3" y "ae3ac92d53bb328efe0e9a1d9541f6ad8d48e2d3" [];
        "fs-monkey@^1.0.3" = s."fs-monkey@1.0.3";
        "fs-write-stream-atomic@1.0.10" = f "fs-write-stream-atomic" "1.0.10" y "b47df53493ef911df75731e70a9ded0189db40c9" [
          (s."graceful-fs@^4.1.2")
          (s."iferr@^0.1.5")
          (s."imurmurhash@^0.1.4")
          (s."readable-stream@1 || 2")
          ];
        "fs-write-stream-atomic@^1.0.8" = s."fs-write-stream-atomic@1.0.10";
        "fs.realpath@1.0.0" = f "fs.realpath" "1.0.0" y "1504ad2523158caa40db4a2787cb01411994ea4f" [];
        "fs.realpath@^1.0.0" = s."fs.realpath@1.0.0";
        "fs@0.0.1-security" = f "fs" "0.0.1-security" y "8a7bd37186b6dddf3813f23858b57ecaaf5e41d4" [];
        "fs@^0.0.1-security" = s."fs@0.0.1-security";
        "fsevents@1.2.13" = f "fsevents" "1.2.13" y "f325cb0455592428bcf11b383370ef70e3bfcc38" [
          (s."bindings@^1.5.0")
          (s."nan@^2.12.1")
          ];
        "fsevents@2.3.2" = f "fsevents" "2.3.2" y "8a526f78b8fdf4623b709e0b975c52c24c02fd1a" [];
        "fsevents@^1.2.7" = s."fsevents@1.2.13";
        "fsevents@^2.1.2" = s."fsevents@2.3.2";
        "fsevents@^2.3.2" = s."fsevents@2.3.2";
        "fsevents@~2.3.2" = s."fsevents@2.3.2";
        "function-bind@1.1.1" = f "function-bind" "1.1.1" y "a56899d3ea3c9bab874bb9773b7c5ede92f4895d" [];
        "function-bind@^1.1.1" = s."function-bind@1.1.1";
        "function.prototype.name@1.1.5" = f "function.prototype.name" "1.1.5" y "cce0505fe1ffb80503e6f9e46cc64e46a12a9621" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.0")
          (s."functions-have-names@^1.2.2")
          ];
        "function.prototype.name@^1.1.0" = s."function.prototype.name@1.1.5";
        "function.prototype.name@^1.1.5" = s."function.prototype.name@1.1.5";
        "functional-red-black-tree@1.0.1" = f "functional-red-black-tree" "1.0.1" y "1b0ab3bd553b2a0d6399d29c0e3ea0b252078327" [];
        "functional-red-black-tree@^1.0.1" = s."functional-red-black-tree@1.0.1";
        "functions-have-names@1.2.3" = f "functions-have-names" "1.2.3" y "0404fe4ee2ba2f607f0e0ec3c80bae994133b834" [];
        "functions-have-names@^1.2.2" = s."functions-have-names@1.2.3";
        "gauge@3.0.2" = f "gauge" "3.0.2" y "03bf4441c044383908bcfa0656ad91803259b395" [
          (s."aproba@^1.0.3 || ^2.0.0")
          (s."color-support@^1.1.2")
          (s."console-control-strings@^1.0.0")
          (s."has-unicode@^2.0.1")
          (s."object-assign@^4.1.1")
          (s."signal-exit@^3.0.0")
          (s."string-width@^4.2.3")
          (s."strip-ansi@^6.0.1")
          (s."wide-align@^1.1.2")
          ];
        "gauge@^3.0.0" = s."gauge@3.0.2";
        "gensync@1.0.0-beta.2" = f "gensync" "1.0.0-beta.2" y "32a6ee76c3d7f52d46b2b1ae5d93fea8580a25e0" [];
        "gensync@^1.0.0-beta.1" = s."gensync@1.0.0-beta.2";
        "gensync@^1.0.0-beta.2" = s."gensync@1.0.0-beta.2";
        "gentype@4.5.0" = f "gentype" "4.5.0" y "460152da93db783626fd25bbd38fb574d886f5f3" [];
        "gentype@^4.5.0" = s."gentype@4.5.0";
        "get-caller-file@2.0.5" = f "get-caller-file" "2.0.5" y "4f94412a82db32f36e3b0b9741f8a97feb031f7e" [];
        "get-caller-file@^2.0.1" = s."get-caller-file@2.0.5";
        "get-caller-file@^2.0.5" = s."get-caller-file@2.0.5";
        "get-intrinsic@1.1.2" = f "get-intrinsic" "1.1.2" y "336975123e05ad0b7ba41f152ee4aadbea6cf598" [
          (s."function-bind@^1.1.1")
          (s."has@^1.0.3")
          (s."has-symbols@^1.0.3")
          ];
        "get-intrinsic@^1.0.2" = s."get-intrinsic@1.1.2";
        "get-intrinsic@^1.1.0" = s."get-intrinsic@1.1.2";
        "get-intrinsic@^1.1.1" = s."get-intrinsic@1.1.2";
        "get-own-enumerable-property-symbols@3.0.2" = f "get-own-enumerable-property-symbols" "3.0.2" y "b5fde77f22cbe35f390b4e089922c50bce6ef664" [];
        "get-own-enumerable-property-symbols@^3.0.0" = s."get-own-enumerable-property-symbols@3.0.2";
        "get-package-type@0.1.0" = f "get-package-type" "0.1.0" y "8de2d803cff44df3bc6c456e6668b36c3926e11a" [];
        "get-package-type@^0.1.0" = s."get-package-type@0.1.0";
        "get-stdin@4.0.1" = f "get-stdin" "4.0.1" y "b968c6b0a04384324902e8bf1a5df32579a450fe" [];
        "get-stdin@9.0.0" = f "get-stdin" "9.0.0" y "3983ff82e03d56f1b2ea0d3e60325f39d703a575" [];
        "get-stdin@^4.0.1" = s."get-stdin@4.0.1";
        "get-stdin@^9.0.0" = s."get-stdin@9.0.0";
        "get-stream@4.1.0" = f "get-stream" "4.1.0" y "c1b255575f3dc21d59bfc79cd3d2b46b1c3a54b5" [
          (s."pump@^3.0.0")
          ];
        "get-stream@5.2.0" = f "get-stream" "5.2.0" y "4966a1795ee5ace65e706c4b7beb71257d6e22d3" [
          (s."pump@^3.0.0")
          ];
        "get-stream@6.0.1" = f "get-stream" "6.0.1" y "a262d8eef67aced57c2852ad6167526a43cbf7b7" [];
        "get-stream@^4.0.0" = s."get-stream@4.1.0";
        "get-stream@^4.1.0" = s."get-stream@4.1.0";
        "get-stream@^5.1.0" = s."get-stream@5.2.0";
        "get-stream@^6.0.0" = s."get-stream@6.0.1";
        "get-symbol-description@1.0.0" = f "get-symbol-description" "1.0.0" y "7fdb81c900101fbd564dd5f1a30af5aadc1e58d6" [
          (s."call-bind@^1.0.2")
          (s."get-intrinsic@^1.1.1")
          ];
        "get-symbol-description@^1.0.0" = s."get-symbol-description@1.0.0";
        "get-value@2.0.6" = f "get-value" "2.0.6" y "dc15ca1c672387ca76bd37ac0a395ba2042a2c28" [];
        "get-value@^2.0.3" = s."get-value@2.0.6";
        "get-value@^2.0.6" = s."get-value@2.0.6";
        "github-slugger@1.4.0" = f "github-slugger" "1.4.0" y "206eb96cdb22ee56fdc53a28d5a302338463444e" [];
        "github-slugger@^1.0.0" = s."github-slugger@1.4.0";
        "github-slugger@^1.4.0" = s."github-slugger@1.4.0";
        "glob-parent@3.1.0" = f "glob-parent" "3.1.0" y "9e6af6299d8d3bd2bd40430832bd113df906c5ae" [
          (s."is-glob@^3.1.0")
          (s."path-dirname@^1.0.0")
          ];
        "glob-parent@5.1.2" = f "glob-parent" "5.1.2" y "869832c58034fe68a4093c17dc15e8340d8401c4" [
          (s."is-glob@^4.0.1")
          ];
        "glob-parent@6.0.2" = f "glob-parent" "6.0.2" y "6d237d99083950c79290f24c7642a3de9a28f9e3" [
          (s."is-glob@^4.0.3")
          ];
        "glob-parent@^3.1.0" = s."glob-parent@3.1.0";
        "glob-parent@^5.1.2" = s."glob-parent@5.1.2";
        "glob-parent@^6.0.1" = s."glob-parent@6.0.2";
        "glob-parent@^6.0.2" = s."glob-parent@6.0.2";
        "glob-parent@~5.1.2" = s."glob-parent@5.1.2";
        "glob-promise@3.4.0" = f "glob-promise" "3.4.0" y "b6b8f084504216f702dc2ce8c9bc9ac8866fdb20" [
          (s."@types/glob@*")
          ];
        "glob-promise@^3.4.0" = s."glob-promise@3.4.0";
        "glob-to-regexp@0.3.0" = f "glob-to-regexp" "0.3.0" y "8c5a1494d2066c570cc3bfe4496175acc4d502ab" [];
        "glob-to-regexp@0.4.1" = f "glob-to-regexp" "0.4.1" y "c75297087c851b9a578bd217dd59a92f59fe546e" [];
        "glob-to-regexp@^0.3.0" = s."glob-to-regexp@0.3.0";
        "glob-to-regexp@^0.4.1" = s."glob-to-regexp@0.4.1";
        "glob@7.2.3" = f "glob" "7.2.3" y "b8df0fb802bbfa8e89bd1d938b4e16578ed44f2b" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^3.1.1")
          (s."once@^1.3.0")
          (s."path-is-absolute@^1.0.0")
          ];
        "glob@8.0.3" = f "glob" "8.0.3" y "415c6eb2deed9e502c68fa44a272e6da6eeca42e" [
          (s."fs.realpath@^1.0.0")
          (s."inflight@^1.0.4")
          (s."inherits@2")
          (s."minimatch@^5.0.1")
          (s."once@^1.3.0")
          ];
        "glob@^7.0.0" = s."glob@7.2.3";
        "glob@^7.0.6" = s."glob@7.2.3";
        "glob@^7.1.1" = s."glob@7.2.3";
        "glob@^7.1.2" = s."glob@7.2.3";
        "glob@^7.1.3" = s."glob@7.2.3";
        "glob@^7.1.4" = s."glob@7.2.3";
        "glob@^7.1.6" = s."glob@7.2.3";
        "glob@^8.0.3" = s."glob@8.0.3";
        "global-dirs@3.0.0" = f "global-dirs" "3.0.0" y "70a76fe84ea315ab37b1f5576cbde7d48ef72686" [
          (s."ini@2.0.0")
          ];
        "global-dirs@^3.0.0" = s."global-dirs@3.0.0";
        "global-modules@2.0.0" = f "global-modules" "2.0.0" y "997605ad2345f27f51539bea26574421215c7780" [
          (s."global-prefix@^3.0.0")
          ];
        "global-modules@^2.0.0" = s."global-modules@2.0.0";
        "global-prefix@3.0.0" = f "global-prefix" "3.0.0" y "fc85f73064df69f50421f47f883fe5b913ba9b97" [
          (s."ini@^1.3.5")
          (s."kind-of@^6.0.2")
          (s."which@^1.3.1")
          ];
        "global-prefix@^3.0.0" = s."global-prefix@3.0.0";
        "global@4.4.0" = f "global" "4.4.0" y "3e7b105179006a323ed71aafca3e9c57a5cc6406" [
          (s."min-document@^2.19.0")
          (s."process@^0.11.10")
          ];
        "global@^4.4.0" = s."global@4.4.0";
        "globals@11.12.0" = f "globals" "11.12.0" y "ab8795338868a0babd8525758018c2a7eb95c42e" [];
        "globals@13.15.0" = f "globals" "13.15.0" y "38113218c907d2f7e98658af246cef8b77e90bac" [
          (s."type-fest@^0.20.2")
          ];
        "globals@9.18.0" = f "globals" "9.18.0" y "aa3896b3e69b487f17e31ed2143d69a8e30c2d8a" [];
        "globals@^11.1.0" = s."globals@11.12.0";
        "globals@^13.15.0" = s."globals@13.15.0";
        "globals@^9.18.0" = s."globals@9.18.0";
        "globalthis@1.0.3" = f "globalthis" "1.0.3" y "5852882a52b80dc301b0660273e1ed082f0b6ccf" [
          (s."define-properties@^1.1.3")
          ];
        "globalthis@^1.0.0" = s."globalthis@1.0.3";
        "globby@11.1.0" = f "globby" "11.1.0" y "bd4be98bb042f83d796f7e3811991fbe82a0d34b" [
          (s."array-union@^2.1.0")
          (s."dir-glob@^3.0.1")
          (s."fast-glob@^3.2.9")
          (s."ignore@^5.2.0")
          (s."merge2@^1.4.1")
          (s."slash@^3.0.0")
          ];
        "globby@13.1.2" = f "globby" "13.1.2" y "29047105582427ab6eca4f905200667b056da515" [
          (s."dir-glob@^3.0.1")
          (s."fast-glob@^3.2.11")
          (s."ignore@^5.2.0")
          (s."merge2@^1.4.1")
          (s."slash@^4.0.0")
          ];
        "globby@9.2.0" = f "globby" "9.2.0" y "fd029a706c703d29bdd170f4b6db3a3f7a7cb63d" [
          (s."@types/glob@^7.1.1")
          (s."array-union@^1.0.2")
          (s."dir-glob@^2.2.2")
          (s."fast-glob@^2.2.6")
          (s."glob@^7.1.3")
          (s."ignore@^4.0.3")
          (s."pify@^4.0.1")
          (s."slash@^2.0.0")
          ];
        "globby@^11.0.1" = s."globby@11.1.0";
        "globby@^11.0.2" = s."globby@11.1.0";
        "globby@^11.0.4" = s."globby@11.1.0";
        "globby@^11.1.0" = s."globby@11.1.0";
        "globby@^13.0.0" = s."globby@13.1.2";
        "globby@^13.1.1" = s."globby@13.1.2";
        "globby@^9.2.0" = s."globby@9.2.0";
        "got@9.6.0" = f "got" "9.6.0" y "edf45e7d67f99545705de1f7bbeeeb121765ed85" [
          (s."@sindresorhus/is@^0.14.0")
          (s."@szmarczak/http-timer@^1.1.2")
          (s."cacheable-request@^6.0.0")
          (s."decompress-response@^3.3.0")
          (s."duplexer3@^0.1.4")
          (s."get-stream@^4.1.0")
          (s."lowercase-keys@^1.0.1")
          (s."mimic-response@^1.0.1")
          (s."p-cancelable@^1.0.0")
          (s."to-readable-stream@^1.0.0")
          (s."url-parse-lax@^3.0.0")
          ];
        "got@^9.6.0" = s."got@9.6.0";
        "graceful-fs@4.2.10" = f "graceful-fs" "4.2.10" y "147d3a006da4ca3ce14728c7aefc287c367d7a6c" [];
        "graceful-fs@^4.1.11" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.1.15" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.1.2" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.1.6" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.2.0" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.2.4" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.2.6" = s."graceful-fs@4.2.10";
        "graceful-fs@^4.2.9" = s."graceful-fs@4.2.10";
        "grapheme-splitter@1.0.4" = f "grapheme-splitter" "1.0.4" y "9cf3a665c6247479896834af35cf1dbb4400767e" [];
        "grapheme-splitter@^1.0.4" = s."grapheme-splitter@1.0.4";
        "gray-matter@4.0.3" = f "gray-matter" "4.0.3" y "e893c064825de73ea1f5f7d88c7a9f7274288798" [
          (s."js-yaml@^3.13.1")
          (s."kind-of@^6.0.2")
          (s."section-matter@^1.0.0")
          (s."strip-bom-string@^1.0.0")
          ];
        "gray-matter@^4.0.3" = s."gray-matter@4.0.3";
        "gzip-size@6.0.0" = f "gzip-size" "6.0.0" y "065367fd50c239c0671cbcbad5be3e2eeb10e462" [
          (s."duplexer@^0.1.2")
          ];
        "gzip-size@^6.0.0" = s."gzip-size@6.0.0";
        "handle-thing@2.0.1" = f "handle-thing" "2.0.1" y "857f79ce359580c340d43081cc648970d0bb234e" [];
        "handle-thing@^2.0.0" = s."handle-thing@2.0.1";
        "handlebars@4.7.7" = f "handlebars" "4.7.7" y "9ce33416aad02dbd6c8fafa8240d5d98004945a1" [
          (s."minimist@^1.2.5")
          (s."neo-async@^2.6.0")
          (s."source-map@^0.6.1")
          (s."wordwrap@^1.0.0")
          (s."uglify-js@^3.1.4")
          ];
        "handlebars@^4.7.7" = s."handlebars@4.7.7";
        "harmony-reflect@1.6.2" = f "harmony-reflect" "1.6.2" y "31ecbd32e648a34d030d86adb67d4d47547fe710" [];
        "harmony-reflect@^1.4.6" = s."harmony-reflect@1.6.2";
        "has-ansi@2.0.0" = f "has-ansi" "2.0.0" y "34f5049ce1ecdf2b0649af3ef24e45ed35416d91" [
          (s."ansi-regex@^2.0.0")
          ];
        "has-ansi@^2.0.0" = s."has-ansi@2.0.0";
        "has-bigints@1.0.2" = f "has-bigints" "1.0.2" y "0871bd3e3d51626f6ca0966668ba35d5602d6eaa" [];
        "has-bigints@^1.0.1" = s."has-bigints@1.0.2";
        "has-bigints@^1.0.2" = s."has-bigints@1.0.2";
        "has-flag@3.0.0" = f "has-flag" "3.0.0" y "b5d454dc2199ae225699f3467e5a07f3b955bafd" [];
        "has-flag@4.0.0" = f "has-flag" "4.0.0" y "944771fd9c81c81265c4d6941860da06bb59479b" [];
        "has-flag@^3.0.0" = s."has-flag@3.0.0";
        "has-flag@^4.0.0" = s."has-flag@4.0.0";
        "has-glob@1.0.0" = f "has-glob" "1.0.0" y "9aaa9eedbffb1ba3990a7b0010fb678ee0081207" [
          (s."is-glob@^3.0.0")
          ];
        "has-glob@^1.0.0" = s."has-glob@1.0.0";
        "has-property-descriptors@1.0.0" = f "has-property-descriptors" "1.0.0" y "610708600606d36961ed04c196193b6a607fa861" [
          (s."get-intrinsic@^1.1.1")
          ];
        "has-property-descriptors@^1.0.0" = s."has-property-descriptors@1.0.0";
        "has-symbols@1.0.3" = f "has-symbols" "1.0.3" y "bb7b2c4349251dce87b125f7bdf874aa7c8b39f8" [];
        "has-symbols@^1.0.1" = s."has-symbols@1.0.3";
        "has-symbols@^1.0.2" = s."has-symbols@1.0.3";
        "has-symbols@^1.0.3" = s."has-symbols@1.0.3";
        "has-tostringtag@1.0.0" = f "has-tostringtag" "1.0.0" y "7e133818a7d394734f941e73c3d3f9291e658b25" [
          (s."has-symbols@^1.0.2")
          ];
        "has-tostringtag@^1.0.0" = s."has-tostringtag@1.0.0";
        "has-unicode@2.0.1" = f "has-unicode" "2.0.1" y "e0e6fe6a28cf51138855e086d1691e771de2a8b9" [];
        "has-unicode@^2.0.1" = s."has-unicode@2.0.1";
        "has-value@0.3.1" = f "has-value" "0.3.1" y "7b1f58bada62ca827ec0a2078025654845995e1f" [
          (s."get-value@^2.0.3")
          (s."has-values@^0.1.4")
          (s."isobject@^2.0.0")
          ];
        "has-value@1.0.0" = f "has-value" "1.0.0" y "18b281da585b1c5c51def24c930ed29a0be6b177" [
          (s."get-value@^2.0.6")
          (s."has-values@^1.0.0")
          (s."isobject@^3.0.0")
          ];
        "has-value@^0.3.1" = s."has-value@0.3.1";
        "has-value@^1.0.0" = s."has-value@1.0.0";
        "has-values@0.1.4" = f "has-values" "0.1.4" y "6d61de95d91dfca9b9a02089ad384bff8f62b771" [];
        "has-values@1.0.0" = f "has-values" "1.0.0" y "95b0b63fec2146619a6fe57fe75628d5a39efe4f" [
          (s."is-number@^3.0.0")
          (s."kind-of@^4.0.0")
          ];
        "has-values@^0.1.4" = s."has-values@0.1.4";
        "has-values@^1.0.0" = s."has-values@1.0.0";
        "has-yarn@2.1.0" = f "has-yarn" "2.1.0" y "137e11354a7b5bf11aa5cb649cf0c6f3ff2b2e77" [];
        "has-yarn@^2.1.0" = s."has-yarn@2.1.0";
        "has@1.0.3" = f "has" "1.0.3" y "722d7cbfc1f6aa8241f16dd814e011e1f41e8796" [
          (s."function-bind@^1.1.1")
          ];
        "has@^1.0.3" = s."has@1.0.3";
        "hash-base@3.1.0" = f "hash-base" "3.1.0" y "55c381d9e06e1d2997a883b4a3fddfe7f0d3af33" [
          (s."inherits@^2.0.4")
          (s."readable-stream@^3.6.0")
          (s."safe-buffer@^5.2.0")
          ];
        "hash-base@^3.0.0" = s."hash-base@3.1.0";
        "hash.js@1.1.7" = f "hash.js" "1.1.7" y "0babca538e8d4ee4a0f8988d68866537a003cf42" [
          (s."inherits@^2.0.3")
          (s."minimalistic-assert@^1.0.1")
          ];
        "hash.js@^1.0.0" = s."hash.js@1.1.7";
        "hash.js@^1.0.3" = s."hash.js@1.1.7";
        "hasha@5.2.2" = f "hasha" "5.2.2" y "a48477989b3b327aea3c04f53096d816d97522a1" [
          (s."is-stream@^2.0.0")
          (s."type-fest@^0.8.0")
          ];
        "hasha@^5.0.0" = s."hasha@5.2.2";
        "hast-to-hyperscript@9.0.1" = f "hast-to-hyperscript" "9.0.1" y "9b67fd188e4c81e8ad66f803855334173920218d" [
          (s."@types/unist@^2.0.3")
          (s."comma-separated-tokens@^1.0.0")
          (s."property-information@^5.3.0")
          (s."space-separated-tokens@^1.0.0")
          (s."style-to-object@^0.3.0")
          (s."unist-util-is@^4.0.0")
          (s."web-namespaces@^1.0.0")
          ];
        "hast-to-hyperscript@^9.0.0" = s."hast-to-hyperscript@9.0.1";
        "hast-util-from-parse5@6.0.1" = f "hast-util-from-parse5" "6.0.1" y "554e34abdeea25ac76f5bd950a1f0180e0b3bc2a" [
          (s."@types/parse5@^5.0.0")
          (s."hastscript@^6.0.0")
          (s."property-information@^5.0.0")
          (s."vfile@^4.0.0")
          (s."vfile-location@^3.2.0")
          (s."web-namespaces@^1.0.0")
          ];
        "hast-util-from-parse5@^6.0.0" = s."hast-util-from-parse5@6.0.1";
        "hast-util-is-element@1.1.0" = f "hast-util-is-element" "1.1.0" y "3b3ed5159a2707c6137b48637fbfe068e175a425" [];
        "hast-util-is-element@2.1.2" = f "hast-util-is-element" "2.1.2" y "fc0b0dc7cef3895e839b8d66979d57b0338c68f3" [
          (s."@types/hast@^2.0.0")
          (s."@types/unist@^2.0.0")
          ];
        "hast-util-is-element@^1.0.0" = s."hast-util-is-element@1.1.0";
        "hast-util-parse-selector@2.2.5" = f "hast-util-parse-selector" "2.2.5" y "d57c23f4da16ae3c63b3b6ca4616683313499c3a" [];
        "hast-util-parse-selector@^2.0.0" = s."hast-util-parse-selector@2.2.5";
        "hast-util-raw@6.0.1" = f "hast-util-raw" "6.0.1" y "973b15930b7529a7b66984c98148b46526885977" [
          (s."@types/hast@^2.0.0")
          (s."hast-util-from-parse5@^6.0.0")
          (s."hast-util-to-parse5@^6.0.0")
          (s."html-void-elements@^1.0.0")
          (s."parse5@^6.0.0")
          (s."unist-util-position@^3.0.0")
          (s."vfile@^4.0.0")
          (s."web-namespaces@^1.0.0")
          (s."xtend@^4.0.0")
          (s."zwitch@^1.0.0")
          ];
        "hast-util-to-parse5@6.0.0" = f "hast-util-to-parse5" "6.0.0" y "1ec44650b631d72952066cea9b1445df699f8479" [
          (s."hast-to-hyperscript@^9.0.0")
          (s."property-information@^5.0.0")
          (s."web-namespaces@^1.0.0")
          (s."xtend@^4.0.0")
          (s."zwitch@^1.0.0")
          ];
        "hast-util-to-parse5@^6.0.0" = s."hast-util-to-parse5@6.0.0";
        "hast-util-to-text@2.0.1" = f "hast-util-to-text" "2.0.1" y "04f2e065642a0edb08341976084aa217624a0f8b" [
          (s."hast-util-is-element@^1.0.0")
          (s."repeat-string@^1.0.0")
          (s."unist-util-find-after@^3.0.0")
          ];
        "hast-util-to-text@^2.0.0" = s."hast-util-to-text@2.0.1";
        "hastscript@6.0.0" = f "hastscript" "6.0.0" y "e8768d7eac56c3fdeac8a92830d58e811e5bf640" [
          (s."@types/hast@^2.0.0")
          (s."comma-separated-tokens@^1.0.0")
          (s."hast-util-parse-selector@^2.0.0")
          (s."property-information@^5.0.0")
          (s."space-separated-tokens@^1.0.0")
          ];
        "hastscript@^6.0.0" = s."hastscript@6.0.0";
        "he@1.2.0" = f "he" "1.2.0" y "84ae65fa7eafb165fddb61566ae14baf05664f0f" [];
        "he@^1.2.0" = s."he@1.2.0";
        "hey-listen@1.0.8" = f "hey-listen" "1.0.8" y "8e59561ff724908de1aa924ed6ecc84a56a9aa68" [];
        "hey-listen@^1.0.8" = s."hey-listen@1.0.8";
        "highlight.js@10.7.3" = f "highlight.js" "10.7.3" y "697272e3991356e40c3cac566a74eef681756531" [];
        "highlight.js@^10.4.1" = s."highlight.js@10.7.3";
        "highlight.js@~10.7.0" = s."highlight.js@10.7.3";
        "history@4.10.1" = f "history" "4.10.1" y "33371a65e3a83b267434e2b3f3b1b4c58aad4cf3" [
          (s."@babel/runtime@^7.1.2")
          (s."loose-envify@^1.2.0")
          (s."resolve-pathname@^3.0.0")
          (s."tiny-invariant@^1.0.2")
          (s."tiny-warning@^1.0.0")
          (s."value-equal@^1.0.1")
          ];
        "history@^4.9.0" = s."history@4.10.1";
        "hmac-drbg@1.0.1" = f "hmac-drbg" "1.0.1" y "d2745701025a6c775a6c545793ed502fc0c649a1" [
          (s."hash.js@^1.0.3")
          (s."minimalistic-assert@^1.0.0")
          (s."minimalistic-crypto-utils@^1.0.1")
          ];
        "hmac-drbg@^1.0.1" = s."hmac-drbg@1.0.1";
        "hoist-non-react-statics@3.3.2" = f "hoist-non-react-statics" "3.3.2" y "ece0acaf71d62c2969c2ec59feff42a4b1a85b45" [
          (s."react-is@^16.7.0")
          ];
        "hoist-non-react-statics@^3.1.0" = s."hoist-non-react-statics@3.3.2";
        "hoist-non-react-statics@^3.3.0" = s."hoist-non-react-statics@3.3.2";
        "hoopy@0.1.4" = f "hoopy" "0.1.4" y "609207d661100033a9a9402ad3dea677381c1b1d" [];
        "hoopy@^0.1.4" = s."hoopy@0.1.4";
        "hosted-git-info@2.8.9" = f "hosted-git-info" "2.8.9" y "dffc0bf9a21c02209090f2aa69429e1414daf3f9" [];
        "hosted-git-info@^2.1.4" = s."hosted-git-info@2.8.9";
        "hpack.js@2.1.6" = f "hpack.js" "2.1.6" y "87774c0949e513f42e84575b3c45681fade2a0b2" [
          (s."inherits@^2.0.1")
          (s."obuf@^1.0.0")
          (s."readable-stream@^2.0.1")
          (s."wbuf@^1.1.0")
          ];
        "hpack.js@^2.1.6" = s."hpack.js@2.1.6";
        "html-encoding-sniffer@2.0.1" = f "html-encoding-sniffer" "2.0.1" y "42a6dc4fd33f00281176e8b23759ca4e4fa185f3" [
          (s."whatwg-encoding@^1.0.5")
          ];
        "html-encoding-sniffer@^2.0.1" = s."html-encoding-sniffer@2.0.1";
        "html-entities@2.3.3" = f "html-entities" "2.3.3" y "117d7626bece327fc8baace8868fa6f5ef856e46" [];
        "html-entities@^2.1.0" = s."html-entities@2.3.3";
        "html-entities@^2.3.2" = s."html-entities@2.3.3";
        "html-escaper@2.0.2" = f "html-escaper" "2.0.2" y "dfd60027da36a36dfcbe236262c00a5822681453" [];
        "html-escaper@^2.0.0" = s."html-escaper@2.0.2";
        "html-minifier-terser@5.1.1" = f "html-minifier-terser" "5.1.1" y "922e96f1f3bb60832c2634b79884096389b1f054" [
          (s."camel-case@^4.1.1")
          (s."clean-css@^4.2.3")
          (s."commander@^4.1.1")
          (s."he@^1.2.0")
          (s."param-case@^3.0.3")
          (s."relateurl@^0.2.7")
          (s."terser@^4.6.3")
          ];
        "html-minifier-terser@6.1.0" = f "html-minifier-terser" "6.1.0" y "bfc818934cc07918f6b3669f5774ecdfd48f32ab" [
          (s."camel-case@^4.1.2")
          (s."clean-css@^5.2.2")
          (s."commander@^8.3.0")
          (s."he@^1.2.0")
          (s."param-case@^3.0.4")
          (s."relateurl@^0.2.7")
          (s."terser@^5.10.0")
          ];
        "html-minifier-terser@^5.0.1" = s."html-minifier-terser@5.1.1";
        "html-minifier-terser@^6.0.2" = s."html-minifier-terser@6.1.0";
        "html-minifier-terser@^6.1.0" = s."html-minifier-terser@6.1.0";
        "html-tags@3.2.0" = f "html-tags" "3.2.0" y "dbb3518d20b726524e4dd43de397eb0a95726961" [];
        "html-tags@^3.1.0" = s."html-tags@3.2.0";
        "html-tags@^3.2.0" = s."html-tags@3.2.0";
        "html-void-elements@1.0.5" = f "html-void-elements" "1.0.5" y "ce9159494e86d95e45795b166c2021c2cfca4483" [];
        "html-void-elements@^1.0.0" = s."html-void-elements@1.0.5";
        "html-webpack-plugin@4.5.2" = f "html-webpack-plugin" "4.5.2" y "76fc83fa1a0f12dd5f7da0404a54e2699666bc12" [
          (s."@types/html-minifier-terser@^5.0.0")
          (s."@types/tapable@^1.0.5")
          (s."@types/webpack@^4.41.8")
          (s."html-minifier-terser@^5.0.1")
          (s."loader-utils@^1.2.3")
          (s."lodash@^4.17.20")
          (s."pretty-error@^2.1.1")
          (s."tapable@^1.1.3")
          (s."util.promisify@1.0.0")
          ];
        "html-webpack-plugin@5.5.0" = f "html-webpack-plugin" "5.5.0" y "c3911936f57681c1f9f4d8b68c158cd9dfe52f50" [
          (s."@types/html-minifier-terser@^6.0.0")
          (s."html-minifier-terser@^6.0.2")
          (s."lodash@^4.17.21")
          (s."pretty-error@^4.0.0")
          (s."tapable@^2.0.0")
          ];
        "html-webpack-plugin@^4.0.0" = s."html-webpack-plugin@4.5.2";
        "html-webpack-plugin@^5.0.0" = s."html-webpack-plugin@5.5.0";
        "html-webpack-plugin@^5.5.0" = s."html-webpack-plugin@5.5.0";
        "htmlparser2@6.1.0" = f "htmlparser2" "6.1.0" y "c4d762b6c3371a05dbe65e94ae43a9f845fb8fb7" [
          (s."domelementtype@^2.0.1")
          (s."domhandler@^4.0.0")
          (s."domutils@^2.5.2")
          (s."entities@^2.0.0")
          ];
        "htmlparser2@8.0.1" = f "htmlparser2" "8.0.1" y "abaa985474fcefe269bc761a779b544d7196d010" [
          (s."domelementtype@^2.3.0")
          (s."domhandler@^5.0.2")
          (s."domutils@^3.0.1")
          (s."entities@^4.3.0")
          ];
        "htmlparser2@^6.1.0" = s."htmlparser2@6.1.0";
        "htmlparser2@^8.0.1" = s."htmlparser2@8.0.1";
        "http-cache-semantics@4.1.0" = f "http-cache-semantics" "4.1.0" y "49e91c5cbf36c9b94bcfcd71c23d5249ec74e390" [];
        "http-cache-semantics@^4.0.0" = s."http-cache-semantics@4.1.0";
        "http-deceiver@1.2.7" = f "http-deceiver" "1.2.7" y "fa7168944ab9a519d337cb0bec7284dc3e723d87" [];
        "http-deceiver@^1.2.7" = s."http-deceiver@1.2.7";
        "http-errors@1.6.3" = f "http-errors" "1.6.3" y "8b55680bb4be283a0b5bf4ea2e38580be1d9320d" [
          (s."depd@~1.1.2")
          (s."inherits@2.0.3")
          (s."setprototypeof@1.1.0")
          (s."statuses@>= 1.4.0 < 2")
          ];
        "http-errors@1.8.1" = f "http-errors" "1.8.1" y "7c3f28577cbc8a207388455dbd62295ed07bd68c" [
          (s."depd@~1.1.2")
          (s."inherits@2.0.4")
          (s."setprototypeof@1.2.0")
          (s."statuses@>= 1.5.0 < 2")
          (s."toidentifier@1.0.1")
          ];
        "http-errors@2.0.0" = f "http-errors" "2.0.0" y "b7774a1486ef73cf7667ac9ae0858c012c57b9d3" [
          (s."depd@2.0.0")
          (s."inherits@2.0.4")
          (s."setprototypeof@1.2.0")
          (s."statuses@2.0.1")
          (s."toidentifier@1.0.1")
          ];
        "http-errors@~1.6.2" = s."http-errors@1.6.3";
        "http-parser-js@0.5.6" = f "http-parser-js" "0.5.6" y "2e02406ab2df8af8a7abfba62e0da01c62b95afd" [];
        "http-parser-js@>=0.5.1" = s."http-parser-js@0.5.6";
        "http-proxy-agent@4.0.1" = f "http-proxy-agent" "4.0.1" y "8a8c8ef7f5932ccf953c296ca8291b95aa74aa3a" [
          (s."@tootallnate/once@1")
          (s."agent-base@6")
          (s."debug@4")
          ];
        "http-proxy-agent@^4.0.0" = s."http-proxy-agent@4.0.1";
        "http-proxy-agent@^4.0.1" = s."http-proxy-agent@4.0.1";
        "http-proxy-middleware@2.0.6" = f "http-proxy-middleware" "2.0.6" y "e1a4dd6979572c7ab5a4e4b55095d1f32a74963f" [
          (s."@types/http-proxy@^1.17.8")
          (s."http-proxy@^1.18.1")
          (s."is-glob@^4.0.1")
          (s."is-plain-obj@^3.0.0")
          (s."micromatch@^4.0.2")
          ];
        "http-proxy-middleware@^2.0.3" = s."http-proxy-middleware@2.0.6";
        "http-proxy@1.18.1" = f "http-proxy" "1.18.1" y "401541f0534884bbf95260334e72f88ee3976549" [
          (s."eventemitter3@^4.0.0")
          (s."follow-redirects@^1.0.0")
          (s."requires-port@^1.0.0")
          ];
        "http-proxy@^1.18.1" = s."http-proxy@1.18.1";
        "https-browserify@1.0.0" = f "https-browserify" "1.0.0" y "ec06c10e0a34c0f2faf199f7fd7fc78fffd03c73" [];
        "https-browserify@^1.0.0" = s."https-browserify@1.0.0";
        "https-proxy-agent@5.0.1" = f "https-proxy-agent" "5.0.1" y "c59ef224a04fe8b754f3db0063a25ea30d0005d6" [
          (s."agent-base@6")
          (s."debug@4")
          ];
        "https-proxy-agent@^5.0.0" = s."https-proxy-agent@5.0.1";
        "human-signals@2.1.0" = f "human-signals" "2.1.0" y "dc91fcba42e4d06e4abaed33b3e7a3c02f514ea0" [];
        "human-signals@^2.1.0" = s."human-signals@2.1.0";
        "hyphenate-style-name@1.0.4" = f "hyphenate-style-name" "1.0.4" y "691879af8e220aea5750e8827db4ef62a54e361d" [];
        "hyphenate-style-name@^1.0.2" = s."hyphenate-style-name@1.0.4";
        "iconv-lite@0.4.24" = f "iconv-lite" "0.4.24" y "2022b4b25fbddc21d2f524974a474aafe733908b" [
          (s."safer-buffer@>= 2.1.2 < 3")
          ];
        "iconv-lite@0.6" = s."iconv-lite@0.6.3";
        "iconv-lite@0.6.3" = f "iconv-lite" "0.6.3" y "a52f80bf38da1952eb5c681790719871a1a72501" [
          (s."safer-buffer@>= 2.1.2 < 3.0.0")
          ];
        "iconv-lite@^0.6.3" = s."iconv-lite@0.6.3";
        "icss-utils@4.1.1" = f "icss-utils" "4.1.1" y "21170b53789ee27447c2f47dd683081403f9a467" [
          (s."postcss@^7.0.14")
          ];
        "icss-utils@5.1.0" = f "icss-utils" "5.1.0" y "c6be6858abd013d768e98366ae47e25d5887b1ae" [];
        "icss-utils@^4.0.0" = s."icss-utils@4.1.1";
        "icss-utils@^4.1.1" = s."icss-utils@4.1.1";
        "icss-utils@^5.0.0" = s."icss-utils@5.1.0";
        "icss-utils@^5.1.0" = s."icss-utils@5.1.0";
        "idb@6.1.5" = f "idb" "6.1.5" y "dbc53e7adf1ac7c59f9b2bf56e00b4ea4fce8c7b" [];
        "idb@^6.1.4" = s."idb@6.1.5";
        "identity-obj-proxy@3.0.0" = f "identity-obj-proxy" "3.0.0" y "94d2bda96084453ef36fbc5aaec37e0f79f1fc14" [
          (s."harmony-reflect@^1.4.6")
          ];
        "identity-obj-proxy@^3.0.0" = s."identity-obj-proxy@3.0.0";
        "ieee754@1.2.1" = f "ieee754" "1.2.1" y "8eb7a10a63fff25d15a57b001586d177d1b0d352" [];
        "ieee754@^1.1.4" = s."ieee754@1.2.1";
        "iferr@0.1.5" = f "iferr" "0.1.5" y "c60eed69e6d8fdb6b3104a1fcbca1c192dc5b501" [];
        "iferr@^0.1.5" = s."iferr@0.1.5";
        "ignore-walk@3.0.4" = f "ignore-walk" "3.0.4" y "c9a09f69b7c7b479a5d74ac1a3c0d4236d2a6335" [
          (s."minimatch@^3.0.4")
          ];
        "ignore@4.0.6" = f "ignore" "4.0.6" y "750e3db5862087b4737ebac8207ffd1ef27b25fc" [];
        "ignore@5.2.0" = f "ignore" "5.2.0" y "6d3bac8fa7fe0d45d9f9be7bac2fc279577e345a" [];
        "ignore@^4.0.3" = s."ignore@4.0.6";
        "ignore@^5.2.0" = s."ignore@5.2.0";
        "image-size@1.0.1" = f "image-size" "1.0.1" y "86d6cfc2b1d19eab5d2b368d4b9194d9e48541c5" [
          (s."queue@6.0.2")
          ];
        "image-size@^1.0.1" = s."image-size@1.0.1";
        "immer@9.0.15" = f "immer" "9.0.15" y "0b9169e5b1d22137aba7d43f8a81a495dd1b62dc" [];
        "immer@^9.0.7" = s."immer@9.0.15";
        "import-fresh@3.3.0" = f "import-fresh" "3.3.0" y "37162c25fcb9ebaa2e6e53d5b4d88ce17d9e0c2b" [
          (s."parent-module@^1.0.0")
          (s."resolve-from@^4.0.0")
          ];
        "import-fresh@^3.0.0" = s."import-fresh@3.3.0";
        "import-fresh@^3.1.0" = s."import-fresh@3.3.0";
        "import-fresh@^3.2.1" = s."import-fresh@3.3.0";
        "import-fresh@^3.3.0" = s."import-fresh@3.3.0";
        "import-lazy@2.1.0" = f "import-lazy" "2.1.0" y "05698e3d45c88e8d7e9d92cb0584e77f096f3e43" [];
        "import-lazy@^2.1.0" = s."import-lazy@2.1.0";
        "import-local@3.1.0" = f "import-local" "3.1.0" y "b4479df8a5fd44f6cdce24070675676063c95cb4" [
          (s."pkg-dir@^4.2.0")
          (s."resolve-cwd@^3.0.0")
          ];
        "import-local@^3.0.2" = s."import-local@3.1.0";
        "imurmurhash@0.1.4" = f "imurmurhash" "0.1.4" y "9218b9b2b928a238b13dc4fb6b6d576f231453ea" [];
        "imurmurhash@^0.1.4" = s."imurmurhash@0.1.4";
        "indent-string@2.1.0" = f "indent-string" "2.1.0" y "8e2d48348742121b4a8218b7a137e9a52049dc80" [
          (s."repeating@^2.0.0")
          ];
        "indent-string@4.0.0" = f "indent-string" "4.0.0" y "624f8f4497d619b2d9768531d58f4122854d7251" [];
        "indent-string@5.0.0" = f "indent-string" "5.0.0" y "4fd2980fccaf8622d14c64d694f4cf33c81951a5" [];
        "indent-string@^2.1.0" = s."indent-string@2.1.0";
        "indent-string@^4.0.0" = s."indent-string@4.0.0";
        "indent-string@^5.0.0" = s."indent-string@5.0.0";
        "infer-owner@1.0.4" = f "infer-owner" "1.0.4" y "c4cefcaa8e51051c2a40ba2ce8a3d27295af9467" [];
        "infer-owner@^1.0.3" = s."infer-owner@1.0.4";
        "infer-owner@^1.0.4" = s."infer-owner@1.0.4";
        "infima@0.2.0-alpha.42" = f "infima" "0.2.0-alpha.42" y "f6e86a655ad40877c6b4d11b2ede681eb5470aa5" [];
        "inflight@1.0.6" = f "inflight" "1.0.6" y "49bd6331d7d02d0c09bc910a1075ba8165b56df9" [
          (s."once@^1.3.0")
          (s."wrappy@1")
          ];
        "inflight@^1.0.4" = s."inflight@1.0.6";
        "inherits@2" = s."inherits@2.0.4";
        "inherits@2.0.1" = f "inherits" "2.0.1" y "b17d08d326b4423e568eff719f91b0b1cbdf69f1" [];
        "inherits@2.0.3" = f "inherits" "2.0.3" y "633c2c83e3da42a502f52466022480f4208261de" [];
        "inherits@2.0.4" = f "inherits" "2.0.4" y "0fa2c64f932917c3433a0ded55363aae37416b7c" [];
        "inherits@^2.0.0" = s."inherits@2.0.4";
        "inherits@^2.0.1" = s."inherits@2.0.4";
        "inherits@^2.0.3" = s."inherits@2.0.4";
        "inherits@^2.0.4" = s."inherits@2.0.4";
        "inherits@~2.0.1" = s."inherits@2.0.4";
        "inherits@~2.0.3" = s."inherits@2.0.4";
        "ini@1.3.8" = f "ini" "1.3.8" y "a29da425b48806f34767a4efce397269af28432c" [];
        "ini@2.0.0" = f "ini" "2.0.0" y "e5fd556ecdd5726be978fa1001862eacb0a94bc5" [];
        "ini@^1.3.5" = s."ini@1.3.8";
        "ini@~1.3.0" = s."ini@1.3.8";
        "inline-style-parser@0.1.1" = f "inline-style-parser" "0.1.1" y "ec8a3b429274e9c0a1f1c4ffa9453a7fef72cea1" [];
        "inline-style-prefixer@6.0.1" = f "inline-style-prefixer" "6.0.1" y "c5c0e43ba8831707afc5f5bbfd97edf45c1fa7ae" [
          (s."css-in-js-utils@^2.0.0")
          ];
        "inline-style-prefixer@^6.0.0" = s."inline-style-prefixer@6.0.1";
        "internal-slot@1.0.3" = f "internal-slot" "1.0.3" y "7347e307deeea2faac2ac6205d4bc7d34967f59c" [
          (s."get-intrinsic@^1.1.0")
          (s."has@^1.0.3")
          (s."side-channel@^1.0.4")
          ];
        "internal-slot@^1.0.3" = s."internal-slot@1.0.3";
        "internmap@1 - 2" = s."internmap@2.0.3";
        "internmap@2.0.3" = f "internmap" "2.0.3" y "6685f23755e43c524e251d29cbc97248e3061009" [];
        "interpret@1.4.0" = f "interpret" "1.4.0" y "665ab8bc4da27a774a40584e812e3e0fa45b1a1e" [];
        "interpret@2.2.0" = f "interpret" "2.2.0" y "1a78a0b5965c40a5416d007ad6f50ad27c417df9" [];
        "interpret@^1.0.0" = s."interpret@1.4.0";
        "interpret@^2.2.0" = s."interpret@2.2.0";
        "invariant@2.2.4" = f "invariant" "2.2.4" y "610f3c92c9359ce1db616e538008d23ff35158e6" [
          (s."loose-envify@^1.0.0")
          ];
        "invariant@^2.2.2" = s."invariant@2.2.4";
        "invariant@^2.2.4" = s."invariant@2.2.4";
        "ip@2.0.0" = f "ip" "2.0.0" y "4cf4ab182fee2314c75ede1276f8c80b479936da" [];
        "ip@^2.0.0" = s."ip@2.0.0";
        "ipaddr.js@1.9.1" = f "ipaddr.js" "1.9.1" y "bff38543eeb8984825079ff3a2a8e6cbd46781b3" [];
        "ipaddr.js@2.0.1" = f "ipaddr.js" "2.0.1" y "eca256a7a877e917aeb368b0a7497ddf42ef81c0" [];
        "ipaddr.js@^2.0.1" = s."ipaddr.js@2.0.1";
        "is-absolute-url@3.0.3" = f "is-absolute-url" "3.0.3" y "96c6a22b6a23929b11ea0afb1836c36ad4a5d698" [];
        "is-absolute-url@^3.0.0" = s."is-absolute-url@3.0.3";
        "is-accessor-descriptor@0.1.6" = f "is-accessor-descriptor" "0.1.6" y "a9e12cb3ae8d876727eeef3843f8a0897b5c98d6" [
          (s."kind-of@^3.0.2")
          ];
        "is-accessor-descriptor@1.0.0" = f "is-accessor-descriptor" "1.0.0" y "169c2f6d3df1f992618072365c9b0ea1f6878656" [
          (s."kind-of@^6.0.0")
          ];
        "is-accessor-descriptor@^0.1.6" = s."is-accessor-descriptor@0.1.6";
        "is-accessor-descriptor@^1.0.0" = s."is-accessor-descriptor@1.0.0";
        "is-alphabetical@1.0.4" = f "is-alphabetical" "1.0.4" y "9e7d6b94916be22153745d184c298cbf986a686d" [];
        "is-alphabetical@^1.0.0" = s."is-alphabetical@1.0.4";
        "is-alphanumerical@1.0.4" = f "is-alphanumerical" "1.0.4" y "7eb9a2431f855f6b1ef1a78e326df515696c4dbf" [
          (s."is-alphabetical@^1.0.0")
          (s."is-decimal@^1.0.0")
          ];
        "is-alphanumerical@^1.0.0" = s."is-alphanumerical@1.0.4";
        "is-arguments@1.1.1" = f "is-arguments" "1.1.1" y "15b3f88fda01f2a97fec84ca761a560f123efa9b" [
          (s."call-bind@^1.0.2")
          (s."has-tostringtag@^1.0.0")
          ];
        "is-arguments@^1.1.0" = s."is-arguments@1.1.1";
        "is-arrayish@0.2.1" = f "is-arrayish" "0.2.1" y "77c99840527aa8ecb1a8ba697b80645a7a926a9d" [];
        "is-arrayish@^0.2.1" = s."is-arrayish@0.2.1";
        "is-bigint@1.0.4" = f "is-bigint" "1.0.4" y "08147a1875bc2b32005d41ccd8291dffc6691df3" [
          (s."has-bigints@^1.0.1")
          ];
        "is-bigint@^1.0.1" = s."is-bigint@1.0.4";
        "is-binary-path@1.0.1" = f "is-binary-path" "1.0.1" y "75f16642b480f187a711c814161fd3a4a7655898" [
          (s."binary-extensions@^1.0.0")
          ];
        "is-binary-path@2.1.0" = f "is-binary-path" "2.1.0" y "ea1f7f3b80f064236e83470f86c09c254fb45b09" [
          (s."binary-extensions@^2.0.0")
          ];
        "is-binary-path@^1.0.0" = s."is-binary-path@1.0.1";
        "is-binary-path@~2.1.0" = s."is-binary-path@2.1.0";
        "is-boolean-object@1.1.2" = f "is-boolean-object" "1.1.2" y "5c6dc200246dd9321ae4b885a114bb1f75f63719" [
          (s."call-bind@^1.0.2")
          (s."has-tostringtag@^1.0.0")
          ];
        "is-boolean-object@^1.1.0" = s."is-boolean-object@1.1.2";
        "is-buffer@1.1.6" = f "is-buffer" "1.1.6" y "efaa2ea9daa0d7ab2ea13a97b2b8ad51fefbe8be" [];
        "is-buffer@2.0.5" = f "is-buffer" "2.0.5" y "ebc252e400d22ff8d77fa09888821a24a658c191" [];
        "is-buffer@^1.1.5" = s."is-buffer@1.1.6";
        "is-buffer@^2.0.0" = s."is-buffer@2.0.5";
        "is-callable@1.2.4" = f "is-callable" "1.2.4" y "47301d58dd0259407865547853df6d61fe471945" [];
        "is-callable@^1.1.4" = s."is-callable@1.2.4";
        "is-callable@^1.2.4" = s."is-callable@1.2.4";
        "is-ci@2.0.0" = f "is-ci" "2.0.0" y "6bc6334181810e04b5c22b3d589fdca55026404c" [
          (s."ci-info@^2.0.0")
          ];
        "is-ci@^2.0.0" = s."is-ci@2.0.0";
        "is-core-module@2.9.0" = f "is-core-module" "2.9.0" y "e1c34429cd51c6dd9e09e0799e396e27b19a9c69" [
          (s."has@^1.0.3")
          ];
        "is-core-module@^2.8.1" = s."is-core-module@2.9.0";
        "is-core-module@^2.9.0" = s."is-core-module@2.9.0";
        "is-data-descriptor@0.1.4" = f "is-data-descriptor" "0.1.4" y "0b5ee648388e2c860282e793f1856fec3f301b56" [
          (s."kind-of@^3.0.2")
          ];
        "is-data-descriptor@1.0.0" = f "is-data-descriptor" "1.0.0" y "d84876321d0e7add03990406abbbbd36ba9268c7" [
          (s."kind-of@^6.0.0")
          ];
        "is-data-descriptor@^0.1.4" = s."is-data-descriptor@0.1.4";
        "is-data-descriptor@^1.0.0" = s."is-data-descriptor@1.0.0";
        "is-date-object@1.0.5" = f "is-date-object" "1.0.5" y "0841d5536e724c25597bf6ea62e1bd38298df31f" [
          (s."has-tostringtag@^1.0.0")
          ];
        "is-date-object@^1.0.1" = s."is-date-object@1.0.5";
        "is-decimal@1.0.4" = f "is-decimal" "1.0.4" y "65a3a5958a1c5b63a706e1b333d7cd9f630d3fa5" [];
        "is-decimal@^1.0.0" = s."is-decimal@1.0.4";
        "is-descriptor@0.1.6" = f "is-descriptor" "0.1.6" y "366d8240dde487ca51823b1ab9f07a10a78251ca" [
          (s."is-accessor-descriptor@^0.1.6")
          (s."is-data-descriptor@^0.1.4")
          (s."kind-of@^5.0.0")
          ];
        "is-descriptor@1.0.2" = f "is-descriptor" "1.0.2" y "3b159746a66604b04f8c81524ba365c5f14d86ec" [
          (s."is-accessor-descriptor@^1.0.0")
          (s."is-data-descriptor@^1.0.0")
          (s."kind-of@^6.0.2")
          ];
        "is-descriptor@^0.1.0" = s."is-descriptor@0.1.6";
        "is-descriptor@^1.0.0" = s."is-descriptor@1.0.2";
        "is-descriptor@^1.0.2" = s."is-descriptor@1.0.2";
        "is-docker@2.2.1" = f "is-docker" "2.2.1" y "33eeabe23cfe86f14bde4408a02c0cfb853acdaa" [];
        "is-docker@^2.0.0" = s."is-docker@2.2.1";
        "is-docker@^2.1.1" = s."is-docker@2.2.1";
        "is-dom@1.1.0" = f "is-dom" "1.1.0" y "af1fced292742443bb59ca3f76ab5e80907b4e8a" [
          (s."is-object@^1.0.1")
          (s."is-window@^1.0.2")
          ];
        "is-dom@^1.0.0" = s."is-dom@1.1.0";
        "is-extendable@0.1.1" = f "is-extendable" "0.1.1" y "62b110e289a471418e3ec36a617d472e301dfc89" [];
        "is-extendable@1.0.1" = f "is-extendable" "1.0.1" y "a7470f9e426733d81bd81e1155264e3a3507cab4" [
          (s."is-plain-object@^2.0.4")
          ];
        "is-extendable@^0.1.0" = s."is-extendable@0.1.1";
        "is-extendable@^0.1.1" = s."is-extendable@0.1.1";
        "is-extendable@^1.0.1" = s."is-extendable@1.0.1";
        "is-extglob@2.1.1" = f "is-extglob" "2.1.1" y "a88c02535791f02ed37c76a1b9ea9773c833f8c2" [];
        "is-extglob@^2.1.0" = s."is-extglob@2.1.1";
        "is-extglob@^2.1.1" = s."is-extglob@2.1.1";
        "is-finite@1.1.0" = f "is-finite" "1.1.0" y "904135c77fb42c0641d6aa1bcdbc4daa8da082f3" [];
        "is-finite@^1.0.0" = s."is-finite@1.1.0";
        "is-fullwidth-code-point@3.0.0" = f "is-fullwidth-code-point" "3.0.0" y "f116f8064fe90b3f7844a38997c0b75051269f1d" [];
        "is-fullwidth-code-point@^3.0.0" = s."is-fullwidth-code-point@3.0.0";
        "is-function@1.0.2" = f "is-function" "1.0.2" y "4f097f30abf6efadac9833b17ca5dc03f8144e08" [];
        "is-function@^1.0.2" = s."is-function@1.0.2";
        "is-generator-fn@2.1.0" = f "is-generator-fn" "2.1.0" y "7d140adc389aaf3011a8f2a2a4cfa6faadffb118" [];
        "is-generator-fn@^2.0.0" = s."is-generator-fn@2.1.0";
        "is-glob@3.1.0" = f "is-glob" "3.1.0" y "7ba5ae24217804ac70707b96922567486cc3e84a" [
          (s."is-extglob@^2.1.0")
          ];
        "is-glob@4.0.3" = f "is-glob" "4.0.3" y "64f61e42cbbb2eec2071a9dac0b28ba1e65d5084" [
          (s."is-extglob@^2.1.1")
          ];
        "is-glob@^3.0.0" = s."is-glob@3.1.0";
        "is-glob@^3.1.0" = s."is-glob@3.1.0";
        "is-glob@^4.0.0" = s."is-glob@4.0.3";
        "is-glob@^4.0.1" = s."is-glob@4.0.3";
        "is-glob@^4.0.3" = s."is-glob@4.0.3";
        "is-glob@~4.0.1" = s."is-glob@4.0.3";
        "is-hexadecimal@1.0.4" = f "is-hexadecimal" "1.0.4" y "cc35c97588da4bd49a8eedd6bc4082d44dcb23a7" [];
        "is-hexadecimal@^1.0.0" = s."is-hexadecimal@1.0.4";
        "is-installed-globally@0.4.0" = f "is-installed-globally" "0.4.0" y "9a0fd407949c30f86eb6959ef1b7994ed0b7b520" [
          (s."global-dirs@^3.0.0")
          (s."is-path-inside@^3.0.2")
          ];
        "is-installed-globally@^0.4.0" = s."is-installed-globally@0.4.0";
        "is-map@2.0.2" = f "is-map" "2.0.2" y "00922db8c9bf73e81b7a335827bc2a43f2b91127" [];
        "is-map@^2.0.2" = s."is-map@2.0.2";
        "is-module@1.0.0" = f "is-module" "1.0.0" y "3258fb69f78c14d5b815d664336b4cffb6441591" [];
        "is-module@^1.0.0" = s."is-module@1.0.0";
        "is-negative-zero@2.0.2" = f "is-negative-zero" "2.0.2" y "7bf6f03a28003b8b3965de3ac26f664d765f3150" [];
        "is-negative-zero@^2.0.2" = s."is-negative-zero@2.0.2";
        "is-npm@5.0.0" = f "is-npm" "5.0.0" y "43e8d65cc56e1b67f8d47262cf667099193f45a8" [];
        "is-npm@^5.0.0" = s."is-npm@5.0.0";
        "is-number-object@1.0.7" = f "is-number-object" "1.0.7" y "59d50ada4c45251784e9904f5246c742f07a42fc" [
          (s."has-tostringtag@^1.0.0")
          ];
        "is-number-object@^1.0.4" = s."is-number-object@1.0.7";
        "is-number@3.0.0" = f "is-number" "3.0.0" y "24fd6201a4782cf50561c810276afc7d12d71195" [
          (s."kind-of@^3.0.2")
          ];
        "is-number@7.0.0" = f "is-number" "7.0.0" y "7535345b896734d5f80c4d06c50955527a14f12b" [];
        "is-number@^3.0.0" = s."is-number@3.0.0";
        "is-number@^7.0.0" = s."is-number@7.0.0";
        "is-obj@1.0.1" = f "is-obj" "1.0.1" y "3e4729ac1f5fde025cd7d83a896dab9f4f67db0f" [];
        "is-obj@2.0.0" = f "is-obj" "2.0.0" y "473fb05d973705e3fd9620545018ca8e22ef4982" [];
        "is-obj@^1.0.1" = s."is-obj@1.0.1";
        "is-obj@^2.0.0" = s."is-obj@2.0.0";
        "is-object@1.0.2" = f "is-object" "1.0.2" y "a56552e1c665c9e950b4a025461da87e72f86fcf" [];
        "is-object@^1.0.1" = s."is-object@1.0.2";
        "is-path-cwd@2.2.0" = f "is-path-cwd" "2.2.0" y "67d43b82664a7b5191fd9119127eb300048a9fdb" [];
        "is-path-cwd@^2.2.0" = s."is-path-cwd@2.2.0";
        "is-path-inside@3.0.3" = f "is-path-inside" "3.0.3" y "d231362e53a07ff2b0e0ea7fed049161ffd16283" [];
        "is-path-inside@^3.0.2" = s."is-path-inside@3.0.3";
        "is-plain-obj@2.1.0" = f "is-plain-obj" "2.1.0" y "45e42e37fccf1f40da8e5f76ee21515840c09287" [];
        "is-plain-obj@3.0.0" = f "is-plain-obj" "3.0.0" y "af6f2ea14ac5a646183a5bbdb5baabbc156ad9d7" [];
        "is-plain-obj@^2.0.0" = s."is-plain-obj@2.1.0";
        "is-plain-obj@^3.0.0" = s."is-plain-obj@3.0.0";
        "is-plain-object@2.0.4" = f "is-plain-object" "2.0.4" y "2c163b3fafb1b606d9d17928f05c2a1c38e07677" [
          (s."isobject@^3.0.1")
          ];
        "is-plain-object@5.0.0" = f "is-plain-object" "5.0.0" y "4427f50ab3429e9025ea7d52e9043a9ef4159344" [];
        "is-plain-object@^2.0.3" = s."is-plain-object@2.0.4";
        "is-plain-object@^2.0.4" = s."is-plain-object@2.0.4";
        "is-potential-custom-element-name@1.0.1" = f "is-potential-custom-element-name" "1.0.1" y "171ed6f19e3ac554394edf78caa05784a45bebb5" [];
        "is-potential-custom-element-name@^1.0.1" = s."is-potential-custom-element-name@1.0.1";
        "is-regex@1.1.4" = f "is-regex" "1.1.4" y "eef5663cd59fa4c0ae339505323df6854bb15958" [
          (s."call-bind@^1.0.2")
          (s."has-tostringtag@^1.0.0")
          ];
        "is-regex@^1.1.2" = s."is-regex@1.1.4";
        "is-regex@^1.1.4" = s."is-regex@1.1.4";
        "is-regexp@1.0.0" = f "is-regexp" "1.0.0" y "fd2d883545c46bac5a633e7b9a09e87fa2cb5069" [];
        "is-regexp@^1.0.0" = s."is-regexp@1.0.0";
        "is-root@2.1.0" = f "is-root" "2.1.0" y "809e18129cf1129644302a4f8544035d51984a9c" [];
        "is-root@^2.1.0" = s."is-root@2.1.0";
        "is-set@2.0.2" = f "is-set" "2.0.2" y "90755fa4c2562dc1c5d4024760d6119b94ca18ec" [];
        "is-set@^2.0.2" = s."is-set@2.0.2";
        "is-shared-array-buffer@1.0.2" = f "is-shared-array-buffer" "1.0.2" y "8f259c573b60b6a32d4058a1a07430c0a7344c79" [
          (s."call-bind@^1.0.2")
          ];
        "is-shared-array-buffer@^1.0.2" = s."is-shared-array-buffer@1.0.2";
        "is-stream@1.1.0" = f "is-stream" "1.1.0" y "12d4a3dd4e68e0b79ceb8dbc84173ae80d91ca44" [];
        "is-stream@2.0.1" = f "is-stream" "2.0.1" y "fac1e3d53b97ad5a9d0ae9cef2389f5810a5c077" [];
        "is-stream@^1.1.0" = s."is-stream@1.1.0";
        "is-stream@^2.0.0" = s."is-stream@2.0.1";
        "is-string@1.0.7" = f "is-string" "1.0.7" y "0dd12bf2006f255bb58f695110eff7491eebc0fd" [
          (s."has-tostringtag@^1.0.0")
          ];
        "is-string@^1.0.5" = s."is-string@1.0.7";
        "is-string@^1.0.7" = s."is-string@1.0.7";
        "is-symbol@1.0.4" = f "is-symbol" "1.0.4" y "a6dac93b635b063ca6872236de88910a57af139c" [
          (s."has-symbols@^1.0.2")
          ];
        "is-symbol@^1.0.2" = s."is-symbol@1.0.4";
        "is-symbol@^1.0.3" = s."is-symbol@1.0.4";
        "is-typedarray@1.0.0" = f "is-typedarray" "1.0.0" y "e479c80858df0c1b11ddda6940f96011fcda4a9a" [];
        "is-typedarray@^1.0.0" = s."is-typedarray@1.0.0";
        "is-utf8@0.2.1" = f "is-utf8" "0.2.1" y "4b0da1442104d1b336340e80797e865cf39f7d72" [];
        "is-utf8@^0.2.0" = s."is-utf8@0.2.1";
        "is-weakref@1.0.2" = f "is-weakref" "1.0.2" y "9529f383a9338205e89765e0392efc2f100f06f2" [
          (s."call-bind@^1.0.2")
          ];
        "is-weakref@^1.0.2" = s."is-weakref@1.0.2";
        "is-whitespace-character@1.0.4" = f "is-whitespace-character" "1.0.4" y "0858edd94a95594c7c9dd0b5c174ec6e45ee4aa7" [];
        "is-whitespace-character@^1.0.0" = s."is-whitespace-character@1.0.4";
        "is-window@1.0.2" = f "is-window" "1.0.2" y "2c896ca53db97de45d3c33133a65d8c9f563480d" [];
        "is-window@^1.0.2" = s."is-window@1.0.2";
        "is-windows@1.0.2" = f "is-windows" "1.0.2" y "d1850eb9791ecd18e6182ce12a30f396634bb19d" [];
        "is-windows@^1.0.2" = s."is-windows@1.0.2";
        "is-word-character@1.0.4" = f "is-word-character" "1.0.4" y "ce0e73216f98599060592f62ff31354ddbeb0230" [];
        "is-word-character@^1.0.0" = s."is-word-character@1.0.4";
        "is-wsl@1.1.0" = f "is-wsl" "1.1.0" y "1f16e4aa22b04d1336b66188a66af3c600c3a66d" [];
        "is-wsl@2.2.0" = f "is-wsl" "2.2.0" y "74a4c76e77ca9fd3f932f290c17ea326cd157271" [
          (s."is-docker@^2.0.0")
          ];
        "is-wsl@^1.1.0" = s."is-wsl@1.1.0";
        "is-wsl@^2.1.1" = s."is-wsl@2.2.0";
        "is-wsl@^2.2.0" = s."is-wsl@2.2.0";
        "is-yarn-global@0.3.0" = f "is-yarn-global" "0.3.0" y "d502d3382590ea3004893746754c89139973e232" [];
        "is-yarn-global@^0.3.0" = s."is-yarn-global@0.3.0";
        "isarray@0.0.1" = f "isarray" "0.0.1" y "8a18acfca9a8f4177e09abfc6038939b05d1eedf" [];
        "isarray@1.0.0" = f "isarray" "1.0.0" y "bb935d48582cba168c06834957a54a3e07124f11" [];
        "isarray@2.0.5" = f "isarray" "2.0.5" y "8af1e4c1221244cc62459faf38940d4e644a5723" [];
        "isarray@^1.0.0" = s."isarray@1.0.0";
        "isarray@^2.0.5" = s."isarray@2.0.5";
        "isarray@~1.0.0" = s."isarray@1.0.0";
        "isexe@2.0.0" = f "isexe" "2.0.0" y "e8fbf374dc556ff8947a10dcb0572d633f2cfa10" [];
        "isexe@^2.0.0" = s."isexe@2.0.0";
        "isobject@2.1.0" = f "isobject" "2.1.0" y "f065561096a3f1da2ef46272f815c840d87e0c89" [
          (s."isarray@1.0.0")
          ];
        "isobject@3.0.1" = f "isobject" "3.0.1" y "4e431e92b11a9731636aa1f9c8d1ccbcfdab78df" [];
        "isobject@4.0.0" = f "isobject" "4.0.0" y "3f1c9155e73b192022a80819bacd0343711697b0" [];
        "isobject@^2.0.0" = s."isobject@2.1.0";
        "isobject@^3.0.0" = s."isobject@3.0.1";
        "isobject@^3.0.1" = s."isobject@3.0.1";
        "isobject@^4.0.0" = s."isobject@4.0.0";
        "isomorphic-unfetch@3.1.0" = f "isomorphic-unfetch" "3.1.0" y "87341d5f4f7b63843d468438128cb087b7c3e98f" [
          (s."node-fetch@^2.6.1")
          (s."unfetch@^4.2.0")
          ];
        "isomorphic-unfetch@^3.1.0" = s."isomorphic-unfetch@3.1.0";
        "istanbul-lib-coverage@3.2.0" = f "istanbul-lib-coverage" "3.2.0" y "189e7909d0a39fa5a3dfad5b03f71947770191d3" [];
        "istanbul-lib-coverage@^3.0.0" = s."istanbul-lib-coverage@3.2.0";
        "istanbul-lib-coverage@^3.2.0" = s."istanbul-lib-coverage@3.2.0";
        "istanbul-lib-hook@3.0.0" = f "istanbul-lib-hook" "3.0.0" y "8f84c9434888cc6b1d0a9d7092a76d239ebf0cc6" [
          (s."append-transform@^2.0.0")
          ];
        "istanbul-lib-hook@^3.0.0" = s."istanbul-lib-hook@3.0.0";
        "istanbul-lib-instrument@4.0.3" = f "istanbul-lib-instrument" "4.0.3" y "873c6fff897450118222774696a3f28902d77c1d" [
          (s."@babel/core@^7.7.5")
          (s."@istanbuljs/schema@^0.1.2")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."semver@^6.3.0")
          ];
        "istanbul-lib-instrument@5.2.0" = f "istanbul-lib-instrument" "5.2.0" y "31d18bdd127f825dd02ea7bfdfd906f8ab840e9f" [
          (s."@babel/core@^7.12.3")
          (s."@babel/parser@^7.14.7")
          (s."@istanbuljs/schema@^0.1.2")
          (s."istanbul-lib-coverage@^3.2.0")
          (s."semver@^6.3.0")
          ];
        "istanbul-lib-instrument@^4.0.0" = s."istanbul-lib-instrument@4.0.3";
        "istanbul-lib-instrument@^5.0.4" = s."istanbul-lib-instrument@5.2.0";
        "istanbul-lib-instrument@^5.1.0" = s."istanbul-lib-instrument@5.2.0";
        "istanbul-lib-processinfo@2.0.3" = f "istanbul-lib-processinfo" "2.0.3" y "366d454cd0dcb7eb6e0e419378e60072c8626169" [
          (s."archy@^1.0.0")
          (s."cross-spawn@^7.0.3")
          (s."istanbul-lib-coverage@^3.2.0")
          (s."p-map@^3.0.0")
          (s."rimraf@^3.0.0")
          (s."uuid@^8.3.2")
          ];
        "istanbul-lib-processinfo@^2.0.2" = s."istanbul-lib-processinfo@2.0.3";
        "istanbul-lib-report@3.0.0" = f "istanbul-lib-report" "3.0.0" y "7518fe52ea44de372f460a76b5ecda9ffb73d8a6" [
          (s."istanbul-lib-coverage@^3.0.0")
          (s."make-dir@^3.0.0")
          (s."supports-color@^7.1.0")
          ];
        "istanbul-lib-report@^3.0.0" = s."istanbul-lib-report@3.0.0";
        "istanbul-lib-source-maps@4.0.1" = f "istanbul-lib-source-maps" "4.0.1" y "895f3a709fcfba34c6de5a42939022f3e4358551" [
          (s."debug@^4.1.1")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."source-map@^0.6.1")
          ];
        "istanbul-lib-source-maps@^4.0.0" = s."istanbul-lib-source-maps@4.0.1";
        "istanbul-reports@3.1.4" = f "istanbul-reports" "3.1.4" y "1b6f068ecbc6c331040aab5741991273e609e40c" [
          (s."html-escaper@^2.0.0")
          (s."istanbul-lib-report@^3.0.0")
          ];
        "istanbul-reports@^3.0.2" = s."istanbul-reports@3.1.4";
        "istanbul-reports@^3.1.3" = s."istanbul-reports@3.1.4";
        "istanbul-reports@^3.1.4" = s."istanbul-reports@3.1.4";
        "iterate-iterator@1.0.2" = f "iterate-iterator" "1.0.2" y "551b804c9eaa15b847ea6a7cdc2f5bf1ec150f91" [];
        "iterate-iterator@^1.0.1" = s."iterate-iterator@1.0.2";
        "iterate-value@1.0.2" = f "iterate-value" "1.0.2" y "935115bd37d006a52046535ebc8d07e9c9337f57" [
          (s."es-get-iterator@^1.0.2")
          (s."iterate-iterator@^1.0.1")
          ];
        "iterate-value@^1.0.2" = s."iterate-value@1.0.2";
        "jake@10.8.5" = f "jake" "10.8.5" y "f2183d2c59382cb274226034543b9c03b8164c46" [
          (s."async@^3.2.3")
          (s."chalk@^4.0.2")
          (s."filelist@^1.0.1")
          (s."minimatch@^3.0.4")
          ];
        "jake@^10.8.5" = s."jake@10.8.5";
        "javascript-natural-sort@0.7.1" = f "javascript-natural-sort" "0.7.1" y "f9e2303d4507f6d74355a73664d1440fb5a0ef59" [];
        "javascript-natural-sort@^0.7.1" = s."javascript-natural-sort@0.7.1";
        "jest-changed-files@27.5.1" = f "jest-changed-files" "27.5.1" y "a348aed00ec9bf671cc58a66fcbe7c3dfd6a68f5" [
          (s."@jest/types@^27.5.1")
          (s."execa@^5.0.0")
          (s."throat@^6.0.1")
          ];
        "jest-changed-files@^27.5.1" = s."jest-changed-files@27.5.1";
        "jest-circus@27.5.1" = f "jest-circus" "27.5.1" y "37a5a4459b7bf4406e53d637b49d22c65d125ecc" [
          (s."@jest/environment@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."co@^4.6.0")
          (s."dedent@^0.7.0")
          (s."expect@^27.5.1")
          (s."is-generator-fn@^2.0.0")
          (s."jest-each@^27.5.1")
          (s."jest-matcher-utils@^27.5.1")
          (s."jest-message-util@^27.5.1")
          (s."jest-runtime@^27.5.1")
          (s."jest-snapshot@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."pretty-format@^27.5.1")
          (s."slash@^3.0.0")
          (s."stack-utils@^2.0.3")
          (s."throat@^6.0.1")
          ];
        "jest-circus@^27.5.1" = s."jest-circus@27.5.1";
        "jest-cli@27.5.1" = f "jest-cli" "27.5.1" y "278794a6e6458ea8029547e6c6cbf673bd30b145" [
          (s."@jest/core@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."chalk@^4.0.0")
          (s."exit@^0.1.2")
          (s."graceful-fs@^4.2.9")
          (s."import-local@^3.0.2")
          (s."jest-config@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jest-validate@^27.5.1")
          (s."prompts@^2.0.1")
          (s."yargs@^16.2.0")
          ];
        "jest-cli@^27.5.1" = s."jest-cli@27.5.1";
        "jest-config@27.5.1" = f "jest-config" "27.5.1" y "5c387de33dca3f99ad6357ddeccd91bf3a0e4a41" [
          (s."@babel/core@^7.8.0")
          (s."@jest/test-sequencer@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."babel-jest@^27.5.1")
          (s."chalk@^4.0.0")
          (s."ci-info@^3.2.0")
          (s."deepmerge@^4.2.2")
          (s."glob@^7.1.1")
          (s."graceful-fs@^4.2.9")
          (s."jest-circus@^27.5.1")
          (s."jest-environment-jsdom@^27.5.1")
          (s."jest-environment-node@^27.5.1")
          (s."jest-get-type@^27.5.1")
          (s."jest-jasmine2@^27.5.1")
          (s."jest-regex-util@^27.5.1")
          (s."jest-resolve@^27.5.1")
          (s."jest-runner@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jest-validate@^27.5.1")
          (s."micromatch@^4.0.4")
          (s."parse-json@^5.2.0")
          (s."pretty-format@^27.5.1")
          (s."slash@^3.0.0")
          (s."strip-json-comments@^3.1.1")
          ];
        "jest-config@^27.5.1" = s."jest-config@27.5.1";
        "jest-diff@27.5.1" = f "jest-diff" "27.5.1" y "a07f5011ac9e6643cf8a95a462b7b1ecf6680def" [
          (s."chalk@^4.0.0")
          (s."diff-sequences@^27.5.1")
          (s."jest-get-type@^27.5.1")
          (s."pretty-format@^27.5.1")
          ];
        "jest-diff@28.1.1" = f "jest-diff" "28.1.1" y "1a3eedfd81ae79810931c63a1d0f201b9120106c" [
          (s."chalk@^4.0.0")
          (s."diff-sequences@^28.1.1")
          (s."jest-get-type@^28.0.2")
          (s."pretty-format@^28.1.1")
          ];
        "jest-diff@^27.5.1" = s."jest-diff@27.5.1";
        "jest-diff@^28.1.1" = s."jest-diff@28.1.1";
        "jest-docblock@27.5.1" = f "jest-docblock" "27.5.1" y "14092f364a42c6108d42c33c8cf30e058e25f6c0" [
          (s."detect-newline@^3.0.0")
          ];
        "jest-docblock@^27.5.1" = s."jest-docblock@27.5.1";
        "jest-each@27.5.1" = f "jest-each" "27.5.1" y "5bc87016f45ed9507fed6e4702a5b468a5b2c44e" [
          (s."@jest/types@^27.5.1")
          (s."chalk@^4.0.0")
          (s."jest-get-type@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."pretty-format@^27.5.1")
          ];
        "jest-each@^27.5.1" = s."jest-each@27.5.1";
        "jest-environment-jsdom@27.5.1" = f "jest-environment-jsdom" "27.5.1" y "ea9ccd1fc610209655a77898f86b2b559516a546" [
          (s."@jest/environment@^27.5.1")
          (s."@jest/fake-timers@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."jest-mock@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jsdom@^16.6.0")
          ];
        "jest-environment-jsdom@^27.5.1" = s."jest-environment-jsdom@27.5.1";
        "jest-environment-node@27.5.1" = f "jest-environment-node" "27.5.1" y "dedc2cfe52fab6b8f5714b4808aefa85357a365e" [
          (s."@jest/environment@^27.5.1")
          (s."@jest/fake-timers@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."jest-mock@^27.5.1")
          (s."jest-util@^27.5.1")
          ];
        "jest-environment-node@^27.5.1" = s."jest-environment-node@27.5.1";
        "jest-get-type@27.5.1" = f "jest-get-type" "27.5.1" y "3cd613c507b0f7ace013df407a1c1cd578bcb4f1" [];
        "jest-get-type@28.0.2" = f "jest-get-type" "28.0.2" y "34622e628e4fdcd793d46db8a242227901fcf203" [];
        "jest-get-type@^27.5.1" = s."jest-get-type@27.5.1";
        "jest-get-type@^28.0.2" = s."jest-get-type@28.0.2";
        "jest-haste-map@26.6.2" = f "jest-haste-map" "26.6.2" y "dd7e60fe7dc0e9f911a23d79c5ff7fb5c2cafeaa" [
          (s."@jest/types@^26.6.2")
          (s."@types/graceful-fs@^4.1.2")
          (s."@types/node@*")
          (s."anymatch@^3.0.3")
          (s."fb-watchman@^2.0.0")
          (s."graceful-fs@^4.2.4")
          (s."jest-regex-util@^26.0.0")
          (s."jest-serializer@^26.6.2")
          (s."jest-util@^26.6.2")
          (s."jest-worker@^26.6.2")
          (s."micromatch@^4.0.2")
          (s."sane@^4.0.3")
          (s."walker@^1.0.7")
          (s."fsevents@^2.1.2")
          ];
        "jest-haste-map@27.5.1" = f "jest-haste-map" "27.5.1" y "9fd8bd7e7b4fa502d9c6164c5640512b4e811e7f" [
          (s."@jest/types@^27.5.1")
          (s."@types/graceful-fs@^4.1.2")
          (s."@types/node@*")
          (s."anymatch@^3.0.3")
          (s."fb-watchman@^2.0.0")
          (s."graceful-fs@^4.2.9")
          (s."jest-regex-util@^27.5.1")
          (s."jest-serializer@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jest-worker@^27.5.1")
          (s."micromatch@^4.0.4")
          (s."walker@^1.0.7")
          (s."fsevents@^2.3.2")
          ];
        "jest-haste-map@^26.6.2" = s."jest-haste-map@26.6.2";
        "jest-haste-map@^27.5.1" = s."jest-haste-map@27.5.1";
        "jest-jasmine2@27.5.1" = f "jest-jasmine2" "27.5.1" y "a037b0034ef49a9f3d71c4375a796f3b230d1ac4" [
          (s."@jest/environment@^27.5.1")
          (s."@jest/source-map@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."co@^4.6.0")
          (s."expect@^27.5.1")
          (s."is-generator-fn@^2.0.0")
          (s."jest-each@^27.5.1")
          (s."jest-matcher-utils@^27.5.1")
          (s."jest-message-util@^27.5.1")
          (s."jest-runtime@^27.5.1")
          (s."jest-snapshot@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."pretty-format@^27.5.1")
          (s."throat@^6.0.1")
          ];
        "jest-jasmine2@^27.5.1" = s."jest-jasmine2@27.5.1";
        "jest-leak-detector@27.5.1" = f "jest-leak-detector" "27.5.1" y "6ec9d54c3579dd6e3e66d70e3498adf80fde3fb8" [
          (s."jest-get-type@^27.5.1")
          (s."pretty-format@^27.5.1")
          ];
        "jest-leak-detector@^27.5.1" = s."jest-leak-detector@27.5.1";
        "jest-matcher-utils@27.5.1" = f "jest-matcher-utils" "27.5.1" y "9c0cdbda8245bc22d2331729d1091308b40cf8ab" [
          (s."chalk@^4.0.0")
          (s."jest-diff@^27.5.1")
          (s."jest-get-type@^27.5.1")
          (s."pretty-format@^27.5.1")
          ];
        "jest-matcher-utils@28.1.1" = f "jest-matcher-utils" "28.1.1" y "a7c4653c2b782ec96796eb3088060720f1e29304" [
          (s."chalk@^4.0.0")
          (s."jest-diff@^28.1.1")
          (s."jest-get-type@^28.0.2")
          (s."pretty-format@^28.1.1")
          ];
        "jest-matcher-utils@^27.0.0" = s."jest-matcher-utils@27.5.1";
        "jest-matcher-utils@^27.5.1" = s."jest-matcher-utils@27.5.1";
        "jest-matcher-utils@^28.0.0" = s."jest-matcher-utils@28.1.1";
        "jest-message-util@27.5.1" = f "jest-message-util" "27.5.1" y "bdda72806da10d9ed6425e12afff38cd1458b6cf" [
          (s."@babel/code-frame@^7.12.13")
          (s."@jest/types@^27.5.1")
          (s."@types/stack-utils@^2.0.0")
          (s."chalk@^4.0.0")
          (s."graceful-fs@^4.2.9")
          (s."micromatch@^4.0.4")
          (s."pretty-format@^27.5.1")
          (s."slash@^3.0.0")
          (s."stack-utils@^2.0.3")
          ];
        "jest-message-util@28.1.1" = f "jest-message-util" "28.1.1" y "60aa0b475cfc08c8a9363ed2fb9108514dd9ab89" [
          (s."@babel/code-frame@^7.12.13")
          (s."@jest/types@^28.1.1")
          (s."@types/stack-utils@^2.0.0")
          (s."chalk@^4.0.0")
          (s."graceful-fs@^4.2.9")
          (s."micromatch@^4.0.4")
          (s."pretty-format@^28.1.1")
          (s."slash@^3.0.0")
          (s."stack-utils@^2.0.3")
          ];
        "jest-message-util@^27.5.1" = s."jest-message-util@27.5.1";
        "jest-message-util@^28.1.1" = s."jest-message-util@28.1.1";
        "jest-mock@27.5.1" = f "jest-mock" "27.5.1" y "19948336d49ef4d9c52021d34ac7b5f36ff967d6" [
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          ];
        "jest-mock@^27.5.1" = s."jest-mock@27.5.1";
        "jest-pnp-resolver@1.2.2" = f "jest-pnp-resolver" "1.2.2" y "b704ac0ae028a89108a4d040b3f919dfddc8e33c" [];
        "jest-pnp-resolver@^1.2.2" = s."jest-pnp-resolver@1.2.2";
        "jest-regex-util@26.0.0" = f "jest-regex-util" "26.0.0" y "d25e7184b36e39fd466c3bc41be0971e821fee28" [];
        "jest-regex-util@27.5.1" = f "jest-regex-util" "27.5.1" y "4da143f7e9fd1e542d4aa69617b38e4a78365b95" [];
        "jest-regex-util@28.0.2" = f "jest-regex-util" "28.0.2" y "afdc377a3b25fb6e80825adcf76c854e5bf47ead" [];
        "jest-regex-util@^26.0.0" = s."jest-regex-util@26.0.0";
        "jest-regex-util@^27.5.1" = s."jest-regex-util@27.5.1";
        "jest-regex-util@^28.0.0" = s."jest-regex-util@28.0.2";
        "jest-resolve-dependencies@27.5.1" = f "jest-resolve-dependencies" "27.5.1" y "d811ecc8305e731cc86dd79741ee98fed06f1da8" [
          (s."@jest/types@^27.5.1")
          (s."jest-regex-util@^27.5.1")
          (s."jest-snapshot@^27.5.1")
          ];
        "jest-resolve-dependencies@^27.5.1" = s."jest-resolve-dependencies@27.5.1";
        "jest-resolve@27.5.1" = f "jest-resolve" "27.5.1" y "a2f1c5a0796ec18fe9eb1536ac3814c23617b384" [
          (s."@jest/types@^27.5.1")
          (s."chalk@^4.0.0")
          (s."graceful-fs@^4.2.9")
          (s."jest-haste-map@^27.5.1")
          (s."jest-pnp-resolver@^1.2.2")
          (s."jest-util@^27.5.1")
          (s."jest-validate@^27.5.1")
          (s."resolve@^1.20.0")
          (s."resolve.exports@^1.1.0")
          (s."slash@^3.0.0")
          ];
        "jest-resolve@^27.4.2" = s."jest-resolve@27.5.1";
        "jest-resolve@^27.5.1" = s."jest-resolve@27.5.1";
        "jest-runner@27.5.1" = f "jest-runner" "27.5.1" y "071b27c1fa30d90540805c5645a0ec167c7b62e5" [
          (s."@jest/console@^27.5.1")
          (s."@jest/environment@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/transform@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."emittery@^0.8.1")
          (s."graceful-fs@^4.2.9")
          (s."jest-docblock@^27.5.1")
          (s."jest-environment-jsdom@^27.5.1")
          (s."jest-environment-node@^27.5.1")
          (s."jest-haste-map@^27.5.1")
          (s."jest-leak-detector@^27.5.1")
          (s."jest-message-util@^27.5.1")
          (s."jest-resolve@^27.5.1")
          (s."jest-runtime@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."jest-worker@^27.5.1")
          (s."source-map-support@^0.5.6")
          (s."throat@^6.0.1")
          ];
        "jest-runner@^27.5.1" = s."jest-runner@27.5.1";
        "jest-runtime@27.5.1" = f "jest-runtime" "27.5.1" y "4896003d7a334f7e8e4a53ba93fb9bcd3db0a1af" [
          (s."@jest/environment@^27.5.1")
          (s."@jest/fake-timers@^27.5.1")
          (s."@jest/globals@^27.5.1")
          (s."@jest/source-map@^27.5.1")
          (s."@jest/test-result@^27.5.1")
          (s."@jest/transform@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."chalk@^4.0.0")
          (s."cjs-module-lexer@^1.0.0")
          (s."collect-v8-coverage@^1.0.0")
          (s."execa@^5.0.0")
          (s."glob@^7.1.3")
          (s."graceful-fs@^4.2.9")
          (s."jest-haste-map@^27.5.1")
          (s."jest-message-util@^27.5.1")
          (s."jest-mock@^27.5.1")
          (s."jest-regex-util@^27.5.1")
          (s."jest-resolve@^27.5.1")
          (s."jest-snapshot@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."slash@^3.0.0")
          (s."strip-bom@^4.0.0")
          ];
        "jest-runtime@^27.5.1" = s."jest-runtime@27.5.1";
        "jest-serializer@26.6.2" = f "jest-serializer" "26.6.2" y "d139aafd46957d3a448f3a6cdabe2919ba0742d1" [
          (s."@types/node@*")
          (s."graceful-fs@^4.2.4")
          ];
        "jest-serializer@27.5.1" = f "jest-serializer" "27.5.1" y "81438410a30ea66fd57ff730835123dea1fb1f64" [
          (s."@types/node@*")
          (s."graceful-fs@^4.2.9")
          ];
        "jest-serializer@^26.6.2" = s."jest-serializer@26.6.2";
        "jest-serializer@^27.5.1" = s."jest-serializer@27.5.1";
        "jest-snapshot@27.5.1" = f "jest-snapshot" "27.5.1" y "b668d50d23d38054a51b42c4039cab59ae6eb6a1" [
          (s."@babel/core@^7.7.2")
          (s."@babel/generator@^7.7.2")
          (s."@babel/plugin-syntax-typescript@^7.7.2")
          (s."@babel/traverse@^7.7.2")
          (s."@babel/types@^7.0.0")
          (s."@jest/transform@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/babel__traverse@^7.0.4")
          (s."@types/prettier@^2.1.5")
          (s."babel-preset-current-node-syntax@^1.0.0")
          (s."chalk@^4.0.0")
          (s."expect@^27.5.1")
          (s."graceful-fs@^4.2.9")
          (s."jest-diff@^27.5.1")
          (s."jest-get-type@^27.5.1")
          (s."jest-haste-map@^27.5.1")
          (s."jest-matcher-utils@^27.5.1")
          (s."jest-message-util@^27.5.1")
          (s."jest-util@^27.5.1")
          (s."natural-compare@^1.4.0")
          (s."pretty-format@^27.5.1")
          (s."semver@^7.3.2")
          ];
        "jest-snapshot@^27.5.1" = s."jest-snapshot@27.5.1";
        "jest-util@26.6.2" = f "jest-util" "26.6.2" y "907535dbe4d5a6cb4c47ac9b926f6af29576cbc1" [
          (s."@jest/types@^26.6.2")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."graceful-fs@^4.2.4")
          (s."is-ci@^2.0.0")
          (s."micromatch@^4.0.2")
          ];
        "jest-util@27.5.1" = f "jest-util" "27.5.1" y "3ba9771e8e31a0b85da48fe0b0891fb86c01c2f9" [
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."ci-info@^3.2.0")
          (s."graceful-fs@^4.2.9")
          (s."picomatch@^2.2.3")
          ];
        "jest-util@28.1.1" = f "jest-util" "28.1.1" y "ff39e436a1aca397c0ab998db5a51ae2b7080d05" [
          (s."@jest/types@^28.1.1")
          (s."@types/node@*")
          (s."chalk@^4.0.0")
          (s."ci-info@^3.2.0")
          (s."graceful-fs@^4.2.9")
          (s."picomatch@^2.2.3")
          ];
        "jest-util@^26.6.2" = s."jest-util@26.6.2";
        "jest-util@^27.0.0" = s."jest-util@27.5.1";
        "jest-util@^27.5.1" = s."jest-util@27.5.1";
        "jest-util@^28.1.1" = s."jest-util@28.1.1";
        "jest-validate@27.5.1" = f "jest-validate" "27.5.1" y "9197d54dc0bdb52260b8db40b46ae668e04df067" [
          (s."@jest/types@^27.5.1")
          (s."camelcase@^6.2.0")
          (s."chalk@^4.0.0")
          (s."jest-get-type@^27.5.1")
          (s."leven@^3.1.0")
          (s."pretty-format@^27.5.1")
          ];
        "jest-validate@^27.5.1" = s."jest-validate@27.5.1";
        "jest-watch-typeahead@1.1.0" = f "jest-watch-typeahead" "1.1.0" y "b4a6826dfb9c9420da2f7bc900de59dad11266a9" [
          (s."ansi-escapes@^4.3.1")
          (s."chalk@^4.0.0")
          (s."jest-regex-util@^28.0.0")
          (s."jest-watcher@^28.0.0")
          (s."slash@^4.0.0")
          (s."string-length@^5.0.1")
          (s."strip-ansi@^7.0.1")
          ];
        "jest-watch-typeahead@^1.0.0" = s."jest-watch-typeahead@1.1.0";
        "jest-watcher@27.5.1" = f "jest-watcher" "27.5.1" y "71bd85fb9bde3a2c2ec4dc353437971c43c642a2" [
          (s."@jest/test-result@^27.5.1")
          (s."@jest/types@^27.5.1")
          (s."@types/node@*")
          (s."ansi-escapes@^4.2.1")
          (s."chalk@^4.0.0")
          (s."jest-util@^27.5.1")
          (s."string-length@^4.0.1")
          ];
        "jest-watcher@28.1.1" = f "jest-watcher" "28.1.1" y "533597fb3bfefd52b5cd115cd916cffd237fb60c" [
          (s."@jest/test-result@^28.1.1")
          (s."@jest/types@^28.1.1")
          (s."@types/node@*")
          (s."ansi-escapes@^4.2.1")
          (s."chalk@^4.0.0")
          (s."emittery@^0.10.2")
          (s."jest-util@^28.1.1")
          (s."string-length@^4.0.1")
          ];
        "jest-watcher@^27.5.1" = s."jest-watcher@27.5.1";
        "jest-watcher@^28.0.0" = s."jest-watcher@28.1.1";
        "jest-worker@26.6.2" = f "jest-worker" "26.6.2" y "7f72cbc4d643c365e27b9fd775f9d0eaa9c7a8ed" [
          (s."@types/node@*")
          (s."merge-stream@^2.0.0")
          (s."supports-color@^7.0.0")
          ];
        "jest-worker@27.5.1" = f "jest-worker" "27.5.1" y "8d146f0900e8973b106b6f73cc1e9a8cb86f8db0" [
          (s."@types/node@*")
          (s."merge-stream@^2.0.0")
          (s."supports-color@^8.0.0")
          ];
        "jest-worker@^26.2.1" = s."jest-worker@26.6.2";
        "jest-worker@^26.5.0" = s."jest-worker@26.6.2";
        "jest-worker@^26.6.2" = s."jest-worker@26.6.2";
        "jest-worker@^27.0.2" = s."jest-worker@27.5.1";
        "jest-worker@^27.3.1" = s."jest-worker@27.5.1";
        "jest-worker@^27.4.5" = s."jest-worker@27.5.1";
        "jest-worker@^27.5.1" = s."jest-worker@27.5.1";
        "jest@27.5.1" = f "jest" "27.5.1" y "dadf33ba70a779be7a6fc33015843b51494f63fc" [
          (s."@jest/core@^27.5.1")
          (s."import-local@^3.0.2")
          (s."jest-cli@^27.5.1")
          ];
        "jest@^27.3.1" = s."jest@27.5.1";
        "jest@^27.4.3" = s."jest@27.5.1";
        "jest@^27.5.1" = s."jest@27.5.1";
        "joi@17.6.0" = f "joi" "17.6.0" y "0bb54f2f006c09a96e75ce687957bd04290054b2" [
          (s."@hapi/hoek@^9.0.0")
          (s."@hapi/topo@^5.0.0")
          (s."@sideway/address@^4.1.3")
          (s."@sideway/formula@^3.0.0")
          (s."@sideway/pinpoint@^2.0.0")
          ];
        "joi@^17.6.0" = s."joi@17.6.0";
        "js-cookie@2.2.1" = f "js-cookie" "2.2.1" y "69e106dc5d5806894562902aa5baec3744e9b2b8" [];
        "js-cookie@^2.2.1" = s."js-cookie@2.2.1";
        "js-string-escape@1.0.1" = f "js-string-escape" "1.0.1" y "e2625badbc0d67c7533e9edc1068c587ae4137ef" [];
        "js-string-escape@^1.0.1" = s."js-string-escape@1.0.1";
        "js-tokens@3.0.2" = f "js-tokens" "3.0.2" y "9866df395102130e38f7f996bceb65443209c25b" [];
        "js-tokens@4.0.0" = f "js-tokens" "4.0.0" y "19203fb59991df98e3a287050d4647cdeaf32499" [];
        "js-tokens@^3.0.0 || ^4.0.0" = s."js-tokens@4.0.0";
        "js-tokens@^3.0.2" = s."js-tokens@3.0.2";
        "js-tokens@^4.0.0" = s."js-tokens@4.0.0";
        "js-yaml@3.14.1" = f "js-yaml" "3.14.1" y "dae812fdb3825fa306609a8717383c50c36a0537" [
          (s."argparse@^1.0.7")
          (s."esprima@^4.0.0")
          ];
        "js-yaml@4.1.0" = f "js-yaml" "4.1.0" y "c1fb65f8f5017901cdd2c951864ba18458a10602" [
          (s."argparse@^2.0.1")
          ];
        "js-yaml@^3.13.1" = s."js-yaml@3.14.1";
        "js-yaml@^4.1.0" = s."js-yaml@4.1.0";
        "jsdom@16.7.0" = f "jsdom" "16.7.0" y "918ae71965424b197c819f8183a754e18977b710" [
          (s."abab@^2.0.5")
          (s."acorn@^8.2.4")
          (s."acorn-globals@^6.0.0")
          (s."cssom@^0.4.4")
          (s."cssstyle@^2.3.0")
          (s."data-urls@^2.0.0")
          (s."decimal.js@^10.2.1")
          (s."domexception@^2.0.1")
          (s."escodegen@^2.0.0")
          (s."form-data@^3.0.0")
          (s."html-encoding-sniffer@^2.0.1")
          (s."http-proxy-agent@^4.0.1")
          (s."https-proxy-agent@^5.0.0")
          (s."is-potential-custom-element-name@^1.0.1")
          (s."nwsapi@^2.2.0")
          (s."parse5@6.0.1")
          (s."saxes@^5.0.1")
          (s."symbol-tree@^3.2.4")
          (s."tough-cookie@^4.0.0")
          (s."w3c-hr-time@^1.0.2")
          (s."w3c-xmlserializer@^2.0.0")
          (s."webidl-conversions@^6.1.0")
          (s."whatwg-encoding@^1.0.5")
          (s."whatwg-mimetype@^2.3.0")
          (s."whatwg-url@^8.5.0")
          (s."ws@^7.4.6")
          (s."xml-name-validator@^3.0.0")
          ];
        "jsdom@^16.6.0" = s."jsdom@16.7.0";
        "jsesc@0.5.0" = f "jsesc" "0.5.0" y "e7dee66e35d6fc16f710fe91d5cf69f70f08911d" [];
        "jsesc@2.5.2" = f "jsesc" "2.5.2" y "80564d2e483dacf6e8ef209650a67df3f0c283a4" [];
        "jsesc@^2.5.1" = s."jsesc@2.5.2";
        "jsesc@~0.5.0" = s."jsesc@0.5.0";
        "json-buffer@3.0.0" = f "json-buffer" "3.0.0" y "5b1f397afc75d677bde8bcfc0e47e1f9a3d9a898" [];
        "json-parse-better-errors@1.0.2" = f "json-parse-better-errors" "1.0.2" y "bb867cfb3450e69107c131d1c514bab3dc8bcaa9" [];
        "json-parse-better-errors@^1.0.2" = s."json-parse-better-errors@1.0.2";
        "json-parse-even-better-errors@2.3.1" = f "json-parse-even-better-errors" "2.3.1" y "7c47805a94319928e05777405dc12e1f7a4ee02d" [];
        "json-parse-even-better-errors@^2.3.0" = s."json-parse-even-better-errors@2.3.1";
        "json-parse-even-better-errors@^2.3.1" = s."json-parse-even-better-errors@2.3.1";
        "json-schema-traverse@0.4.1" = f "json-schema-traverse" "0.4.1" y "69f6a87d9513ab8bb8fe63bdb0979c448e684660" [];
        "json-schema-traverse@1.0.0" = f "json-schema-traverse" "1.0.0" y "ae7bcb3656ab77a73ba5c49bf654f38e6b6860e2" [];
        "json-schema-traverse@^0.4.1" = s."json-schema-traverse@0.4.1";
        "json-schema-traverse@^1.0.0" = s."json-schema-traverse@1.0.0";
        "json-schema@0.4.0" = f "json-schema" "0.4.0" y "f7de4cf6efab838ebaeb3236474cbba5a1930ab5" [];
        "json-schema@^0.4.0" = s."json-schema@0.4.0";
        "json-stable-stringify-without-jsonify@1.0.1" = f "json-stable-stringify-without-jsonify" "1.0.1" y "9db7b59496ad3f3cfef30a75142d2d930ad72651" [];
        "json-stable-stringify-without-jsonify@^1.0.1" = s."json-stable-stringify-without-jsonify@1.0.1";
        "json-stringify-pretty-compact@3.0.0" = f "json-stringify-pretty-compact" "3.0.0" y "f71ef9d82ef16483a407869556588e91b681d9ab" [];
        "json-stringify-pretty-compact@^3.0.0" = s."json-stringify-pretty-compact@3.0.0";
        "json-stringify-pretty-compact@~3.0.0" = s."json-stringify-pretty-compact@3.0.0";
        "json5@1.0.1" = f "json5" "1.0.1" y "779fb0018604fa854eacbf6252180d83543e3dbe" [
          (s."minimist@^1.2.0")
          ];
        "json5@2.2.1" = f "json5" "2.2.1" y "655d50ed1e6f95ad1a3caababd2b0efda10b395c" [];
        "json5@2.x" = s."json5@2.2.1";
        "json5@^1.0.1" = s."json5@1.0.1";
        "json5@^2.1.2" = s."json5@2.2.1";
        "json5@^2.1.3" = s."json5@2.2.1";
        "json5@^2.2.0" = s."json5@2.2.1";
        "json5@^2.2.1" = s."json5@2.2.1";
        "jsonfile@6.1.0" = f "jsonfile" "6.1.0" y "bc55b2634793c679ec6403094eb13698a6ec0aae" [
          (s."universalify@^2.0.0")
          (s."graceful-fs@^4.1.6")
          ];
        "jsonfile@^6.0.1" = s."jsonfile@6.1.0";
        "jsonpointer@5.0.0" = f "jsonpointer" "5.0.0" y "f802669a524ec4805fa7389eadbc9921d5dc8072" [];
        "jsonpointer@^5.0.0" = s."jsonpointer@5.0.0";
        "jstat@1.9.5" = f "jstat" "1.9.5" y "9941741566f683624ddeb56f5ba60ed8c29b374e" [];
        "jstat@^1.9.5" = s."jstat@1.9.5";
        "jsx-ast-utils@3.3.1" = f "jsx-ast-utils" "3.3.1" y "a3e0f1cb7e230954eab4dcbce9f6288a78f8ba44" [
          (s."array-includes@^3.1.5")
          (s."object.assign@^4.1.2")
          ];
        "jsx-ast-utils@^2.4.1 || ^3.0.0" = s."jsx-ast-utils@3.3.1";
        "jsx-ast-utils@^3.2.1" = s."jsx-ast-utils@3.3.1";
        "junk@3.1.0" = f "junk" "3.1.0" y "31499098d902b7e98c5d9b9c80f43457a88abfa1" [];
        "junk@^3.1.0" = s."junk@3.1.0";
        "katex@0.13.24" = f "katex" "0.13.24" y "fe55455eb455698cb24b911a353d16a3c855d905" [
          (s."commander@^8.0.0")
          ];
        "katex@^0.13.0" = s."katex@0.13.24";
        "keyv@3.1.0" = f "keyv" "3.1.0" y "ecc228486f69991e49e9476485a5be1e8fc5c4d9" [
          (s."json-buffer@3.0.0")
          ];
        "keyv@^3.0.0" = s."keyv@3.1.0";
        "kind-of@3.2.2" = f "kind-of" "3.2.2" y "31ea21a734bab9bbb0f32466d893aea51e4a3c64" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@4.0.0" = f "kind-of" "4.0.0" y "20813df3d712928b207378691a45066fae72dd57" [
          (s."is-buffer@^1.1.5")
          ];
        "kind-of@5.1.0" = f "kind-of" "5.1.0" y "729c91e2d857b7a419a1f9aa65685c4c33f5845d" [];
        "kind-of@6.0.3" = f "kind-of" "6.0.3" y "07c05034a6c349fa06e24fa35aa76db4580ce4dd" [];
        "kind-of@^3.0.2" = s."kind-of@3.2.2";
        "kind-of@^3.0.3" = s."kind-of@3.2.2";
        "kind-of@^3.2.0" = s."kind-of@3.2.2";
        "kind-of@^4.0.0" = s."kind-of@4.0.0";
        "kind-of@^5.0.0" = s."kind-of@5.1.0";
        "kind-of@^6.0.0" = s."kind-of@6.0.3";
        "kind-of@^6.0.2" = s."kind-of@6.0.3";
        "kleur@3.0.3" = f "kleur" "3.0.3" y "a79c9ecc86ee1ce3fa6206d1216c501f147fc07e" [];
        "kleur@^3.0.3" = s."kleur@3.0.3";
        "klona@2.0.5" = f "klona" "2.0.5" y "d166574d90076395d9963aa7a928fabb8d76afbc" [];
        "klona@^2.0.4" = s."klona@2.0.5";
        "klona@^2.0.5" = s."klona@2.0.5";
        "language-subtag-registry@0.3.21" = f "language-subtag-registry" "0.3.21" y "04ac218bea46f04cb039084602c6da9e788dd45a" [];
        "language-subtag-registry@~0.3.2" = s."language-subtag-registry@0.3.21";
        "language-tags@1.0.5" = f "language-tags" "1.0.5" y "d321dbc4da30ba8bf3024e040fa5c14661f9193a" [
          (s."language-subtag-registry@~0.3.2")
          ];
        "language-tags@^1.0.5" = s."language-tags@1.0.5";
        "latest-version@5.1.0" = f "latest-version" "5.1.0" y "119dfe908fe38d15dfa43ecd13fa12ec8832face" [
          (s."package-json@^6.3.0")
          ];
        "latest-version@^5.1.0" = s."latest-version@5.1.0";
        "lazy-universal-dotenv@3.0.1" = f "lazy-universal-dotenv" "3.0.1" y "a6c8938414bca426ab8c9463940da451a911db38" [
          (s."@babel/runtime@^7.5.0")
          (s."app-root-dir@^1.0.2")
          (s."core-js@^3.0.4")
          (s."dotenv@^8.0.0")
          (s."dotenv-expand@^5.1.0")
          ];
        "lazy-universal-dotenv@^3.0.1" = s."lazy-universal-dotenv@3.0.1";
        "leven@3.1.0" = f "leven" "3.1.0" y "77891de834064cccba82ae7842bb6b14a13ed7f2" [];
        "leven@^3.1.0" = s."leven@3.1.0";
        "levn@0.3.0" = f "levn" "0.3.0" y "3b09924edf9f083c0490fdd4c0bc4421e04764ee" [
          (s."prelude-ls@~1.1.2")
          (s."type-check@~0.3.2")
          ];
        "levn@0.4.1" = f "levn" "0.4.1" y "ae4562c007473b932a6200d403268dd2fffc6ade" [
          (s."prelude-ls@^1.2.1")
          (s."type-check@~0.4.0")
          ];
        "levn@^0.4.1" = s."levn@0.4.1";
        "levn@~0.3.0" = s."levn@0.3.0";
        "lilconfig@2.0.6" = f "lilconfig" "2.0.6" y "32a384558bd58af3d4c6e077dd1ad1d397bc69d4" [];
        "lilconfig@^2.0.3" = s."lilconfig@2.0.6";
        "lilconfig@^2.0.5" = s."lilconfig@2.0.6";
        "lilconfig@^2.0.6" = s."lilconfig@2.0.6";
        "lines-and-columns@1.2.4" = f "lines-and-columns" "1.2.4" y "eca284f75d2965079309dc0ad9255abb2ebc1632" [];
        "lines-and-columns@^1.1.6" = s."lines-and-columns@1.2.4";
        "linkify-it@2.2.0" = f "linkify-it" "2.2.0" y "e3b54697e78bf915c70a38acd78fd09e0058b1cf" [
          (s."uc.micro@^1.0.1")
          ];
        "linkify-it@^2.0.0" = s."linkify-it@2.2.0";
        "load-json-file@1.1.0" = f "load-json-file" "1.1.0" y "956905708d58b4bab4c2261b04f59f31c99374c0" [
          (s."graceful-fs@^4.1.2")
          (s."parse-json@^2.2.0")
          (s."pify@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          (s."strip-bom@^2.0.0")
          ];
        "load-json-file@^1.0.0" = s."load-json-file@1.1.0";
        "loader-runner@2.4.0" = f "loader-runner" "2.4.0" y "ed47066bfe534d7e84c4c7b9998c2a75607d9357" [];
        "loader-runner@4.3.0" = f "loader-runner" "4.3.0" y "c1b4a163b99f614830353b16755e7149ac2314e1" [];
        "loader-runner@^2.4.0" = s."loader-runner@2.4.0";
        "loader-runner@^4.2.0" = s."loader-runner@4.3.0";
        "loader-utils@1.4.0" = f "loader-utils" "1.4.0" y "c579b5e34cb34b1a74edc6c1fb36bfa371d5a613" [
          (s."big.js@^5.2.2")
          (s."emojis-list@^3.0.0")
          (s."json5@^1.0.1")
          ];
        "loader-utils@2.0.2" = f "loader-utils" "2.0.2" y "d6e3b4fb81870721ae4e0868ab11dd638368c129" [
          (s."big.js@^5.2.2")
          (s."emojis-list@^3.0.0")
          (s."json5@^2.1.2")
          ];
        "loader-utils@3.2.0" = f "loader-utils" "3.2.0" y "bcecc51a7898bee7473d4bc6b845b23af8304d4f" [];
        "loader-utils@^1.2.3" = s."loader-utils@1.4.0";
        "loader-utils@^2.0.0" = s."loader-utils@2.0.2";
        "loader-utils@^3.2.0" = s."loader-utils@3.2.0";
        "locate-path@2.0.0" = f "locate-path" "2.0.0" y "2b568b265eec944c6d9c0de9c3dbbbca0354cd8e" [
          (s."p-locate@^2.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@3.0.0" = f "locate-path" "3.0.0" y "dbec3b3ab759758071b58fe59fc41871af21400e" [
          (s."p-locate@^3.0.0")
          (s."path-exists@^3.0.0")
          ];
        "locate-path@5.0.0" = f "locate-path" "5.0.0" y "1afba396afd676a6d42504d0a67a3a7eb9f62aa0" [
          (s."p-locate@^4.1.0")
          ];
        "locate-path@6.0.0" = f "locate-path" "6.0.0" y "55321eb309febbc59c4801d931a72452a681d286" [
          (s."p-locate@^5.0.0")
          ];
        "locate-path@^2.0.0" = s."locate-path@2.0.0";
        "locate-path@^3.0.0" = s."locate-path@3.0.0";
        "locate-path@^5.0.0" = s."locate-path@5.0.0";
        "locate-path@^6.0.0" = s."locate-path@6.0.0";
        "lodash-es@4.17.21" = f "lodash-es" "4.17.21" y "43e626c46e6591b7750beb2b50117390c609e3ee" [];
        "lodash-es@^4.17.21" = s."lodash-es@4.17.21";
        "lodash.curry@4.1.1" = f "lodash.curry" "4.1.1" y "248e36072ede906501d75966200a86dab8b23170" [];
        "lodash.curry@^4.0.1" = s."lodash.curry@4.1.1";
        "lodash.debounce@4.0.8" = f "lodash.debounce" "4.0.8" y "82d79bff30a67c4005ffd5e2515300ad9ca4d7af" [];
        "lodash.debounce@^4.0.8" = s."lodash.debounce@4.0.8";
        "lodash.flattendeep@4.4.0" = f "lodash.flattendeep" "4.4.0" y "fb030917f86a3134e5bc9bec0d69e0013ddfedb2" [];
        "lodash.flattendeep@^4.4.0" = s."lodash.flattendeep@4.4.0";
        "lodash.flow@3.5.0" = f "lodash.flow" "3.5.0" y "87bf40292b8cf83e4e8ce1a3ae4209e20071675a" [];
        "lodash.flow@^3.3.0" = s."lodash.flow@3.5.0";
        "lodash.get@4.4.2" = f "lodash.get" "4.4.2" y "2d177f652fa31e939b4438d5341499dfa3825e99" [];
        "lodash.get@^4.4.2" = s."lodash.get@4.4.2";
        "lodash.isequal@4.5.0" = f "lodash.isequal" "4.5.0" y "415c4478f2bcc30120c22ce10ed3226f7d3e18e0" [];
        "lodash.isequal@^4.5.0" = s."lodash.isequal@4.5.0";
        "lodash.memoize@4.1.2" = f "lodash.memoize" "4.1.2" y "bcc6c49a42a2840ed997f323eada5ecd182e0bfe" [];
        "lodash.memoize@4.x" = s."lodash.memoize@4.1.2";
        "lodash.memoize@^4.1.2" = s."lodash.memoize@4.1.2";
        "lodash.merge@4.6.2" = f "lodash.merge" "4.6.2" y "558aa53b43b661e1925a0afdfa36a9a1085fe57a" [];
        "lodash.merge@^4.6.2" = s."lodash.merge@4.6.2";
        "lodash.sortby@4.7.0" = f "lodash.sortby" "4.7.0" y "edd14c824e2cc9c1e0b0a1b42bb5210516a42438" [];
        "lodash.sortby@^4.7.0" = s."lodash.sortby@4.7.0";
        "lodash.uniq@4.5.0" = f "lodash.uniq" "4.5.0" y "d0225373aeb652adc1bc82e4945339a842754773" [];
        "lodash.uniq@^4.5.0" = s."lodash.uniq@4.5.0";
        "lodash@4.17.21" = f "lodash" "4.17.21" y "679591c564c3bffaae8454cf0b3df370c3d6911c" [];
        "lodash@^4.17.10" = s."lodash@4.17.21";
        "lodash@^4.17.15" = s."lodash@4.17.21";
        "lodash@^4.17.19" = s."lodash@4.17.21";
        "lodash@^4.17.20" = s."lodash@4.17.21";
        "lodash@^4.17.21" = s."lodash@4.17.21";
        "lodash@^4.17.4" = s."lodash@4.17.21";
        "lodash@^4.7.0" = s."lodash@4.17.21";
        "loose-envify@1.4.0" = f "loose-envify" "1.4.0" y "71ee51fa7be4caec1a63839f7e682d8132d30caf" [
          (s."js-tokens@^3.0.0 || ^4.0.0")
          ];
        "loose-envify@^1.0.0" = s."loose-envify@1.4.0";
        "loose-envify@^1.1.0" = s."loose-envify@1.4.0";
        "loose-envify@^1.2.0" = s."loose-envify@1.4.0";
        "loose-envify@^1.3.1" = s."loose-envify@1.4.0";
        "loose-envify@^1.4.0" = s."loose-envify@1.4.0";
        "loud-rejection@1.6.0" = f "loud-rejection" "1.6.0" y "5b46f80147edee578870f086d04821cf998e551f" [
          (s."currently-unhandled@^0.4.1")
          (s."signal-exit@^3.0.0")
          ];
        "loud-rejection@^1.0.0" = s."loud-rejection@1.6.0";
        "lower-case@2.0.2" = f "lower-case" "2.0.2" y "6fa237c63dbdc4a82ca0fd882e4722dc5e634e28" [
          (s."tslib@^2.0.3")
          ];
        "lower-case@^2.0.2" = s."lower-case@2.0.2";
        "lowercase-keys@1.0.1" = f "lowercase-keys" "1.0.1" y "6f9e30b47084d971a7c820ff15a6c5167b74c26f" [];
        "lowercase-keys@2.0.0" = f "lowercase-keys" "2.0.0" y "2603e78b7b4b0006cbca2fbcc8a3202558ac9479" [];
        "lowercase-keys@^1.0.0" = s."lowercase-keys@1.0.1";
        "lowercase-keys@^1.0.1" = s."lowercase-keys@1.0.1";
        "lowercase-keys@^2.0.0" = s."lowercase-keys@2.0.0";
        "lowlight@1.20.0" = f "lowlight" "1.20.0" y "ddb197d33462ad0d93bf19d17b6c301aa3941888" [
          (s."fault@^1.0.0")
          (s."highlight.js@~10.7.0")
          ];
        "lowlight@^1.17.0" = s."lowlight@1.20.0";
        "lru-cache@5.1.1" = f "lru-cache" "5.1.1" y "1da27e6710271947695daf6848e847f01d84b920" [
          (s."yallist@^3.0.2")
          ];
        "lru-cache@6.0.0" = f "lru-cache" "6.0.0" y "6d6fe6570ebd96aaf90fcad1dafa3b2566db3a94" [
          (s."yallist@^4.0.0")
          ];
        "lru-cache@^5.1.1" = s."lru-cache@5.1.1";
        "lru-cache@^6.0.0" = s."lru-cache@6.0.0";
        "lz-string@1.4.4" = f "lz-string" "1.4.4" y "c0d8eaf36059f705796e1e344811cf4c498d3a26" [];
        "lz-string@^1.4.4" = s."lz-string@1.4.4";
        "magic-string@0.25.9" = f "magic-string" "0.25.9" y "de7f9faf91ef8a1c91d02c2e5314c8277dbcdd1c" [
          (s."sourcemap-codec@^1.4.8")
          ];
        "magic-string@^0.25.0" = s."magic-string@0.25.9";
        "magic-string@^0.25.7" = s."magic-string@0.25.9";
        "make-dir@2.1.0" = f "make-dir" "2.1.0" y "5f0310e18b8be898cc07009295a30ae41e91e6f5" [
          (s."pify@^4.0.1")
          (s."semver@^5.6.0")
          ];
        "make-dir@3.1.0" = f "make-dir" "3.1.0" y "415e967046b3a7f1d185277d84aa58203726a13f" [
          (s."semver@^6.0.0")
          ];
        "make-dir@^2.0.0" = s."make-dir@2.1.0";
        "make-dir@^2.1.0" = s."make-dir@2.1.0";
        "make-dir@^3.0.0" = s."make-dir@3.1.0";
        "make-dir@^3.0.2" = s."make-dir@3.1.0";
        "make-dir@^3.1.0" = s."make-dir@3.1.0";
        "make-error@1.3.6" = f "make-error" "1.3.6" y "2eb2e37ea9b67c4891f684a1394799af484cf7a2" [];
        "make-error@1.x" = s."make-error@1.3.6";
        "make-error@^1.1.1" = s."make-error@1.3.6";
        "makeerror@1.0.12" = f "makeerror" "1.0.12" y "3e5dd2079a82e812e983cc6610c4a2cb0eaa801a" [
          (s."tmpl@1.0.5")
          ];
        "map-age-cleaner@0.1.3" = f "map-age-cleaner" "0.1.3" y "7d583a7306434c055fe474b0f45078e6e1b4b92a" [
          (s."p-defer@^1.0.0")
          ];
        "map-age-cleaner@^0.1.3" = s."map-age-cleaner@0.1.3";
        "map-cache@0.2.2" = f "map-cache" "0.2.2" y "c32abd0bd6525d9b051645bb4f26ac5dc98a0dbf" [];
        "map-cache@^0.2.2" = s."map-cache@0.2.2";
        "map-obj@1.0.1" = f "map-obj" "1.0.1" y "d933ceb9205d82bdcf4886f6742bdc2b4dea146d" [];
        "map-obj@^1.0.0" = s."map-obj@1.0.1";
        "map-obj@^1.0.1" = s."map-obj@1.0.1";
        "map-or-similar@1.5.0" = f "map-or-similar" "1.5.0" y "6de2653174adfb5d9edc33c69d3e92a1b76faf08" [];
        "map-or-similar@^1.5.0" = s."map-or-similar@1.5.0";
        "map-visit@1.0.0" = f "map-visit" "1.0.0" y "ecdca8f13144e660f1b5bd41f12f3479d98dfb8f" [
          (s."object-visit@^1.0.0")
          ];
        "map-visit@^1.0.0" = s."map-visit@1.0.0";
        "markdown-escapes@1.0.4" = f "markdown-escapes" "1.0.4" y "c95415ef451499d7602b91095f3c8e8975f78535" [];
        "markdown-escapes@^1.0.0" = s."markdown-escapes@1.0.4";
        "markdown-it@8.4.2" = f "markdown-it" "8.4.2" y "386f98998dc15a37722aa7722084f4020bdd9b54" [
          (s."argparse@^1.0.7")
          (s."entities@~1.1.1")
          (s."linkify-it@^2.0.0")
          (s."mdurl@^1.0.1")
          (s."uc.micro@^1.0.5")
          ];
        "markdown-it@^8.3.1" = s."markdown-it@8.4.2";
        "mathjs@11.0.1" = f "mathjs" "11.0.1" y "7fb5150ef8c427f8bcddba52a084a3d8bffda7ea" [
          (s."@babel/runtime@^7.18.9")
          (s."complex.js@^2.1.1")
          (s."decimal.js@^10.3.1")
          (s."escape-latex@^1.2.0")
          (s."fraction.js@^4.2.0")
          (s."javascript-natural-sort@^0.7.1")
          (s."seedrandom@^3.0.5")
          (s."tiny-emitter@^2.1.0")
          (s."typed-function@^3.0.0")
          ];
        "mathjs@^11.0.1" = s."mathjs@11.0.1";
        "md5.js@1.3.5" = f "md5.js" "1.3.5" y "b5d07b8e3216e3e27cd728d72f70d1e6a342005f" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "md5.js@^1.3.4" = s."md5.js@1.3.5";
        "mdast-squeeze-paragraphs@4.0.0" = f "mdast-squeeze-paragraphs" "4.0.0" y "7c4c114679c3bee27ef10b58e2e015be79f1ef97" [
          (s."unist-util-remove@^2.0.0")
          ];
        "mdast-squeeze-paragraphs@^4.0.0" = s."mdast-squeeze-paragraphs@4.0.0";
        "mdast-util-definitions@4.0.0" = f "mdast-util-definitions" "4.0.0" y "c5c1a84db799173b4dcf7643cda999e440c24db2" [
          (s."unist-util-visit@^2.0.0")
          ];
        "mdast-util-definitions@^4.0.0" = s."mdast-util-definitions@4.0.0";
        "mdast-util-to-hast@10.0.1" = f "mdast-util-to-hast" "10.0.1" y "0cfc82089494c52d46eb0e3edb7a4eb2aea021eb" [
          (s."@types/mdast@^3.0.0")
          (s."@types/unist@^2.0.0")
          (s."mdast-util-definitions@^4.0.0")
          (s."mdurl@^1.0.0")
          (s."unist-builder@^2.0.0")
          (s."unist-util-generated@^1.0.0")
          (s."unist-util-position@^3.0.0")
          (s."unist-util-visit@^2.0.0")
          ];
        "mdast-util-to-string@1.1.0" = f "mdast-util-to-string" "1.1.0" y "27055500103f51637bd07d01da01eb1967a43527" [];
        "mdast-util-to-string@2.0.0" = f "mdast-util-to-string" "2.0.0" y "b8cfe6a713e1091cb5b728fc48885a4767f8b97b" [];
        "mdast-util-to-string@^1.0.0" = s."mdast-util-to-string@1.1.0";
        "mdast-util-to-string@^2.0.0" = s."mdast-util-to-string@2.0.0";
        "mdn-data@2.0.14" = f "mdn-data" "2.0.14" y "7113fc4281917d63ce29b43446f701e68c25ba50" [];
        "mdn-data@2.0.4" = f "mdn-data" "2.0.4" y "699b3c38ac6f1d728091a64650b65d388502fd5b" [];
        "mdurl@1.0.1" = f "mdurl" "1.0.1" y "fe85b2ec75a59037f2adfec100fd6c601761152e" [];
        "mdurl@^1.0.0" = s."mdurl@1.0.1";
        "mdurl@^1.0.1" = s."mdurl@1.0.1";
        "media-typer@0.3.0" = f "media-typer" "0.3.0" y "8710d7af0aa626f8fffa1ce00168545263255748" [];
        "mem@8.1.1" = f "mem" "8.1.1" y "cf118b357c65ab7b7e0817bdf00c8062297c0122" [
          (s."map-age-cleaner@^0.1.3")
          (s."mimic-fn@^3.1.0")
          ];
        "mem@^8.1.1" = s."mem@8.1.1";
        "memfs@3.4.6" = f "memfs" "3.4.6" y "74097983d27c82b973665885dc75f27a65174510" [
          (s."fs-monkey@^1.0.3")
          ];
        "memfs@^3.1.2" = s."memfs@3.4.6";
        "memfs@^3.2.2" = s."memfs@3.4.6";
        "memfs@^3.4.3" = s."memfs@3.4.6";
        "memoizerific@1.11.3" = f "memoizerific" "1.11.3" y "7c87a4646444c32d75438570905f2dbd1b1a805a" [
          (s."map-or-similar@^1.5.0")
          ];
        "memoizerific@^1.11.3" = s."memoizerific@1.11.3";
        "memory-fs@0.4.1" = f "memory-fs" "0.4.1" y "3a9a20b8462523e447cfbc7e8bb80ed667bfc552" [
          (s."errno@^0.1.3")
          (s."readable-stream@^2.0.1")
          ];
        "memory-fs@0.5.0" = f "memory-fs" "0.5.0" y "324c01288b88652966d161db77838720845a8e3c" [
          (s."errno@^0.1.3")
          (s."readable-stream@^2.0.1")
          ];
        "memory-fs@^0.4.1" = s."memory-fs@0.4.1";
        "memory-fs@^0.5.0" = s."memory-fs@0.5.0";
        "meow@3.7.0" = f "meow" "3.7.0" y "72cb668b425228290abbfa856892587308a801fb" [
          (s."camelcase-keys@^2.0.0")
          (s."decamelize@^1.1.2")
          (s."loud-rejection@^1.0.0")
          (s."map-obj@^1.0.1")
          (s."minimist@^1.1.3")
          (s."normalize-package-data@^2.3.4")
          (s."object-assign@^4.0.1")
          (s."read-pkg-up@^1.0.1")
          (s."redent@^1.0.0")
          (s."trim-newlines@^1.0.0")
          ];
        "meow@^3.1.0" = s."meow@3.7.0";
        "merge-descriptors@1.0.1" = f "merge-descriptors" "1.0.1" y "b00aaa556dd8b44568150ec9d1b953f3f90cbb61" [];
        "merge-stream@2.0.0" = f "merge-stream" "2.0.0" y "52823629a14dd00c9770fb6ad47dc6310f2c1f60" [];
        "merge-stream@^2.0.0" = s."merge-stream@2.0.0";
        "merge2@1.4.1" = f "merge2" "1.4.1" y "4368892f885e907455a6fd7dc55c0c9d404990ae" [];
        "merge2@^1.2.3" = s."merge2@1.4.1";
        "merge2@^1.3.0" = s."merge2@1.4.1";
        "merge2@^1.4.1" = s."merge2@1.4.1";
        "methods@1.1.2" = f "methods" "1.1.2" y "5529a4d67654134edcc5266656835b0f851afcee" [];
        "methods@~1.1.2" = s."methods@1.1.2";
        "microevent.ts@0.1.1" = f "microevent.ts" "0.1.1" y "70b09b83f43df5172d0205a63025bce0f7357fa0" [];
        "microevent.ts@~0.1.1" = s."microevent.ts@0.1.1";
        "micromatch@3.1.10" = f "micromatch" "3.1.10" y "70859bc95c9840952f359a068a3fc49f9ecfac23" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."braces@^2.3.1")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."extglob@^2.0.4")
          (s."fragment-cache@^0.2.1")
          (s."kind-of@^6.0.2")
          (s."nanomatch@^1.2.9")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.2")
          ];
        "micromatch@4.0.5" = f "micromatch" "4.0.5" y "bc8999a7cbbf77cdc89f132f6e467051b49090c6" [
          (s."braces@^3.0.2")
          (s."picomatch@^2.3.1")
          ];
        "micromatch@^3.1.10" = s."micromatch@3.1.10";
        "micromatch@^3.1.4" = s."micromatch@3.1.10";
        "micromatch@^4.0.0" = s."micromatch@4.0.5";
        "micromatch@^4.0.2" = s."micromatch@4.0.5";
        "micromatch@^4.0.4" = s."micromatch@4.0.5";
        "micromatch@^4.0.5" = s."micromatch@4.0.5";
        "miller-rabin@4.0.1" = f "miller-rabin" "4.0.1" y "f080351c865b0dc562a8462966daa53543c78a4d" [
          (s."bn.js@^4.0.0")
          (s."brorand@^1.0.1")
          ];
        "miller-rabin@^4.0.0" = s."miller-rabin@4.0.1";
        "mime-db@1.33.0" = f "mime-db" "1.33.0" y "a3492050a5cb9b63450541e39d9788d2272783db" [];
        "mime-db@1.52.0" = f "mime-db" "1.52.0" y "bbabcdc02859f4987301c856e3387ce5ec43bf70" [];
        "mime-db@>= 1.43.0 < 2" = s."mime-db@1.52.0";
        "mime-db@~1.33.0" = s."mime-db@1.33.0";
        "mime-types@2.1.18" = f "mime-types" "2.1.18" y "6f323f60a83d11146f831ff11fd66e2fe5503bb8" [
          (s."mime-db@~1.33.0")
          ];
        "mime-types@2.1.35" = f "mime-types" "2.1.35" y "381a871b62a734450660ae3deee44813f70d959a" [
          (s."mime-db@1.52.0")
          ];
        "mime-types@^2.1.12" = s."mime-types@2.1.35";
        "mime-types@^2.1.27" = s."mime-types@2.1.35";
        "mime-types@^2.1.30" = s."mime-types@2.1.35";
        "mime-types@^2.1.31" = s."mime-types@2.1.35";
        "mime-types@~2.1.17" = s."mime-types@2.1.35";
        "mime-types@~2.1.24" = s."mime-types@2.1.35";
        "mime-types@~2.1.34" = s."mime-types@2.1.35";
        "mime@1.6.0" = f "mime" "1.6.0" y "32cd9e5c64553bd58d19a568af452acff04981b1" [];
        "mime@2.6.0" = f "mime" "2.6.0" y "a2a682a95cd4d0cb1d6257e28f83da7e35800367" [];
        "mime@^1.3.4" = s."mime@1.6.0";
        "mime@^2.4.4" = s."mime@2.6.0";
        "mimic-fn@2.1.0" = f "mimic-fn" "2.1.0" y "7ed2c2ccccaf84d3ffcb7a69b57711fc2083401b" [];
        "mimic-fn@3.1.0" = f "mimic-fn" "3.1.0" y "65755145bbf3e36954b949c16450427451d5ca74" [];
        "mimic-fn@^2.1.0" = s."mimic-fn@2.1.0";
        "mimic-fn@^3.1.0" = s."mimic-fn@3.1.0";
        "mimic-response@1.0.1" = f "mimic-response" "1.0.1" y "4923538878eef42063cb8a3e3b0798781487ab1b" [];
        "mimic-response@^1.0.0" = s."mimic-response@1.0.1";
        "mimic-response@^1.0.1" = s."mimic-response@1.0.1";
        "min-document@2.19.0" = f "min-document" "2.19.0" y "7bd282e3f5842ed295bb748cdd9f1ffa2c824685" [
          (s."dom-walk@^0.1.0")
          ];
        "min-document@^2.19.0" = s."min-document@2.19.0";
        "min-indent@1.0.1" = f "min-indent" "1.0.1" y "a63f681673b30571fbe8bc25686ae746eefa9869" [];
        "min-indent@^1.0.0" = s."min-indent@1.0.1";
        "mini-create-react-context@0.4.1" = f "mini-create-react-context" "0.4.1" y "072171561bfdc922da08a60c2197a497cc2d1d5e" [
          (s."@babel/runtime@^7.12.1")
          (s."tiny-warning@^1.0.3")
          ];
        "mini-create-react-context@^0.4.0" = s."mini-create-react-context@0.4.1";
        "mini-css-extract-plugin@2.6.1" = f "mini-css-extract-plugin" "2.6.1" y "9a1251d15f2035c342d99a468ab9da7a0451b71e" [
          (s."schema-utils@^4.0.0")
          ];
        "mini-css-extract-plugin@^2.4.5" = s."mini-css-extract-plugin@2.6.1";
        "mini-css-extract-plugin@^2.6.1" = s."mini-css-extract-plugin@2.6.1";
        "minimalistic-assert@1.0.1" = f "minimalistic-assert" "1.0.1" y "2e194de044626d4a10e7f7fbc00ce73e83e4d5c7" [];
        "minimalistic-assert@^1.0.0" = s."minimalistic-assert@1.0.1";
        "minimalistic-assert@^1.0.1" = s."minimalistic-assert@1.0.1";
        "minimalistic-crypto-utils@1.0.1" = f "minimalistic-crypto-utils" "1.0.1" y "f6c00c1c0b082246e5c4d99dfb8c7c083b2b582a" [];
        "minimalistic-crypto-utils@^1.0.1" = s."minimalistic-crypto-utils@1.0.1";
        "minimatch@3.0.4" = f "minimatch" "3.0.4" y "5166e286457f03306064be5497e8dbb0c3d32083" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@3.1.2" = f "minimatch" "3.1.2" y "19cd194bfd3e428f049a70817c038d89ab4be35b" [
          (s."brace-expansion@^1.1.7")
          ];
        "minimatch@5.1.0" = f "minimatch" "5.1.0" y "1717b464f4971b144f6aabe8f2d0b8e4511e09c7" [
          (s."brace-expansion@^2.0.1")
          ];
        "minimatch@^3.0.2" = s."minimatch@3.1.2";
        "minimatch@^3.0.3" = s."minimatch@3.1.2";
        "minimatch@^3.0.4" = s."minimatch@3.1.2";
        "minimatch@^3.1.1" = s."minimatch@3.1.2";
        "minimatch@^3.1.2" = s."minimatch@3.1.2";
        "minimatch@^5.0.1" = s."minimatch@5.1.0";
        "minimist@1.2.6" = f "minimist" "1.2.6" y "8637a5b759ea0d6e98702cfb3a9283323c93af44" [];
        "minimist@^1.1.1" = s."minimist@1.2.6";
        "minimist@^1.1.3" = s."minimist@1.2.6";
        "minimist@^1.2.0" = s."minimist@1.2.6";
        "minimist@^1.2.5" = s."minimist@1.2.6";
        "minimist@^1.2.6" = s."minimist@1.2.6";
        "minipass-collect@1.0.2" = f "minipass-collect" "1.0.2" y "22b813bf745dc6edba2576b940022ad6edc8c617" [
          (s."minipass@^3.0.0")
          ];
        "minipass-collect@^1.0.2" = s."minipass-collect@1.0.2";
        "minipass-flush@1.0.5" = f "minipass-flush" "1.0.5" y "82e7135d7e89a50ffe64610a787953c4c4cbb373" [
          (s."minipass@^3.0.0")
          ];
        "minipass-flush@^1.0.5" = s."minipass-flush@1.0.5";
        "minipass-pipeline@1.2.4" = f "minipass-pipeline" "1.2.4" y "68472f79711c084657c067c5c6ad93cddea8214c" [
          (s."minipass@^3.0.0")
          ];
        "minipass-pipeline@^1.2.2" = s."minipass-pipeline@1.2.4";
        "minipass@3.3.3" = f "minipass" "3.3.3" y "fd1f0e6c06449c10dadda72618b59c00f3d6378d" [
          (s."yallist@^4.0.0")
          ];
        "minipass@^3.0.0" = s."minipass@3.3.3";
        "minipass@^3.1.1" = s."minipass@3.3.3";
        "minizlib@2.1.2" = f "minizlib" "2.1.2" y "e90d3466ba209b932451508a11ce3d3632145931" [
          (s."minipass@^3.0.0")
          (s."yallist@^4.0.0")
          ];
        "minizlib@^2.1.1" = s."minizlib@2.1.2";
        "mississippi@3.0.0" = f "mississippi" "3.0.0" y "ea0a3291f97e0b5e8776b363d5f0a12d94c67022" [
          (s."concat-stream@^1.5.0")
          (s."duplexify@^3.4.2")
          (s."end-of-stream@^1.1.0")
          (s."flush-write-stream@^1.0.0")
          (s."from2@^2.1.0")
          (s."parallel-transform@^1.1.0")
          (s."pump@^3.0.0")
          (s."pumpify@^1.3.3")
          (s."stream-each@^1.1.0")
          (s."through2@^2.0.0")
          ];
        "mississippi@^3.0.0" = s."mississippi@3.0.0";
        "mixin-deep@1.3.2" = f "mixin-deep" "1.3.2" y "1120b43dc359a785dce65b55b82e257ccf479566" [
          (s."for-in@^1.0.2")
          (s."is-extendable@^1.0.1")
          ];
        "mixin-deep@^1.2.0" = s."mixin-deep@1.3.2";
        "mkdirp@0.5.6" = f "mkdirp" "0.5.6" y "7def03d2432dcae4ba1d611445c48396062255f6" [
          (s."minimist@^1.2.6")
          ];
        "mkdirp@1.0.4" = f "mkdirp" "1.0.4" y "3eb5ed62622756d79a5f0e2a221dfebad75c2f7e" [];
        "mkdirp@^0.5.1" = s."mkdirp@0.5.6";
        "mkdirp@^0.5.3" = s."mkdirp@0.5.6";
        "mkdirp@^1.0.3" = s."mkdirp@1.0.4";
        "mkdirp@^1.0.4" = s."mkdirp@1.0.4";
        "mkdirp@~0.5.1" = s."mkdirp@0.5.6";
        "moduleserve@0.9.1" = f "moduleserve" "0.9.1" y "11bad4337ea248d7eaf10d2c7f8649a8c3b9c1f8" [
          (s."send@^0.17.1")
          (s."serve-static@^1.14.1")
          ];
        "moduleserve@^0.9.1" = s."moduleserve@0.9.1";
        "move-concurrently@1.0.1" = f "move-concurrently" "1.0.1" y "be2c005fda32e0b29af1f05d7c4b33214c701f92" [
          (s."aproba@^1.1.1")
          (s."copy-concurrently@^1.0.0")
          (s."fs-write-stream-atomic@^1.0.8")
          (s."mkdirp@^0.5.1")
          (s."rimraf@^2.5.4")
          (s."run-queue@^1.0.3")
          ];
        "move-concurrently@^1.0.1" = s."move-concurrently@1.0.1";
        "mrmime@1.0.1" = f "mrmime" "1.0.1" y "5f90c825fad4bdd41dc914eff5d1a8cfdaf24f27" [];
        "mrmime@^1.0.0" = s."mrmime@1.0.1";
        "ms@2.0.0" = f "ms" "2.0.0" y "5608aeadfc00be6c2901df5f9861788de0d597c8" [];
        "ms@2.1.1" = f "ms" "2.1.1" y "30a5864eb3ebb0a66f2ebe6d727af06a09d86e0a" [];
        "ms@2.1.2" = f "ms" "2.1.2" y "d09d1f357b443f493382a8eb3ccd183872ae6009" [];
        "ms@2.1.3" = f "ms" "2.1.3" y "574c8138ce1d2b5861f0b44579dbadd60c6615b2" [];
        "ms@^2.1.1" = s."ms@2.1.3";
        "multicast-dns@7.2.5" = f "multicast-dns" "7.2.5" y "77eb46057f4d7adbd16d9290fa7299f6fa64cced" [
          (s."dns-packet@^5.2.2")
          (s."thunky@^1.0.2")
          ];
        "multicast-dns@^7.2.5" = s."multicast-dns@7.2.5";
        "mute-stream@0.0.8" = f "mute-stream" "0.0.8" y "1630c42b2251ff81e2a283de96a5497ea92e5e0d" [];
        "mute-stream@~0.0.4" = s."mute-stream@0.0.8";
        "nan@2.16.0" = f "nan" "2.16.0" y "664f43e45460fb98faf00edca0bb0d7b8dce7916" [];
        "nan@^2.12.1" = s."nan@2.16.0";
        "nano-css@5.3.5" = f "nano-css" "5.3.5" y "3075ea29ffdeb0c7cb6d25edb21d8f7fa8e8fe8e" [
          (s."css-tree@^1.1.2")
          (s."csstype@^3.0.6")
          (s."fastest-stable-stringify@^2.0.2")
          (s."inline-style-prefixer@^6.0.0")
          (s."rtl-css-js@^1.14.0")
          (s."sourcemap-codec@^1.4.8")
          (s."stacktrace-js@^2.0.2")
          (s."stylis@^4.0.6")
          ];
        "nano-css@^5.3.1" = s."nano-css@5.3.5";
        "nanoclone@0.2.1" = f "nanoclone" "0.2.1" y "dd4090f8f1a110d26bb32c49ed2f5b9235209ed4" [];
        "nanoclone@^0.2.1" = s."nanoclone@0.2.1";
        "nanoid@3.3.4" = f "nanoid" "3.3.4" y "730b67e3cd09e2deacf03c027c81c9d9dbc5e8ab" [];
        "nanoid@^3.3.1" = s."nanoid@3.3.4";
        "nanoid@^3.3.4" = s."nanoid@3.3.4";
        "nanomatch@1.2.13" = f "nanomatch" "1.2.13" y "b87a8aa4fc0de8fe6be88895b38983ff265bd119" [
          (s."arr-diff@^4.0.0")
          (s."array-unique@^0.3.2")
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."fragment-cache@^0.2.1")
          (s."is-windows@^1.0.2")
          (s."kind-of@^6.0.2")
          (s."object.pick@^1.3.0")
          (s."regex-not@^1.0.0")
          (s."snapdragon@^0.8.1")
          (s."to-regex@^3.0.1")
          ];
        "nanomatch@^1.2.9" = s."nanomatch@1.2.13";
        "natural-compare@1.4.0" = f "natural-compare" "1.4.0" y "4abebfeed7541f2c27acfb29bdbbd15c8d5ba4f7" [];
        "natural-compare@^1.4.0" = s."natural-compare@1.4.0";
        "negotiator@0.6.3" = f "negotiator" "0.6.3" y "58e323a72fedc0d6f9cd4d31fe49f51479590ccd" [];
        "neo-async@2.6.2" = f "neo-async" "2.6.2" y "b4aafb93e3aeb2d8174ca53cf163ab7d7308305f" [];
        "neo-async@^2.5.0" = s."neo-async@2.6.2";
        "neo-async@^2.6.0" = s."neo-async@2.6.2";
        "neo-async@^2.6.1" = s."neo-async@2.6.2";
        "neo-async@^2.6.2" = s."neo-async@2.6.2";
        "nested-error-stacks@2.1.1" = f "nested-error-stacks" "2.1.1" y "26c8a3cee6cc05fbcf1e333cd2fc3e003326c0b5" [];
        "nested-error-stacks@^2.0.0" = s."nested-error-stacks@2.1.1";
        "nested-error-stacks@^2.1.0" = s."nested-error-stacks@2.1.1";
        "nice-try@1.0.5" = f "nice-try" "1.0.5" y "a3378a7696ce7d223e88fc9b764bd7ef1089e366" [];
        "nice-try@^1.0.4" = s."nice-try@1.0.5";
        "no-case@3.0.4" = f "no-case" "3.0.4" y "d361fd5c9800f558551a8369fc0dcd4662b6124d" [
          (s."lower-case@^2.0.2")
          (s."tslib@^2.0.3")
          ];
        "no-case@^3.0.4" = s."no-case@3.0.4";
        "node-dir@0.1.17" = f "node-dir" "0.1.17" y "5f5665d93351335caabef8f1c554516cf5f1e4e5" [
          (s."minimatch@^3.0.2")
          ];
        "node-dir@^0.1.10" = s."node-dir@0.1.17";
        "node-emoji@1.11.0" = f "node-emoji" "1.11.0" y "69a0150e6946e2f115e9d7ea4df7971e2628301c" [
          (s."lodash@^4.17.21")
          ];
        "node-emoji@^1.10.0" = s."node-emoji@1.11.0";
        "node-fetch@2.6.7" = f "node-fetch" "2.6.7" y "24de9fba827e3b4ae44dc8b20256a379160052ad" [
          (s."whatwg-url@^5.0.0")
          ];
        "node-fetch@^2.6.1" = s."node-fetch@2.6.7";
        "node-fetch@^2.6.7" = s."node-fetch@2.6.7";
        "node-forge@1.3.1" = f "node-forge" "1.3.1" y "be8da2af243b2417d5f646a770663a92b7e9ded3" [];
        "node-forge@^1" = s."node-forge@1.3.1";
        "node-int64@0.4.0" = f "node-int64" "0.4.0" y "87a9065cdb355d3182d8f94ce11188b825c68a3b" [];
        "node-int64@^0.4.0" = s."node-int64@0.4.0";
        "node-libs-browser@2.2.1" = f "node-libs-browser" "2.2.1" y "b64f513d18338625f90346d27b0d235e631f6425" [
          (s."assert@^1.1.1")
          (s."browserify-zlib@^0.2.0")
          (s."buffer@^4.3.0")
          (s."console-browserify@^1.1.0")
          (s."constants-browserify@^1.0.0")
          (s."crypto-browserify@^3.11.0")
          (s."domain-browser@^1.1.1")
          (s."events@^3.0.0")
          (s."https-browserify@^1.0.0")
          (s."os-browserify@^0.3.0")
          (s."path-browserify@0.0.1")
          (s."process@^0.11.10")
          (s."punycode@^1.2.4")
          (s."querystring-es3@^0.2.0")
          (s."readable-stream@^2.3.3")
          (s."stream-browserify@^2.0.1")
          (s."stream-http@^2.7.2")
          (s."string_decoder@^1.0.0")
          (s."timers-browserify@^2.0.4")
          (s."tty-browserify@0.0.0")
          (s."url@^0.11.0")
          (s."util@^0.11.0")
          (s."vm-browserify@^1.0.1")
          ];
        "node-libs-browser@^2.2.1" = s."node-libs-browser@2.2.1";
        "node-preload@0.2.1" = f "node-preload" "0.2.1" y "c03043bb327f417a18fee7ab7ee57b408a144301" [
          (s."process-on-spawn@^1.0.0")
          ];
        "node-preload@^0.2.1" = s."node-preload@0.2.1";
        "node-releases@2.0.5" = f "node-releases" "2.0.5" y "280ed5bc3eba0d96ce44897d8aee478bfb3d9666" [];
        "node-releases@^2.0.5" = s."node-releases@2.0.5";
        "normalize-package-data@2.5.0" = f "normalize-package-data" "2.5.0" y "e66db1838b200c1dfc233225d12cb36520e234a8" [
          (s."hosted-git-info@^2.1.4")
          (s."resolve@^1.10.0")
          (s."semver@2 || 3 || 4 || 5")
          (s."validate-npm-package-license@^3.0.1")
          ];
        "normalize-package-data@^2.3.2" = s."normalize-package-data@2.5.0";
        "normalize-package-data@^2.3.4" = s."normalize-package-data@2.5.0";
        "normalize-package-data@^2.5.0" = s."normalize-package-data@2.5.0";
        "normalize-path@2.1.1" = f "normalize-path" "2.1.1" y "1ab28b556e198363a8c1a6f7e6fa20137fe6aed9" [
          (s."remove-trailing-separator@^1.0.1")
          ];
        "normalize-path@3.0.0" = f "normalize-path" "3.0.0" y "0dcd69ff23a1c9b11fd0978316644a0388216a65" [];
        "normalize-path@^2.1.1" = s."normalize-path@2.1.1";
        "normalize-path@^3.0.0" = s."normalize-path@3.0.0";
        "normalize-path@~3.0.0" = s."normalize-path@3.0.0";
        "normalize-range@0.1.2" = f "normalize-range" "0.1.2" y "2d10c06bdfd312ea9777695a4d28439456b75942" [];
        "normalize-range@^0.1.2" = s."normalize-range@0.1.2";
        "normalize-url@4.5.1" = f "normalize-url" "4.5.1" y "0dd90cf1288ee1d1313b87081c9a5932ee48518a" [];
        "normalize-url@6.1.0" = f "normalize-url" "6.1.0" y "40d0885b535deffe3f3147bec877d05fe4c5668a" [];
        "normalize-url@^4.1.0" = s."normalize-url@4.5.1";
        "normalize-url@^6.0.1" = s."normalize-url@6.1.0";
        "npm-run-path@2.0.2" = f "npm-run-path" "2.0.2" y "35a9232dfa35d7067b4cb2ddf2357b1871536c5f" [
          (s."path-key@^2.0.0")
          ];
        "npm-run-path@4.0.1" = f "npm-run-path" "4.0.1" y "b7ecd1e5ed53da8e37a55e1c2269e0b97ed748ea" [
          (s."path-key@^3.0.0")
          ];
        "npm-run-path@^2.0.0" = s."npm-run-path@2.0.2";
        "npm-run-path@^4.0.1" = s."npm-run-path@4.0.1";
        "npmlog@5.0.1" = f "npmlog" "5.0.1" y "f06678e80e29419ad67ab964e0fa69959c1eb8b0" [
          (s."are-we-there-yet@^2.0.0")
          (s."console-control-strings@^1.1.0")
          (s."gauge@^3.0.0")
          (s."set-blocking@^2.0.0")
          ];
        "npmlog@^5.0.1" = s."npmlog@5.0.1";
        "nprogress@0.2.0" = f "nprogress" "0.2.0" y "cb8f34c53213d895723fcbab907e9422adbcafb1" [];
        "nprogress@^0.2.0" = s."nprogress@0.2.0";
        "nth-check@1.0.2" = f "nth-check" "1.0.2" y "b2bd295c37e3dd58a3bf0700376663ba4d9cf05c" [
          (s."boolbase@~1.0.0")
          ];
        "nth-check@2.1.1" = f "nth-check" "2.1.1" y "c9eab428effce36cd6b92c924bdb000ef1f1ed1d" [
          (s."boolbase@^1.0.0")
          ];
        "nth-check@^1.0.2" = s."nth-check@1.0.2";
        "nth-check@^2.0.1" = s."nth-check@2.1.1";
        "num2fraction@1.2.2" = f "num2fraction" "1.2.2" y "6f682b6a027a4e9ddfa4564cd2589d1d4e669ede" [];
        "num2fraction@^1.2.2" = s."num2fraction@1.2.2";
        "nwsapi@2.2.0" = f "nwsapi" "2.2.0" y "204879a9e3d068ff2a55139c2c772780681a38b7" [];
        "nwsapi@^2.2.0" = s."nwsapi@2.2.0";
        "nyc@15.1.0" = f "nyc" "15.1.0" y "1335dae12ddc87b6e249d5a1994ca4bdaea75f02" [
          (s."@istanbuljs/load-nyc-config@^1.0.0")
          (s."@istanbuljs/schema@^0.1.2")
          (s."caching-transform@^4.0.0")
          (s."convert-source-map@^1.7.0")
          (s."decamelize@^1.2.0")
          (s."find-cache-dir@^3.2.0")
          (s."find-up@^4.1.0")
          (s."foreground-child@^2.0.0")
          (s."get-package-type@^0.1.0")
          (s."glob@^7.1.6")
          (s."istanbul-lib-coverage@^3.0.0")
          (s."istanbul-lib-hook@^3.0.0")
          (s."istanbul-lib-instrument@^4.0.0")
          (s."istanbul-lib-processinfo@^2.0.2")
          (s."istanbul-lib-report@^3.0.0")
          (s."istanbul-lib-source-maps@^4.0.0")
          (s."istanbul-reports@^3.0.2")
          (s."make-dir@^3.0.0")
          (s."node-preload@^0.2.1")
          (s."p-map@^3.0.0")
          (s."process-on-spawn@^1.0.0")
          (s."resolve-from@^5.0.0")
          (s."rimraf@^3.0.0")
          (s."signal-exit@^3.0.2")
          (s."spawn-wrap@^2.0.0")
          (s."test-exclude@^6.0.0")
          (s."yargs@^15.0.2")
          ];
        "nyc@^15.1.0" = s."nyc@15.1.0";
        "object-assign@4.1.1" = f "object-assign" "4.1.1" y "2109adc7965887cfc05cbbd442cac8bfbb360863" [];
        "object-assign@^4.0.1" = s."object-assign@4.1.1";
        "object-assign@^4.1.0" = s."object-assign@4.1.1";
        "object-assign@^4.1.1" = s."object-assign@4.1.1";
        "object-copy@0.1.0" = f "object-copy" "0.1.0" y "7e7d858b781bd7c991a41ba975ed3812754e998c" [
          (s."copy-descriptor@^0.1.0")
          (s."define-property@^0.2.5")
          (s."kind-of@^3.0.3")
          ];
        "object-copy@^0.1.0" = s."object-copy@0.1.0";
        "object-hash@3.0.0" = f "object-hash" "3.0.0" y "73f97f753e7baffc0e2cc9d6e079079744ac82e9" [];
        "object-hash@^3.0.0" = s."object-hash@3.0.0";
        "object-inspect@1.12.2" = f "object-inspect" "1.12.2" y "c0641f26394532f28ab8d796ab954e43c009a8ea" [];
        "object-inspect@^1.12.0" = s."object-inspect@1.12.2";
        "object-inspect@^1.9.0" = s."object-inspect@1.12.2";
        "object-keys@1.1.1" = f "object-keys" "1.1.1" y "1c47f272df277f3b1daf061677d9c82e2322c60e" [];
        "object-keys@^1.1.1" = s."object-keys@1.1.1";
        "object-visit@1.0.1" = f "object-visit" "1.0.1" y "f79c4493af0c5377b59fe39d395e41042dd045bb" [
          (s."isobject@^3.0.0")
          ];
        "object-visit@^1.0.0" = s."object-visit@1.0.1";
        "object.assign@4.1.2" = f "object.assign" "4.1.2" y "0ed54a342eceb37b38ff76eb831a0e788cb63940" [
          (s."call-bind@^1.0.0")
          (s."define-properties@^1.1.3")
          (s."has-symbols@^1.0.1")
          (s."object-keys@^1.1.1")
          ];
        "object.assign@^4.1.0" = s."object.assign@4.1.2";
        "object.assign@^4.1.2" = s."object.assign@4.1.2";
        "object.entries@1.1.5" = f "object.entries" "1.1.5" y "e1acdd17c4de2cd96d5a08487cfb9db84d881861" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          ];
        "object.entries@^1.1.0" = s."object.entries@1.1.5";
        "object.entries@^1.1.5" = s."object.entries@1.1.5";
        "object.fromentries@2.0.5" = f "object.fromentries" "2.0.5" y "7b37b205109c21e741e605727fe8b0ad5fa08251" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          ];
        "object.fromentries@^2.0.0 || ^1.0.0" = s."object.fromentries@2.0.5";
        "object.fromentries@^2.0.5" = s."object.fromentries@2.0.5";
        "object.getownpropertydescriptors@2.1.4" = f "object.getownpropertydescriptors" "2.1.4" y "7965e6437a57278b587383831a9b829455a4bc37" [
          (s."array.prototype.reduce@^1.0.4")
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.4")
          (s."es-abstract@^1.20.1")
          ];
        "object.getownpropertydescriptors@^2.0.3" = s."object.getownpropertydescriptors@2.1.4";
        "object.getownpropertydescriptors@^2.1.0" = s."object.getownpropertydescriptors@2.1.4";
        "object.getownpropertydescriptors@^2.1.2" = s."object.getownpropertydescriptors@2.1.4";
        "object.hasown@1.1.1" = f "object.hasown" "1.1.1" y "ad1eecc60d03f49460600430d97f23882cf592a3" [
          (s."define-properties@^1.1.4")
          (s."es-abstract@^1.19.5")
          ];
        "object.hasown@^1.1.1" = s."object.hasown@1.1.1";
        "object.pick@1.3.0" = f "object.pick" "1.3.0" y "87a10ac4c1694bd2e1cbf53591a66141fb5dd747" [
          (s."isobject@^3.0.1")
          ];
        "object.pick@^1.3.0" = s."object.pick@1.3.0";
        "object.values@1.1.5" = f "object.values" "1.1.5" y "959f63e3ce9ef108720333082131e4a459b716ac" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          ];
        "object.values@^1.1.0" = s."object.values@1.1.5";
        "object.values@^1.1.5" = s."object.values@1.1.5";
        "objectorarray@1.0.5" = f "objectorarray" "1.0.5" y "2c05248bbefabd8f43ad13b41085951aac5e68a5" [];
        "objectorarray@^1.0.5" = s."objectorarray@1.0.5";
        "obuf@1.1.2" = f "obuf" "1.1.2" y "09bea3343d41859ebd446292d11c9d4db619084e" [];
        "obuf@^1.0.0" = s."obuf@1.1.2";
        "obuf@^1.1.2" = s."obuf@1.1.2";
        "on-finished@2.3.0" = f "on-finished" "2.3.0" y "20f1336481b083cd75337992a16971aa2d906947" [
          (s."ee-first@1.1.1")
          ];
        "on-finished@2.4.1" = f "on-finished" "2.4.1" y "58c8c44116e54845ad57f14ab10b03533184ac3f" [
          (s."ee-first@1.1.1")
          ];
        "on-finished@~2.3.0" = s."on-finished@2.3.0";
        "on-headers@1.0.2" = f "on-headers" "1.0.2" y "772b0ae6aaa525c399e489adfad90c403eb3c28f" [];
        "on-headers@~1.0.2" = s."on-headers@1.0.2";
        "once@1.4.0" = f "once" "1.4.0" y "583b1aa775961d4b113ac17d9c50baef9dd76bd1" [
          (s."wrappy@1")
          ];
        "once@^1.3.0" = s."once@1.4.0";
        "once@^1.3.1" = s."once@1.4.0";
        "once@^1.4.0" = s."once@1.4.0";
        "onetime@5.1.2" = f "onetime" "5.1.2" y "d0e96ebb56b07476df1dd9c4806e5237985ca45e" [
          (s."mimic-fn@^2.1.0")
          ];
        "onetime@^5.1.2" = s."onetime@5.1.2";
        "open@7.4.2" = f "open" "7.4.2" y "b8147e26dcf3e426316c730089fd71edd29c2321" [
          (s."is-docker@^2.0.0")
          (s."is-wsl@^2.1.1")
          ];
        "open@8.4.0" = f "open" "8.4.0" y "345321ae18f8138f82565a910fdc6b39e8c244f8" [
          (s."define-lazy-prop@^2.0.0")
          (s."is-docker@^2.1.1")
          (s."is-wsl@^2.2.0")
          ];
        "open@^7.0.3" = s."open@7.4.2";
        "open@^8.0.9" = s."open@8.4.0";
        "open@^8.4.0" = s."open@8.4.0";
        "opener@1.5.2" = f "opener" "1.5.2" y "5d37e1f35077b9dcac4301372271afdeb2a13598" [];
        "opener@^1.5.2" = s."opener@1.5.2";
        "optionator@0.8.3" = f "optionator" "0.8.3" y "84fa1d036fe9d3c7e21d99884b601167ec8fb495" [
          (s."deep-is@~0.1.3")
          (s."fast-levenshtein@~2.0.6")
          (s."levn@~0.3.0")
          (s."prelude-ls@~1.1.2")
          (s."type-check@~0.3.2")
          (s."word-wrap@~1.2.3")
          ];
        "optionator@0.9.1" = f "optionator" "0.9.1" y "4f236a6373dae0566a6d43e1326674f50c291499" [
          (s."deep-is@^0.1.3")
          (s."fast-levenshtein@^2.0.6")
          (s."levn@^0.4.1")
          (s."prelude-ls@^1.2.1")
          (s."type-check@^0.4.0")
          (s."word-wrap@^1.2.3")
          ];
        "optionator@^0.8.1" = s."optionator@0.8.3";
        "optionator@^0.9.1" = s."optionator@0.9.1";
        "os-browserify@0.3.0" = f "os-browserify" "0.3.0" y "854373c7f5c2315914fc9bfc6bd8238fdda1ec27" [];
        "os-browserify@^0.3.0" = s."os-browserify@0.3.0";
        "os-homedir@1.0.2" = f "os-homedir" "1.0.2" y "ffbc4988336e0e833de0c168c7ef152121aa7fb3" [];
        "os-homedir@^1.0.0" = s."os-homedir@1.0.2";
        "os-tmpdir@1.0.2" = f "os-tmpdir" "1.0.2" y "bbe67406c79aa85c5cfec766fe5734555dfa1274" [];
        "os-tmpdir@^1.0.0" = s."os-tmpdir@1.0.2";
        "os-tmpdir@~1.0.1" = s."os-tmpdir@1.0.2";
        "os@0.1.1" = f "os" "0.1.1" y "208845e89e193ad4d971474b93947736a56d13f3" [];
        "osenv@0.1.5" = f "osenv" "0.1.5" y "85cdfafaeb28e8677f416e287592b5f3f49ea410" [
          (s."os-homedir@^1.0.0")
          (s."os-tmpdir@^1.0.0")
          ];
        "osenv@^0.1.3" = s."osenv@0.1.5";
        "p-all@2.1.0" = f "p-all" "2.1.0" y "91419be56b7dee8fe4c5db875d55e0da084244a0" [
          (s."p-map@^2.0.0")
          ];
        "p-all@^2.1.0" = s."p-all@2.1.0";
        "p-cancelable@1.1.0" = f "p-cancelable" "1.1.0" y "d078d15a3af409220c886f1d9a0ca2e441ab26cc" [];
        "p-cancelable@^1.0.0" = s."p-cancelable@1.1.0";
        "p-defer@1.0.0" = f "p-defer" "1.0.0" y "9f6eb182f6c9aa8cd743004a7d4f96b196b0fb0c" [];
        "p-defer@^1.0.0" = s."p-defer@1.0.0";
        "p-event@4.2.0" = f "p-event" "4.2.0" y "af4b049c8acd91ae81083ebd1e6f5cae2044c1b5" [
          (s."p-timeout@^3.1.0")
          ];
        "p-event@^4.1.0" = s."p-event@4.2.0";
        "p-filter@2.1.0" = f "p-filter" "2.1.0" y "1b1472562ae7a0f742f0f3d3d3718ea66ff9c09c" [
          (s."p-map@^2.0.0")
          ];
        "p-filter@^2.1.0" = s."p-filter@2.1.0";
        "p-finally@1.0.0" = f "p-finally" "1.0.0" y "3fbcfb15b899a44123b34b6dcc18b724336a2cae" [];
        "p-finally@^1.0.0" = s."p-finally@1.0.0";
        "p-limit@1.3.0" = f "p-limit" "1.3.0" y "b86bd5f0c25690911c7590fcbfc2010d54b3ccb8" [
          (s."p-try@^1.0.0")
          ];
        "p-limit@2.3.0" = f "p-limit" "2.3.0" y "3dd33c647a214fdfffd835933eb086da0dc21db1" [
          (s."p-try@^2.0.0")
          ];
        "p-limit@3.1.0" = f "p-limit" "3.1.0" y "e1daccbe78d0d1388ca18c64fea38e3e57e3706b" [
          (s."yocto-queue@^0.1.0")
          ];
        "p-limit@^1.1.0" = s."p-limit@1.3.0";
        "p-limit@^2.0.0" = s."p-limit@2.3.0";
        "p-limit@^2.2.0" = s."p-limit@2.3.0";
        "p-limit@^3.0.2" = s."p-limit@3.1.0";
        "p-locate@2.0.0" = f "p-locate" "2.0.0" y "20a0103b222a70c8fd39cc2e580680f3dde5ec43" [
          (s."p-limit@^1.1.0")
          ];
        "p-locate@3.0.0" = f "p-locate" "3.0.0" y "322d69a05c0264b25997d9f40cd8a891ab0064a4" [
          (s."p-limit@^2.0.0")
          ];
        "p-locate@4.1.0" = f "p-locate" "4.1.0" y "a3428bb7088b3a60292f66919278b7c297ad4f07" [
          (s."p-limit@^2.2.0")
          ];
        "p-locate@5.0.0" = f "p-locate" "5.0.0" y "83c8315c6785005e3bd021839411c9e110e6d834" [
          (s."p-limit@^3.0.2")
          ];
        "p-locate@^2.0.0" = s."p-locate@2.0.0";
        "p-locate@^3.0.0" = s."p-locate@3.0.0";
        "p-locate@^4.1.0" = s."p-locate@4.1.0";
        "p-locate@^5.0.0" = s."p-locate@5.0.0";
        "p-map@2.1.0" = f "p-map" "2.1.0" y "310928feef9c9ecc65b68b17693018a665cea175" [];
        "p-map@3.0.0" = f "p-map" "3.0.0" y "d704d9af8a2ba684e2600d9a215983d4141a979d" [
          (s."aggregate-error@^3.0.0")
          ];
        "p-map@4.0.0" = f "p-map" "4.0.0" y "bb2f95a5eda2ec168ec9274e06a747c3e2904d2b" [
          (s."aggregate-error@^3.0.0")
          ];
        "p-map@^2.0.0" = s."p-map@2.1.0";
        "p-map@^3.0.0" = s."p-map@3.0.0";
        "p-map@^4.0.0" = s."p-map@4.0.0";
        "p-retry@4.6.2" = f "p-retry" "4.6.2" y "9baae7184057edd4e17231cee04264106e092a16" [
          (s."@types/retry@0.12.0")
          (s."retry@^0.13.1")
          ];
        "p-retry@^4.5.0" = s."p-retry@4.6.2";
        "p-timeout@3.2.0" = f "p-timeout" "3.2.0" y "c7e17abc971d2a7962ef83626b35d635acf23dfe" [
          (s."p-finally@^1.0.0")
          ];
        "p-timeout@^3.1.0" = s."p-timeout@3.2.0";
        "p-try@1.0.0" = f "p-try" "1.0.0" y "cbc79cdbaf8fd4228e13f621f2b1a237c1b207b3" [];
        "p-try@2.2.0" = f "p-try" "2.2.0" y "cb2868540e313d61de58fafbe35ce9004d5540e6" [];
        "p-try@^1.0.0" = s."p-try@1.0.0";
        "p-try@^2.0.0" = s."p-try@2.2.0";
        "package-hash@4.0.0" = f "package-hash" "4.0.0" y "3537f654665ec3cc38827387fc904c163c54f506" [
          (s."graceful-fs@^4.1.15")
          (s."hasha@^5.0.0")
          (s."lodash.flattendeep@^4.4.0")
          (s."release-zalgo@^1.0.0")
          ];
        "package-hash@^4.0.0" = s."package-hash@4.0.0";
        "package-json@6.5.0" = f "package-json" "6.5.0" y "6feedaca35e75725876d0b0e64974697fed145b0" [
          (s."got@^9.6.0")
          (s."registry-auth-token@^4.0.0")
          (s."registry-url@^5.0.0")
          (s."semver@^6.2.0")
          ];
        "package-json@^6.3.0" = s."package-json@6.5.0";
        "pako@1.0.11" = f "pako" "1.0.11" y "6c9599d340d54dfd3946380252a35705a6b992bf" [];
        "pako@2.0.4" = f "pako" "2.0.4" y "6cebc4bbb0b6c73b0d5b8d7e8476e2b2fbea576d" [];
        "pako@^2.0.4" = s."pako@2.0.4";
        "pako@~1.0.5" = s."pako@1.0.11";
        "parallel-transform@1.2.0" = f "parallel-transform" "1.2.0" y "9049ca37d6cb2182c3b1d2c720be94d14a5814fc" [
          (s."cyclist@^1.0.1")
          (s."inherits@^2.0.3")
          (s."readable-stream@^2.1.5")
          ];
        "parallel-transform@^1.1.0" = s."parallel-transform@1.2.0";
        "param-case@3.0.4" = f "param-case" "3.0.4" y "7d17fe4aa12bde34d4a77d91acfb6219caad01c5" [
          (s."dot-case@^3.0.4")
          (s."tslib@^2.0.3")
          ];
        "param-case@^3.0.3" = s."param-case@3.0.4";
        "param-case@^3.0.4" = s."param-case@3.0.4";
        "parent-module@1.0.1" = f "parent-module" "1.0.1" y "691d2709e78c79fae3a156622452d00762caaaa2" [
          (s."callsites@^3.0.0")
          ];
        "parent-module@^1.0.0" = s."parent-module@1.0.1";
        "parse-asn1@5.1.6" = f "parse-asn1" "5.1.6" y "385080a3ec13cb62a62d39409cb3e88844cdaed4" [
          (s."asn1.js@^5.2.0")
          (s."browserify-aes@^1.0.0")
          (s."evp_bytestokey@^1.0.0")
          (s."pbkdf2@^3.0.3")
          (s."safe-buffer@^5.1.1")
          ];
        "parse-asn1@^5.0.0" = s."parse-asn1@5.1.6";
        "parse-asn1@^5.1.5" = s."parse-asn1@5.1.6";
        "parse-entities@2.0.0" = f "parse-entities" "2.0.0" y "53c6eb5b9314a1f4ec99fa0fdf7ce01ecda0cbe8" [
          (s."character-entities@^1.0.0")
          (s."character-entities-legacy@^1.0.0")
          (s."character-reference-invalid@^1.0.0")
          (s."is-alphanumerical@^1.0.0")
          (s."is-decimal@^1.0.0")
          (s."is-hexadecimal@^1.0.0")
          ];
        "parse-entities@^2.0.0" = s."parse-entities@2.0.0";
        "parse-json@2.2.0" = f "parse-json" "2.2.0" y "f480f40434ef80741f8469099f8dea18f55a4dc9" [
          (s."error-ex@^1.2.0")
          ];
        "parse-json@5.2.0" = f "parse-json" "5.2.0" y "c76fc66dee54231c962b22bcc8a72cf2f99753cd" [
          (s."@babel/code-frame@^7.0.0")
          (s."error-ex@^1.3.1")
          (s."json-parse-even-better-errors@^2.3.0")
          (s."lines-and-columns@^1.1.6")
          ];
        "parse-json@^2.2.0" = s."parse-json@2.2.0";
        "parse-json@^5.0.0" = s."parse-json@5.2.0";
        "parse-json@^5.2.0" = s."parse-json@5.2.0";
        "parse-numeric-range@1.3.0" = f "parse-numeric-range" "1.3.0" y "7c63b61190d61e4d53a1197f0c83c47bb670ffa3" [];
        "parse-numeric-range@^1.3.0" = s."parse-numeric-range@1.3.0";
        "parse-semver@1.1.1" = f "parse-semver" "1.1.1" y "9a4afd6df063dc4826f93fba4a99cf223f666cb8" [
          (s."semver@^5.1.0")
          ];
        "parse-semver@^1.1.1" = s."parse-semver@1.1.1";
        "parse5-htmlparser2-tree-adapter@7.0.0" = f "parse5-htmlparser2-tree-adapter" "7.0.0" y "23c2cc233bcf09bb7beba8b8a69d46b08c62c2f1" [
          (s."domhandler@^5.0.2")
          (s."parse5@^7.0.0")
          ];
        "parse5-htmlparser2-tree-adapter@^7.0.0" = s."parse5-htmlparser2-tree-adapter@7.0.0";
        "parse5@6.0.1" = f "parse5" "6.0.1" y "e1a1c085c569b3dc08321184f19a39cc27f7c30b" [];
        "parse5@7.0.0" = f "parse5" "7.0.0" y "51f74a5257f5fcc536389e8c2d0b3802e1bfa91a" [
          (s."entities@^4.3.0")
          ];
        "parse5@^6.0.0" = s."parse5@6.0.1";
        "parse5@^7.0.0" = s."parse5@7.0.0";
        "parseurl@1.3.3" = f "parseurl" "1.3.3" y "9da19e7bee8d12dff0513ed5b76957793bc2e8d4" [];
        "parseurl@~1.3.2" = s."parseurl@1.3.3";
        "parseurl@~1.3.3" = s."parseurl@1.3.3";
        "pascal-case@3.1.2" = f "pascal-case" "3.1.2" y "b48e0ef2b98e205e7c1dae747d0b1508237660eb" [
          (s."no-case@^3.0.4")
          (s."tslib@^2.0.3")
          ];
        "pascal-case@^3.1.2" = s."pascal-case@3.1.2";
        "pascalcase@0.1.1" = f "pascalcase" "0.1.1" y "b363e55e8006ca6fe21784d2db22bd15d7917f14" [];
        "pascalcase@^0.1.1" = s."pascalcase@0.1.1";
        "path-browserify@0.0.1" = f "path-browserify" "0.0.1" y "e6c4ddd7ed3aa27c68a20cc4e50e1a4ee83bbc4a" [];
        "path-browserify@1.0.1" = f "path-browserify" "1.0.1" y "d98454a9c3753d5790860f16f68867b9e46be1fd" [];
        "path-browserify@^1.0.1" = s."path-browserify@1.0.1";
        "path-dirname@1.0.2" = f "path-dirname" "1.0.2" y "cc33d24d525e099a5388c0336c6e32b9160609e0" [];
        "path-dirname@^1.0.0" = s."path-dirname@1.0.2";
        "path-exists@2.1.0" = f "path-exists" "2.1.0" y "0feb6c64f0fc518d9a754dd5efb62c7022761f4b" [
          (s."pinkie-promise@^2.0.0")
          ];
        "path-exists@3.0.0" = f "path-exists" "3.0.0" y "ce0ebeaa5f78cb18925ea7d810d7b59b010fd515" [];
        "path-exists@4.0.0" = f "path-exists" "4.0.0" y "513bdbe2d3b95d7762e8c1137efa195c6c61b5b3" [];
        "path-exists@^2.0.0" = s."path-exists@2.1.0";
        "path-exists@^3.0.0" = s."path-exists@3.0.0";
        "path-exists@^4.0.0" = s."path-exists@4.0.0";
        "path-is-absolute@1.0.1" = f "path-is-absolute" "1.0.1" y "174b9268735534ffbc7ace6bf53a5a9e1b5c5f5f" [];
        "path-is-absolute@^1.0.0" = s."path-is-absolute@1.0.1";
        "path-is-inside@1.0.2" = f "path-is-inside" "1.0.2" y "365417dede44430d1c11af61027facf074bdfc53" [];
        "path-key@2.0.1" = f "path-key" "2.0.1" y "411cadb574c5a140d3a4b1910d40d80cc9f40b40" [];
        "path-key@3.1.1" = f "path-key" "3.1.1" y "581f6ade658cbba65a0d3380de7753295054f375" [];
        "path-key@^2.0.0" = s."path-key@2.0.1";
        "path-key@^2.0.1" = s."path-key@2.0.1";
        "path-key@^3.0.0" = s."path-key@3.1.1";
        "path-key@^3.1.0" = s."path-key@3.1.1";
        "path-parse@1.0.7" = f "path-parse" "1.0.7" y "fbc114b60ca42b30d9daf5858e4bd68bbedb6735" [];
        "path-parse@^1.0.7" = s."path-parse@1.0.7";
        "path-to-regexp@0.1.7" = f "path-to-regexp" "0.1.7" y "df604178005f522f15eb4490e7247a1bfaa67f8c" [];
        "path-to-regexp@1.8.0" = f "path-to-regexp" "1.8.0" y "887b3ba9d84393e87a0a0b9f4cb756198b53548a" [
          (s."isarray@0.0.1")
          ];
        "path-to-regexp@2.2.1" = f "path-to-regexp" "2.2.1" y "90b617025a16381a879bc82a38d4e8bdeb2bcf45" [];
        "path-to-regexp@^1.7.0" = s."path-to-regexp@1.8.0";
        "path-type@1.1.0" = f "path-type" "1.1.0" y "59c44f7ee491da704da415da5a4070ba4f8fe441" [
          (s."graceful-fs@^4.1.2")
          (s."pify@^2.0.0")
          (s."pinkie-promise@^2.0.0")
          ];
        "path-type@3.0.0" = f "path-type" "3.0.0" y "cef31dc8e0a1a3bb0d105c0cd97cf3bf47f4e36f" [
          (s."pify@^3.0.0")
          ];
        "path-type@4.0.0" = f "path-type" "4.0.0" y "84ed01c0a7ba380afe09d90a8c180dcd9d03043b" [];
        "path-type@^1.0.0" = s."path-type@1.1.0";
        "path-type@^3.0.0" = s."path-type@3.0.0";
        "path-type@^4.0.0" = s."path-type@4.0.0";
        "pbkdf2@3.1.2" = f "pbkdf2" "3.1.2" y "dd822aa0887580e52f1a039dc3eda108efae3075" [
          (s."create-hash@^1.1.2")
          (s."create-hmac@^1.1.4")
          (s."ripemd160@^2.0.1")
          (s."safe-buffer@^5.0.1")
          (s."sha.js@^2.4.8")
          ];
        "pbkdf2@^3.0.3" = s."pbkdf2@3.1.2";
        "pdfast@0.2.0" = f "pdfast" "0.2.0" y "8cbc556e1bf2522177787c0de2e0d4373ba885c9" [];
        "pdfast@^0.2.0" = s."pdfast@0.2.0";
        "peggy@2.0.1" = f "peggy" "2.0.1" y "d9bfde03b18d6ec2b9b85b2aa5af51577850152c" [
          (s."commander@^9.3.0")
          (s."source-map-generator@0.8.0")
          ];
        "peggy@^2.0.1" = s."peggy@2.0.1";
        "pend@1.2.0" = f "pend" "1.2.0" y "7a57eb550a6783f9115331fcf4663d5c8e007a50" [];
        "pend@~1.2.0" = s."pend@1.2.0";
        "performance-now@2.1.0" = f "performance-now" "2.1.0" y "6309f4e0e5fa913ec1c69307ae364b4b377c9e7b" [];
        "performance-now@^2.1.0" = s."performance-now@2.1.0";
        "picocolors@0.2.1" = f "picocolors" "0.2.1" y "570670f793646851d1ba135996962abad587859f" [];
        "picocolors@1.0.0" = f "picocolors" "1.0.0" y "cb5bdc74ff3f51892236eaf79d68bc44564ab81c" [];
        "picocolors@^0.2.1" = s."picocolors@0.2.1";
        "picocolors@^1.0.0" = s."picocolors@1.0.0";
        "picomatch@2.3.1" = f "picomatch" "2.3.1" y "3ba3833733646d9d3e4995946c1365a67fb07a42" [];
        "picomatch@^2.0.4" = s."picomatch@2.3.1";
        "picomatch@^2.2.1" = s."picomatch@2.3.1";
        "picomatch@^2.2.2" = s."picomatch@2.3.1";
        "picomatch@^2.2.3" = s."picomatch@2.3.1";
        "picomatch@^2.3.0" = s."picomatch@2.3.1";
        "picomatch@^2.3.1" = s."picomatch@2.3.1";
        "pify@2.3.0" = f "pify" "2.3.0" y "ed141a6ac043a849ea588498e7dca8b15330e90c" [];
        "pify@3.0.0" = f "pify" "3.0.0" y "e5a4acd2c101fdf3d9a4d07f0dbc4db49dd28176" [];
        "pify@4.0.1" = f "pify" "4.0.1" y "4b2cd25c50d598735c50292224fd8c6df41e3231" [];
        "pify@^2.0.0" = s."pify@2.3.0";
        "pify@^2.3.0" = s."pify@2.3.0";
        "pify@^3.0.0" = s."pify@3.0.0";
        "pify@^4.0.1" = s."pify@4.0.1";
        "pinkie-promise@2.0.1" = f "pinkie-promise" "2.0.1" y "2135d6dfa7a358c069ac9b178776288228450ffa" [
          (s."pinkie@^2.0.0")
          ];
        "pinkie-promise@^2.0.0" = s."pinkie-promise@2.0.1";
        "pinkie@2.0.4" = f "pinkie" "2.0.4" y "72556b80cfa0d48a974e80e77248e80ed4f7f870" [];
        "pinkie@^2.0.0" = s."pinkie@2.0.4";
        "pirates@4.0.5" = f "pirates" "4.0.5" y "feec352ea5c3268fb23a37c702ab1699f35a5f3b" [];
        "pirates@^4.0.1" = s."pirates@4.0.5";
        "pirates@^4.0.4" = s."pirates@4.0.5";
        "pirates@^4.0.5" = s."pirates@4.0.5";
        "pkg-dir@3.0.0" = f "pkg-dir" "3.0.0" y "2749020f239ed990881b1f71210d51eb6523bea3" [
          (s."find-up@^3.0.0")
          ];
        "pkg-dir@4.2.0" = f "pkg-dir" "4.2.0" y "f099133df7ede422e81d1d8448270eeb3e4261f3" [
          (s."find-up@^4.0.0")
          ];
        "pkg-dir@5.0.0" = f "pkg-dir" "5.0.0" y "a02d6aebe6ba133a928f74aec20bafdfe6b8e760" [
          (s."find-up@^5.0.0")
          ];
        "pkg-dir@^3.0.0" = s."pkg-dir@3.0.0";
        "pkg-dir@^4.1.0" = s."pkg-dir@4.2.0";
        "pkg-dir@^4.2.0" = s."pkg-dir@4.2.0";
        "pkg-dir@^5.0.0" = s."pkg-dir@5.0.0";
        "pkg-up@3.1.0" = f "pkg-up" "3.1.0" y "100ec235cc150e4fd42519412596a28512a0def5" [
          (s."find-up@^3.0.0")
          ];
        "pkg-up@^3.1.0" = s."pkg-up@3.1.0";
        "pnp-webpack-plugin@1.6.4" = f "pnp-webpack-plugin" "1.6.4" y "c9711ac4dc48a685dabafc86f8b6dd9f8df84149" [
          (s."ts-pnp@^1.1.6")
          ];
        "pnp-webpack-plugin@1.7.0" = f "pnp-webpack-plugin" "1.7.0" y "65741384f6d8056f36e2255a8d67ffc20866f5c9" [
          (s."ts-pnp@^1.1.6")
          ];
        "pnp-webpack-plugin@^1.7.0" = s."pnp-webpack-plugin@1.7.0";
        "polished@4.2.2" = f "polished" "4.2.2" y "2529bb7c3198945373c52e34618c8fe7b1aa84d1" [
          (s."@babel/runtime@^7.17.8")
          ];
        "polished@^4.2.2" = s."polished@4.2.2";
        "popmotion@11.0.3" = f "popmotion" "11.0.3" y "565c5f6590bbcddab7a33a074bb2ba97e24b0cc9" [
          (s."framesync@6.0.1")
          (s."hey-listen@^1.0.8")
          (s."style-value-types@5.0.0")
          (s."tslib@^2.1.0")
          ];
        "posix-character-classes@0.1.1" = f "posix-character-classes" "0.1.1" y "01eac0fe3b5af71a2a6c02feabb8c1fef7e00eab" [];
        "posix-character-classes@^0.1.0" = s."posix-character-classes@0.1.1";
        "postcss-attribute-case-insensitive@5.0.1" = f "postcss-attribute-case-insensitive" "5.0.1" y "86d323c77ab8896ed90500071c2c8329fba64fda" [
          (s."postcss-selector-parser@^6.0.10")
          ];
        "postcss-attribute-case-insensitive@^5.0.1" = s."postcss-attribute-case-insensitive@5.0.1";
        "postcss-browser-comments@4.0.0" = f "postcss-browser-comments" "4.0.0" y "bcfc86134df5807f5d3c0eefa191d42136b5e72a" [];
        "postcss-browser-comments@^4" = s."postcss-browser-comments@4.0.0";
        "postcss-calc@8.2.4" = f "postcss-calc" "8.2.4" y "77b9c29bfcbe8a07ff6693dc87050828889739a5" [
          (s."postcss-selector-parser@^6.0.9")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-calc@^8.2.3" = s."postcss-calc@8.2.4";
        "postcss-clamp@4.1.0" = f "postcss-clamp" "4.1.0" y "7263e95abadd8c2ba1bd911b0b5a5c9c93e02363" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-clamp@^4.1.0" = s."postcss-clamp@4.1.0";
        "postcss-cli@10.0.0" = f "postcss-cli" "10.0.0" y "404e468d1ff39fb5ead3f707e2021be7cd3f8c9f" [
          (s."chokidar@^3.3.0")
          (s."dependency-graph@^0.11.0")
          (s."fs-extra@^10.0.0")
          (s."get-stdin@^9.0.0")
          (s."globby@^13.0.0")
          (s."picocolors@^1.0.0")
          (s."postcss-load-config@^4.0.0")
          (s."postcss-reporter@^7.0.0")
          (s."pretty-hrtime@^1.0.3")
          (s."read-cache@^1.0.0")
          (s."slash@^4.0.0")
          (s."yargs@^17.0.0")
          ];
        "postcss-cli@^10.0.0" = s."postcss-cli@10.0.0";
        "postcss-color-functional-notation@4.2.3" = f "postcss-color-functional-notation" "4.2.3" y "23c9d73c76113b75473edcf66f443c6f1872bd0f" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-color-functional-notation@^4.2.3" = s."postcss-color-functional-notation@4.2.3";
        "postcss-color-hex-alpha@8.0.4" = f "postcss-color-hex-alpha" "8.0.4" y "c66e2980f2fbc1a63f5b079663340ce8b55f25a5" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-color-hex-alpha@^8.0.3" = s."postcss-color-hex-alpha@8.0.4";
        "postcss-color-rebeccapurple@7.1.0" = f "postcss-color-rebeccapurple" "7.1.0" y "a2fe1d7be13d21ea01dc7c2363b637cc83a9eb6e" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-color-rebeccapurple@^7.0.2" = s."postcss-color-rebeccapurple@7.1.0";
        "postcss-colormin@5.3.0" = f "postcss-colormin" "5.3.0" y "3cee9e5ca62b2c27e84fce63affc0cfb5901956a" [
          (s."browserslist@^4.16.6")
          (s."caniuse-api@^3.0.0")
          (s."colord@^2.9.1")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-colormin@^5.3.0" = s."postcss-colormin@5.3.0";
        "postcss-convert-values@5.1.2" = f "postcss-convert-values" "5.1.2" y "31586df4e184c2e8890e8b34a0b9355313f503ab" [
          (s."browserslist@^4.20.3")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-convert-values@^5.1.2" = s."postcss-convert-values@5.1.2";
        "postcss-custom-media@8.0.2" = f "postcss-custom-media" "8.0.2" y "c8f9637edf45fef761b014c024cee013f80529ea" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-custom-media@^8.0.1" = s."postcss-custom-media@8.0.2";
        "postcss-custom-properties@12.1.8" = f "postcss-custom-properties" "12.1.8" y "aa003e1885c5bd28e2e32496cd597e389ca889e4" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-custom-properties@^12.1.7" = s."postcss-custom-properties@12.1.8";
        "postcss-custom-selectors@6.0.3" = f "postcss-custom-selectors" "6.0.3" y "1ab4684d65f30fed175520f82d223db0337239d9" [
          (s."postcss-selector-parser@^6.0.4")
          ];
        "postcss-custom-selectors@^6.0.2" = s."postcss-custom-selectors@6.0.3";
        "postcss-dir-pseudo-class@6.0.4" = f "postcss-dir-pseudo-class" "6.0.4" y "9afe49ea631f0cb36fa0076e7c2feb4e7e3f049c" [
          (s."postcss-selector-parser@^6.0.9")
          ];
        "postcss-dir-pseudo-class@^6.0.4" = s."postcss-dir-pseudo-class@6.0.4";
        "postcss-discard-comments@5.1.2" = f "postcss-discard-comments" "5.1.2" y "8df5e81d2925af2780075840c1526f0660e53696" [];
        "postcss-discard-comments@^5.1.2" = s."postcss-discard-comments@5.1.2";
        "postcss-discard-duplicates@5.1.0" = f "postcss-discard-duplicates" "5.1.0" y "9eb4fe8456706a4eebd6d3b7b777d07bad03e848" [];
        "postcss-discard-duplicates@^5.1.0" = s."postcss-discard-duplicates@5.1.0";
        "postcss-discard-empty@5.1.1" = f "postcss-discard-empty" "5.1.1" y "e57762343ff7f503fe53fca553d18d7f0c369c6c" [];
        "postcss-discard-empty@^5.1.1" = s."postcss-discard-empty@5.1.1";
        "postcss-discard-overridden@5.1.0" = f "postcss-discard-overridden" "5.1.0" y "7e8c5b53325747e9d90131bb88635282fb4a276e" [];
        "postcss-discard-overridden@^5.1.0" = s."postcss-discard-overridden@5.1.0";
        "postcss-discard-unused@5.1.0" = f "postcss-discard-unused" "5.1.0" y "8974e9b143d887677304e558c1166d3762501142" [
          (s."postcss-selector-parser@^6.0.5")
          ];
        "postcss-discard-unused@^5.1.0" = s."postcss-discard-unused@5.1.0";
        "postcss-double-position-gradients@3.1.1" = f "postcss-double-position-gradients" "3.1.1" y "a12cfdb7d11fa1a99ccecc747f0c19718fb37152" [
          (s."@csstools/postcss-progressive-custom-properties@^1.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-double-position-gradients@^3.1.1" = s."postcss-double-position-gradients@3.1.1";
        "postcss-env-function@4.0.6" = f "postcss-env-function" "4.0.6" y "7b2d24c812f540ed6eda4c81f6090416722a8e7a" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-env-function@^4.0.6" = s."postcss-env-function@4.0.6";
        "postcss-flexbugs-fixes@4.2.1" = f "postcss-flexbugs-fixes" "4.2.1" y "9218a65249f30897deab1033aced8578562a6690" [
          (s."postcss@^7.0.26")
          ];
        "postcss-flexbugs-fixes@5.0.2" = f "postcss-flexbugs-fixes" "5.0.2" y "2028e145313074fc9abe276cb7ca14e5401eb49d" [];
        "postcss-flexbugs-fixes@^4.2.1" = s."postcss-flexbugs-fixes@4.2.1";
        "postcss-flexbugs-fixes@^5.0.2" = s."postcss-flexbugs-fixes@5.0.2";
        "postcss-focus-visible@6.0.4" = f "postcss-focus-visible" "6.0.4" y "50c9ea9afa0ee657fb75635fabad25e18d76bf9e" [
          (s."postcss-selector-parser@^6.0.9")
          ];
        "postcss-focus-visible@^6.0.4" = s."postcss-focus-visible@6.0.4";
        "postcss-focus-within@5.0.4" = f "postcss-focus-within" "5.0.4" y "5b1d2ec603195f3344b716c0b75f61e44e8d2e20" [
          (s."postcss-selector-parser@^6.0.9")
          ];
        "postcss-focus-within@^5.0.4" = s."postcss-focus-within@5.0.4";
        "postcss-font-variant@5.0.0" = f "postcss-font-variant" "5.0.0" y "efd59b4b7ea8bb06127f2d031bfbb7f24d32fa66" [];
        "postcss-font-variant@^5.0.0" = s."postcss-font-variant@5.0.0";
        "postcss-gap-properties@3.0.3" = f "postcss-gap-properties" "3.0.3" y "6401bb2f67d9cf255d677042928a70a915e6ba60" [];
        "postcss-gap-properties@^3.0.3" = s."postcss-gap-properties@3.0.3";
        "postcss-image-set-function@4.0.6" = f "postcss-image-set-function" "4.0.6" y "bcff2794efae778c09441498f40e0c77374870a9" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-image-set-function@^4.0.6" = s."postcss-image-set-function@4.0.6";
        "postcss-import@14.1.0" = f "postcss-import" "14.1.0" y "a7333ffe32f0b8795303ee9e40215dac922781f0" [
          (s."postcss-value-parser@^4.0.0")
          (s."read-cache@^1.0.0")
          (s."resolve@^1.1.7")
          ];
        "postcss-import@^14.1.0" = s."postcss-import@14.1.0";
        "postcss-initial@4.0.1" = f "postcss-initial" "4.0.1" y "529f735f72c5724a0fb30527df6fb7ac54d7de42" [];
        "postcss-initial@^4.0.1" = s."postcss-initial@4.0.1";
        "postcss-js@4.0.0" = f "postcss-js" "4.0.0" y "31db79889531b80dc7bc9b0ad283e418dce0ac00" [
          (s."camelcase-css@^2.0.1")
          ];
        "postcss-js@^4.0.0" = s."postcss-js@4.0.0";
        "postcss-lab-function@4.2.0" = f "postcss-lab-function" "4.2.0" y "e054e662c6480202f5760887ec1ae0d153357123" [
          (s."@csstools/postcss-progressive-custom-properties@^1.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-lab-function@^4.2.0" = s."postcss-lab-function@4.2.0";
        "postcss-load-config@3.1.4" = f "postcss-load-config" "3.1.4" y "1ab2571faf84bb078877e1d07905eabe9ebda855" [
          (s."lilconfig@^2.0.5")
          (s."yaml@^1.10.2")
          ];
        "postcss-load-config@4.0.1" = f "postcss-load-config" "4.0.1" y "152383f481c2758274404e4962743191d73875bd" [
          (s."lilconfig@^2.0.5")
          (s."yaml@^2.1.1")
          ];
        "postcss-load-config@^3.1.4" = s."postcss-load-config@3.1.4";
        "postcss-load-config@^4.0.0" = s."postcss-load-config@4.0.1";
        "postcss-loader@4.3.0" = f "postcss-loader" "4.3.0" y "2c4de9657cd4f07af5ab42bd60a673004da1b8cc" [
          (s."cosmiconfig@^7.0.0")
          (s."klona@^2.0.4")
          (s."loader-utils@^2.0.0")
          (s."schema-utils@^3.0.0")
          (s."semver@^7.3.4")
          ];
        "postcss-loader@6.2.1" = f "postcss-loader" "6.2.1" y "0895f7346b1702103d30fdc66e4d494a93c008ef" [
          (s."cosmiconfig@^7.0.0")
          (s."klona@^2.0.5")
          (s."semver@^7.3.5")
          ];
        "postcss-loader@7.0.1" = f "postcss-loader" "7.0.1" y "4c883cc0a1b2bfe2074377b7a74c1cd805684395" [
          (s."cosmiconfig@^7.0.0")
          (s."klona@^2.0.5")
          (s."semver@^7.3.7")
          ];
        "postcss-loader@^4.2.0" = s."postcss-loader@4.3.0";
        "postcss-loader@^6.2.1" = s."postcss-loader@6.2.1";
        "postcss-loader@^7.0.0" = s."postcss-loader@7.0.1";
        "postcss-loader@^7.0.1" = s."postcss-loader@7.0.1";
        "postcss-logical@5.0.4" = f "postcss-logical" "5.0.4" y "ec75b1ee54421acc04d5921576b7d8db6b0e6f73" [];
        "postcss-logical@^5.0.4" = s."postcss-logical@5.0.4";
        "postcss-media-minmax@5.0.0" = f "postcss-media-minmax" "5.0.0" y "7140bddec173e2d6d657edbd8554a55794e2a5b5" [];
        "postcss-media-minmax@^5.0.0" = s."postcss-media-minmax@5.0.0";
        "postcss-merge-idents@5.1.1" = f "postcss-merge-idents" "5.1.1" y "7753817c2e0b75d0853b56f78a89771e15ca04a1" [
          (s."cssnano-utils@^3.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-merge-idents@^5.1.1" = s."postcss-merge-idents@5.1.1";
        "postcss-merge-longhand@5.1.6" = f "postcss-merge-longhand" "5.1.6" y "f378a8a7e55766b7b644f48e5d8c789ed7ed51ce" [
          (s."postcss-value-parser@^4.2.0")
          (s."stylehacks@^5.1.0")
          ];
        "postcss-merge-longhand@^5.1.6" = s."postcss-merge-longhand@5.1.6";
        "postcss-merge-rules@5.1.2" = f "postcss-merge-rules" "5.1.2" y "7049a14d4211045412116d79b751def4484473a5" [
          (s."browserslist@^4.16.6")
          (s."caniuse-api@^3.0.0")
          (s."cssnano-utils@^3.1.0")
          (s."postcss-selector-parser@^6.0.5")
          ];
        "postcss-merge-rules@^5.1.2" = s."postcss-merge-rules@5.1.2";
        "postcss-minify-font-values@5.1.0" = f "postcss-minify-font-values" "5.1.0" y "f1df0014a726083d260d3bd85d7385fb89d1f01b" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-minify-font-values@^5.1.0" = s."postcss-minify-font-values@5.1.0";
        "postcss-minify-gradients@5.1.1" = f "postcss-minify-gradients" "5.1.1" y "f1fe1b4f498134a5068240c2f25d46fcd236ba2c" [
          (s."colord@^2.9.1")
          (s."cssnano-utils@^3.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-minify-gradients@^5.1.1" = s."postcss-minify-gradients@5.1.1";
        "postcss-minify-params@5.1.3" = f "postcss-minify-params" "5.1.3" y "ac41a6465be2db735099bbd1798d85079a6dc1f9" [
          (s."browserslist@^4.16.6")
          (s."cssnano-utils@^3.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-minify-params@^5.1.3" = s."postcss-minify-params@5.1.3";
        "postcss-minify-selectors@5.2.1" = f "postcss-minify-selectors" "5.2.1" y "d4e7e6b46147b8117ea9325a915a801d5fe656c6" [
          (s."postcss-selector-parser@^6.0.5")
          ];
        "postcss-minify-selectors@^5.2.1" = s."postcss-minify-selectors@5.2.1";
        "postcss-modules-extract-imports@2.0.0" = f "postcss-modules-extract-imports" "2.0.0" y "818719a1ae1da325f9832446b01136eeb493cd7e" [
          (s."postcss@^7.0.5")
          ];
        "postcss-modules-extract-imports@3.0.0" = f "postcss-modules-extract-imports" "3.0.0" y "cda1f047c0ae80c97dbe28c3e76a43b88025741d" [];
        "postcss-modules-extract-imports@^2.0.0" = s."postcss-modules-extract-imports@2.0.0";
        "postcss-modules-extract-imports@^3.0.0" = s."postcss-modules-extract-imports@3.0.0";
        "postcss-modules-local-by-default@3.0.3" = f "postcss-modules-local-by-default" "3.0.3" y "bb14e0cc78279d504dbdcbfd7e0ca28993ffbbb0" [
          (s."icss-utils@^4.1.1")
          (s."postcss@^7.0.32")
          (s."postcss-selector-parser@^6.0.2")
          (s."postcss-value-parser@^4.1.0")
          ];
        "postcss-modules-local-by-default@4.0.0" = f "postcss-modules-local-by-default" "4.0.0" y "ebbb54fae1598eecfdf691a02b3ff3b390a5a51c" [
          (s."icss-utils@^5.0.0")
          (s."postcss-selector-parser@^6.0.2")
          (s."postcss-value-parser@^4.1.0")
          ];
        "postcss-modules-local-by-default@^3.0.2" = s."postcss-modules-local-by-default@3.0.3";
        "postcss-modules-local-by-default@^4.0.0" = s."postcss-modules-local-by-default@4.0.0";
        "postcss-modules-scope@2.2.0" = f "postcss-modules-scope" "2.2.0" y "385cae013cc7743f5a7d7602d1073a89eaae62ee" [
          (s."postcss@^7.0.6")
          (s."postcss-selector-parser@^6.0.0")
          ];
        "postcss-modules-scope@3.0.0" = f "postcss-modules-scope" "3.0.0" y "9ef3151456d3bbfa120ca44898dfca6f2fa01f06" [
          (s."postcss-selector-parser@^6.0.4")
          ];
        "postcss-modules-scope@^2.2.0" = s."postcss-modules-scope@2.2.0";
        "postcss-modules-scope@^3.0.0" = s."postcss-modules-scope@3.0.0";
        "postcss-modules-values@3.0.0" = f "postcss-modules-values" "3.0.0" y "5b5000d6ebae29b4255301b4a3a54574423e7f10" [
          (s."icss-utils@^4.0.0")
          (s."postcss@^7.0.6")
          ];
        "postcss-modules-values@4.0.0" = f "postcss-modules-values" "4.0.0" y "d7c5e7e68c3bb3c9b27cbf48ca0bb3ffb4602c9c" [
          (s."icss-utils@^5.0.0")
          ];
        "postcss-modules-values@^3.0.0" = s."postcss-modules-values@3.0.0";
        "postcss-modules-values@^4.0.0" = s."postcss-modules-values@4.0.0";
        "postcss-nested@5.0.6" = f "postcss-nested" "5.0.6" y "466343f7fc8d3d46af3e7dba3fcd47d052a945bc" [
          (s."postcss-selector-parser@^6.0.6")
          ];
        "postcss-nesting@10.1.8" = f "postcss-nesting" "10.1.8" y "1675542cfedc3dc9621993f3abfdafa260c3a460" [
          (s."@csstools/selector-specificity@^2.0.0")
          (s."postcss-selector-parser@^6.0.10")
          ];
        "postcss-nesting@^10.1.7" = s."postcss-nesting@10.1.8";
        "postcss-normalize-charset@5.1.0" = f "postcss-normalize-charset" "5.1.0" y "9302de0b29094b52c259e9b2cf8dc0879879f0ed" [];
        "postcss-normalize-charset@^5.1.0" = s."postcss-normalize-charset@5.1.0";
        "postcss-normalize-display-values@5.1.0" = f "postcss-normalize-display-values" "5.1.0" y "72abbae58081960e9edd7200fcf21ab8325c3da8" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-display-values@^5.1.0" = s."postcss-normalize-display-values@5.1.0";
        "postcss-normalize-positions@5.1.1" = f "postcss-normalize-positions" "5.1.1" y "ef97279d894087b59325b45c47f1e863daefbb92" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-positions@^5.1.1" = s."postcss-normalize-positions@5.1.1";
        "postcss-normalize-repeat-style@5.1.1" = f "postcss-normalize-repeat-style" "5.1.1" y "e9eb96805204f4766df66fd09ed2e13545420fb2" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-repeat-style@^5.1.1" = s."postcss-normalize-repeat-style@5.1.1";
        "postcss-normalize-string@5.1.0" = f "postcss-normalize-string" "5.1.0" y "411961169e07308c82c1f8c55f3e8a337757e228" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-string@^5.1.0" = s."postcss-normalize-string@5.1.0";
        "postcss-normalize-timing-functions@5.1.0" = f "postcss-normalize-timing-functions" "5.1.0" y "d5614410f8f0b2388e9f240aa6011ba6f52dafbb" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-timing-functions@^5.1.0" = s."postcss-normalize-timing-functions@5.1.0";
        "postcss-normalize-unicode@5.1.0" = f "postcss-normalize-unicode" "5.1.0" y "3d23aede35e160089a285e27bf715de11dc9db75" [
          (s."browserslist@^4.16.6")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-unicode@^5.1.0" = s."postcss-normalize-unicode@5.1.0";
        "postcss-normalize-url@5.1.0" = f "postcss-normalize-url" "5.1.0" y "ed9d88ca82e21abef99f743457d3729a042adcdc" [
          (s."normalize-url@^6.0.1")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-url@^5.1.0" = s."postcss-normalize-url@5.1.0";
        "postcss-normalize-whitespace@5.1.1" = f "postcss-normalize-whitespace" "5.1.1" y "08a1a0d1ffa17a7cc6efe1e6c9da969cc4493cfa" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-normalize-whitespace@^5.1.1" = s."postcss-normalize-whitespace@5.1.1";
        "postcss-normalize@10.0.1" = f "postcss-normalize" "10.0.1" y "464692676b52792a06b06880a176279216540dd7" [
          (s."@csstools/normalize.css@*")
          (s."postcss-browser-comments@^4")
          (s."sanitize.css@*")
          ];
        "postcss-normalize@^10.0.1" = s."postcss-normalize@10.0.1";
        "postcss-opacity-percentage@1.1.2" = f "postcss-opacity-percentage" "1.1.2" y "bd698bb3670a0a27f6d657cc16744b3ebf3b1145" [];
        "postcss-opacity-percentage@^1.1.2" = s."postcss-opacity-percentage@1.1.2";
        "postcss-ordered-values@5.1.3" = f "postcss-ordered-values" "5.1.3" y "b6fd2bd10f937b23d86bc829c69e7732ce76ea38" [
          (s."cssnano-utils@^3.1.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-ordered-values@^5.1.3" = s."postcss-ordered-values@5.1.3";
        "postcss-overflow-shorthand@3.0.3" = f "postcss-overflow-shorthand" "3.0.3" y "ebcfc0483a15bbf1b27fdd9b3c10125372f4cbc2" [];
        "postcss-overflow-shorthand@^3.0.3" = s."postcss-overflow-shorthand@3.0.3";
        "postcss-page-break@3.0.4" = f "postcss-page-break" "3.0.4" y "7fbf741c233621622b68d435babfb70dd8c1ee5f" [];
        "postcss-page-break@^3.0.4" = s."postcss-page-break@3.0.4";
        "postcss-place@7.0.4" = f "postcss-place" "7.0.4" y "eb026650b7f769ae57ca4f938c1addd6be2f62c9" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-place@^7.0.4" = s."postcss-place@7.0.4";
        "postcss-preset-env@7.7.1" = f "postcss-preset-env" "7.7.1" y "ca416c15fd63fd44abe5dcd2890a34b0a664d2c8" [
          (s."@csstools/postcss-cascade-layers@^1.0.2")
          (s."@csstools/postcss-color-function@^1.1.0")
          (s."@csstools/postcss-font-format-keywords@^1.0.0")
          (s."@csstools/postcss-hwb-function@^1.0.1")
          (s."@csstools/postcss-ic-unit@^1.0.0")
          (s."@csstools/postcss-is-pseudo-class@^2.0.4")
          (s."@csstools/postcss-normalize-display-values@^1.0.0")
          (s."@csstools/postcss-oklab-function@^1.1.0")
          (s."@csstools/postcss-progressive-custom-properties@^1.3.0")
          (s."@csstools/postcss-stepped-value-functions@^1.0.0")
          (s."@csstools/postcss-trigonometric-functions@^1.0.1")
          (s."@csstools/postcss-unset-value@^1.0.1")
          (s."autoprefixer@^10.4.7")
          (s."browserslist@^4.20.3")
          (s."css-blank-pseudo@^3.0.3")
          (s."css-has-pseudo@^3.0.4")
          (s."css-prefers-color-scheme@^6.0.3")
          (s."cssdb@^6.6.3")
          (s."postcss-attribute-case-insensitive@^5.0.1")
          (s."postcss-clamp@^4.1.0")
          (s."postcss-color-functional-notation@^4.2.3")
          (s."postcss-color-hex-alpha@^8.0.3")
          (s."postcss-color-rebeccapurple@^7.0.2")
          (s."postcss-custom-media@^8.0.1")
          (s."postcss-custom-properties@^12.1.7")
          (s."postcss-custom-selectors@^6.0.2")
          (s."postcss-dir-pseudo-class@^6.0.4")
          (s."postcss-double-position-gradients@^3.1.1")
          (s."postcss-env-function@^4.0.6")
          (s."postcss-focus-visible@^6.0.4")
          (s."postcss-focus-within@^5.0.4")
          (s."postcss-font-variant@^5.0.0")
          (s."postcss-gap-properties@^3.0.3")
          (s."postcss-image-set-function@^4.0.6")
          (s."postcss-initial@^4.0.1")
          (s."postcss-lab-function@^4.2.0")
          (s."postcss-logical@^5.0.4")
          (s."postcss-media-minmax@^5.0.0")
          (s."postcss-nesting@^10.1.7")
          (s."postcss-opacity-percentage@^1.1.2")
          (s."postcss-overflow-shorthand@^3.0.3")
          (s."postcss-page-break@^3.0.4")
          (s."postcss-place@^7.0.4")
          (s."postcss-pseudo-class-any-link@^7.1.4")
          (s."postcss-replace-overflow-wrap@^4.0.0")
          (s."postcss-selector-not@^6.0.0")
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-preset-env@^7.0.1" = s."postcss-preset-env@7.7.1";
        "postcss-pseudo-class-any-link@7.1.4" = f "postcss-pseudo-class-any-link" "7.1.4" y "ac72aac4fe11fc4a0a368691f8fd5fe89e95aba4" [
          (s."postcss-selector-parser@^6.0.10")
          ];
        "postcss-pseudo-class-any-link@^7.1.4" = s."postcss-pseudo-class-any-link@7.1.4";
        "postcss-reduce-idents@5.2.0" = f "postcss-reduce-idents" "5.2.0" y "c89c11336c432ac4b28792f24778859a67dfba95" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-reduce-idents@^5.2.0" = s."postcss-reduce-idents@5.2.0";
        "postcss-reduce-initial@5.1.0" = f "postcss-reduce-initial" "5.1.0" y "fc31659ea6e85c492fb2a7b545370c215822c5d6" [
          (s."browserslist@^4.16.6")
          (s."caniuse-api@^3.0.0")
          ];
        "postcss-reduce-initial@^5.1.0" = s."postcss-reduce-initial@5.1.0";
        "postcss-reduce-transforms@5.1.0" = f "postcss-reduce-transforms" "5.1.0" y "333b70e7758b802f3dd0ddfe98bb1ccfef96b6e9" [
          (s."postcss-value-parser@^4.2.0")
          ];
        "postcss-reduce-transforms@^5.1.0" = s."postcss-reduce-transforms@5.1.0";
        "postcss-replace-overflow-wrap@4.0.0" = f "postcss-replace-overflow-wrap" "4.0.0" y "d2df6bed10b477bf9c52fab28c568b4b29ca4319" [];
        "postcss-replace-overflow-wrap@^4.0.0" = s."postcss-replace-overflow-wrap@4.0.0";
        "postcss-reporter@7.0.5" = f "postcss-reporter" "7.0.5" y "e55bd0fdf8d17e4f25fb55e9143fcd79349a2ceb" [
          (s."picocolors@^1.0.0")
          (s."thenby@^1.3.4")
          ];
        "postcss-reporter@^7.0.0" = s."postcss-reporter@7.0.5";
        "postcss-selector-not@6.0.0" = f "postcss-selector-not" "6.0.0" y "d100f273d345917246762300411b4d2e24905047" [
          (s."postcss-selector-parser@^6.0.10")
          ];
        "postcss-selector-not@^6.0.0" = s."postcss-selector-not@6.0.0";
        "postcss-selector-parser@6.0.10" = f "postcss-selector-parser" "6.0.10" y "79b61e2c0d1bfc2602d549e11d0876256f8df88d" [
          (s."cssesc@^3.0.0")
          (s."util-deprecate@^1.0.2")
          ];
        "postcss-selector-parser@^6.0.0" = s."postcss-selector-parser@6.0.10";
        "postcss-selector-parser@^6.0.10" = s."postcss-selector-parser@6.0.10";
        "postcss-selector-parser@^6.0.2" = s."postcss-selector-parser@6.0.10";
        "postcss-selector-parser@^6.0.4" = s."postcss-selector-parser@6.0.10";
        "postcss-selector-parser@^6.0.5" = s."postcss-selector-parser@6.0.10";
        "postcss-selector-parser@^6.0.6" = s."postcss-selector-parser@6.0.10";
        "postcss-selector-parser@^6.0.9" = s."postcss-selector-parser@6.0.10";
        "postcss-sort-media-queries@4.2.1" = f "postcss-sort-media-queries" "4.2.1" y "a99bae69ef1098ee3b64a5fa94d258ec240d0355" [
          (s."sort-css-media-queries@2.0.4")
          ];
        "postcss-sort-media-queries@^4.2.1" = s."postcss-sort-media-queries@4.2.1";
        "postcss-svgo@5.1.0" = f "postcss-svgo" "5.1.0" y "0a317400ced789f233a28826e77523f15857d80d" [
          (s."postcss-value-parser@^4.2.0")
          (s."svgo@^2.7.0")
          ];
        "postcss-svgo@^5.1.0" = s."postcss-svgo@5.1.0";
        "postcss-unique-selectors@5.1.1" = f "postcss-unique-selectors" "5.1.1" y "a9f273d1eacd09e9aa6088f4b0507b18b1b541b6" [
          (s."postcss-selector-parser@^6.0.5")
          ];
        "postcss-unique-selectors@^5.1.1" = s."postcss-unique-selectors@5.1.1";
        "postcss-value-parser@4.2.0" = f "postcss-value-parser" "4.2.0" y "723c09920836ba6d3e5af019f92bc0971c02e514" [];
        "postcss-value-parser@^4.0.0" = s."postcss-value-parser@4.2.0";
        "postcss-value-parser@^4.1.0" = s."postcss-value-parser@4.2.0";
        "postcss-value-parser@^4.2.0" = s."postcss-value-parser@4.2.0";
        "postcss-zindex@5.1.0" = f "postcss-zindex" "5.1.0" y "4a5c7e5ff1050bd4c01d95b1847dfdcc58a496ff" [];
        "postcss-zindex@^5.1.0" = s."postcss-zindex@5.1.0";
        "postcss@7.0.39" = f "postcss" "7.0.39" y "9624375d965630e2e1f2c02a935c82a59cb48309" [
          (s."picocolors@^0.2.1")
          (s."source-map@^0.6.1")
          ];
        "postcss@8.4.14" = f "postcss" "8.4.14" y "ee9274d5622b4858c1007a74d76e42e56fd21caf" [
          (s."nanoid@^3.3.4")
          (s."picocolors@^1.0.0")
          (s."source-map-js@^1.0.2")
          ];
        "postcss@^7.0.14" = s."postcss@7.0.39";
        "postcss@^7.0.26" = s."postcss@7.0.39";
        "postcss@^7.0.32" = s."postcss@7.0.39";
        "postcss@^7.0.35" = s."postcss@7.0.39";
        "postcss@^7.0.36" = s."postcss@7.0.39";
        "postcss@^7.0.5" = s."postcss@7.0.39";
        "postcss@^7.0.6" = s."postcss@7.0.39";
        "postcss@^8.2.15" = s."postcss@8.4.14";
        "postcss@^8.3.11" = s."postcss@8.4.14";
        "postcss@^8.3.5" = s."postcss@8.4.14";
        "postcss@^8.4.13" = s."postcss@8.4.14";
        "postcss@^8.4.14" = s."postcss@8.4.14";
        "postcss@^8.4.4" = s."postcss@8.4.14";
        "postcss@^8.4.7" = s."postcss@8.4.14";
        "prelude-ls@1.1.2" = f "prelude-ls" "1.1.2" y "21932a549f5e52ffd9a827f570e04be62a97da54" [];
        "prelude-ls@1.2.1" = f "prelude-ls" "1.2.1" y "debc6489d7a6e6b0e7611888cec880337d316396" [];
        "prelude-ls@^1.2.1" = s."prelude-ls@1.2.1";
        "prelude-ls@~1.1.2" = s."prelude-ls@1.1.2";
        "prepend-http@2.0.0" = f "prepend-http" "2.0.0" y "e92434bfa5ea8c19f41cdfd401d741a3c819d897" [];
        "prepend-http@^2.0.0" = s."prepend-http@2.0.0";
        "prettier@2.3.0" = f "prettier" "2.3.0" y "b6a5bf1284026ae640f17f7ff5658a7567fc0d18" [];
        "prettier@2.7.1" = f "prettier" "2.7.1" y "e235806850d057f97bb08368a4f7d899f7760c64" [];
        "prettier@>=2.2.1 <=2.3.0" = s."prettier@2.3.0";
        "prettier@^2.7.1" = s."prettier@2.7.1";
        "pretty-bytes@5.6.0" = f "pretty-bytes" "5.6.0" y "356256f643804773c82f64723fe78c92c62beaeb" [];
        "pretty-bytes@^5.3.0" = s."pretty-bytes@5.6.0";
        "pretty-bytes@^5.4.1" = s."pretty-bytes@5.6.0";
        "pretty-error@2.1.2" = f "pretty-error" "2.1.2" y "be89f82d81b1c86ec8fdfbc385045882727f93b6" [
          (s."lodash@^4.17.20")
          (s."renderkid@^2.0.4")
          ];
        "pretty-error@4.0.0" = f "pretty-error" "4.0.0" y "90a703f46dd7234adb46d0f84823e9d1cb8f10d6" [
          (s."lodash@^4.17.20")
          (s."renderkid@^3.0.0")
          ];
        "pretty-error@^2.1.1" = s."pretty-error@2.1.2";
        "pretty-error@^4.0.0" = s."pretty-error@4.0.0";
        "pretty-format@27.5.1" = f "pretty-format" "27.5.1" y "2181879fdea51a7a5851fb39d920faa63f01d88e" [
          (s."ansi-regex@^5.0.1")
          (s."ansi-styles@^5.0.0")
          (s."react-is@^17.0.1")
          ];
        "pretty-format@28.1.1" = f "pretty-format" "28.1.1" y "f731530394e0f7fcd95aba6b43c50e02d86b95cb" [
          (s."@jest/schemas@^28.0.2")
          (s."ansi-regex@^5.0.1")
          (s."ansi-styles@^5.0.0")
          (s."react-is@^18.0.0")
          ];
        "pretty-format@^27.0.0" = s."pretty-format@27.5.1";
        "pretty-format@^27.0.2" = s."pretty-format@27.5.1";
        "pretty-format@^27.5.1" = s."pretty-format@27.5.1";
        "pretty-format@^28.0.0" = s."pretty-format@28.1.1";
        "pretty-format@^28.1.1" = s."pretty-format@28.1.1";
        "pretty-hrtime@1.0.3" = f "pretty-hrtime" "1.0.3" y "b7e3ea42435a4c9b2759d99e0f201eb195802ee1" [];
        "pretty-hrtime@^1.0.3" = s."pretty-hrtime@1.0.3";
        "pretty-time@1.1.0" = f "pretty-time" "1.1.0" y "ffb7429afabb8535c346a34e41873adf3d74dd0e" [];
        "pretty-time@^1.1.0" = s."pretty-time@1.1.0";
        "prism-react-renderer@1.3.5" = f "prism-react-renderer" "1.3.5" y "786bb69aa6f73c32ba1ee813fbe17a0115435085" [];
        "prism-react-renderer@^1.3.5" = s."prism-react-renderer@1.3.5";
        "prismjs@1.27.0" = f "prismjs" "1.27.0" y "bb6ee3138a0b438a3653dd4d6ce0cc6510a45057" [];
        "prismjs@1.28.0" = f "prismjs" "1.28.0" y "0d8f561fa0f7cf6ebca901747828b149147044b6" [];
        "prismjs@^1.27.0" = s."prismjs@1.28.0";
        "prismjs@^1.28.0" = s."prismjs@1.28.0";
        "prismjs@~1.27.0" = s."prismjs@1.27.0";
        "process-nextick-args@2.0.1" = f "process-nextick-args" "2.0.1" y "7820d9b16120cc55ca9ae7792680ae7dba6d7fe2" [];
        "process-nextick-args@~2.0.0" = s."process-nextick-args@2.0.1";
        "process-on-spawn@1.0.0" = f "process-on-spawn" "1.0.0" y "95b05a23073d30a17acfdc92a440efd2baefdc93" [
          (s."fromentries@^1.2.0")
          ];
        "process-on-spawn@^1.0.0" = s."process-on-spawn@1.0.0";
        "process@0.11.10" = f "process" "0.11.10" y "7332300e840161bda3e69a1d1d91a7d4bc16f182" [];
        "process@^0.11.10" = s."process@0.11.10";
        "promise-inflight@1.0.1" = f "promise-inflight" "1.0.1" y "98472870bf228132fcbdd868129bad12c3c029e3" [];
        "promise-inflight@^1.0.1" = s."promise-inflight@1.0.1";
        "promise.allsettled@1.0.5" = f "promise.allsettled" "1.0.5" y "2443f3d4b2aa8dfa560f6ac2aa6c4ea999d75f53" [
          (s."array.prototype.map@^1.0.4")
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          (s."get-intrinsic@^1.1.1")
          (s."iterate-value@^1.0.2")
          ];
        "promise.allsettled@^1.0.0" = s."promise.allsettled@1.0.5";
        "promise.prototype.finally@3.1.3" = f "promise.prototype.finally" "3.1.3" y "d3186e58fcf4df1682a150f934ccc27b7893389c" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          ];
        "promise.prototype.finally@^3.1.0" = s."promise.prototype.finally@3.1.3";
        "promise@7.3.1" = f "promise" "7.3.1" y "064b72602b18f90f29192b8b1bc418ffd1ebd3bf" [
          (s."asap@~2.0.3")
          ];
        "promise@8.1.0" = f "promise" "8.1.0" y "697c25c3dfe7435dd79fcd58c38a135888eaf05e" [
          (s."asap@~2.0.6")
          ];
        "promise@^7.1.1" = s."promise@7.3.1";
        "promise@^8.1.0" = s."promise@8.1.0";
        "prompts@2.4.2" = f "prompts" "2.4.2" y "7b57e73b3a48029ad10ebd44f74b01722a4cb069" [
          (s."kleur@^3.0.3")
          (s."sisteransi@^1.0.5")
          ];
        "prompts@^2.0.1" = s."prompts@2.4.2";
        "prompts@^2.4.0" = s."prompts@2.4.2";
        "prompts@^2.4.2" = s."prompts@2.4.2";
        "prop-types@15.8.1" = f "prop-types" "15.8.1" y "67d87bf1a694f48435cf332c24af10214a3140b5" [
          (s."loose-envify@^1.4.0")
          (s."object-assign@^4.1.1")
          (s."react-is@^16.13.1")
          ];
        "prop-types@^15.0.0" = s."prop-types@15.8.1";
        "prop-types@^15.6.2" = s."prop-types@15.8.1";
        "prop-types@^15.7.2" = s."prop-types@15.8.1";
        "prop-types@^15.8.1" = s."prop-types@15.8.1";
        "property-expr@2.0.5" = f "property-expr" "2.0.5" y "278bdb15308ae16af3e3b9640024524f4dc02cb4" [];
        "property-expr@^2.0.4" = s."property-expr@2.0.5";
        "property-information@5.6.0" = f "property-information" "5.6.0" y "61675545fb23002f245c6540ec46077d4da3ed69" [
          (s."xtend@^4.0.0")
          ];
        "property-information@^5.0.0" = s."property-information@5.6.0";
        "property-information@^5.3.0" = s."property-information@5.6.0";
        "proxy-addr@2.0.7" = f "proxy-addr" "2.0.7" y "f19fe69ceab311eeb94b42e70e8c2070f9ba1025" [
          (s."forwarded@0.2.0")
          (s."ipaddr.js@1.9.1")
          ];
        "proxy-addr@~2.0.7" = s."proxy-addr@2.0.7";
        "prr@1.0.1" = f "prr" "1.0.1" y "d3fc114ba06995a45ec6893f484ceb1d78f5f476" [];
        "prr@~1.0.1" = s."prr@1.0.1";
        "psl@1.8.0" = f "psl" "1.8.0" y "9326f8bcfb013adcc005fdff056acce020e51c24" [];
        "psl@^1.1.33" = s."psl@1.8.0";
        "public-encrypt@4.0.3" = f "public-encrypt" "4.0.3" y "4fcc9d77a07e48ba7527e7cbe0de33d0701331e0" [
          (s."bn.js@^4.1.0")
          (s."browserify-rsa@^4.0.0")
          (s."create-hash@^1.1.0")
          (s."parse-asn1@^5.0.0")
          (s."randombytes@^2.0.1")
          (s."safe-buffer@^5.1.2")
          ];
        "public-encrypt@^4.0.0" = s."public-encrypt@4.0.3";
        "pump@2.0.1" = f "pump" "2.0.1" y "12399add6e4cf7526d973cbc8b5ce2e2908b3909" [
          (s."end-of-stream@^1.1.0")
          (s."once@^1.3.1")
          ];
        "pump@3.0.0" = f "pump" "3.0.0" y "b4a2116815bde2f4e1ea602354e8c75565107a64" [
          (s."end-of-stream@^1.1.0")
          (s."once@^1.3.1")
          ];
        "pump@^2.0.0" = s."pump@2.0.1";
        "pump@^3.0.0" = s."pump@3.0.0";
        "pumpify@1.5.1" = f "pumpify" "1.5.1" y "36513be246ab27570b1a374a5ce278bfd74370ce" [
          (s."duplexify@^3.6.0")
          (s."inherits@^2.0.3")
          (s."pump@^2.0.0")
          ];
        "pumpify@^1.3.3" = s."pumpify@1.5.1";
        "punycode@1.3.2" = f "punycode" "1.3.2" y "9653a036fb7c1ee42342f2325cceefea3926c48d" [];
        "punycode@1.4.1" = f "punycode" "1.4.1" y "c0d5a63b2718800ad8e1eb0fa5269c84dd41845e" [];
        "punycode@2.1.1" = f "punycode" "2.1.1" y "b58b010ac40c22c5657616c8d2c2c02c7bf479ec" [];
        "punycode@^1.2.4" = s."punycode@1.4.1";
        "punycode@^1.3.2" = s."punycode@1.4.1";
        "punycode@^2.1.0" = s."punycode@2.1.1";
        "punycode@^2.1.1" = s."punycode@2.1.1";
        "pupa@2.1.1" = f "pupa" "2.1.1" y "f5e8fd4afc2c5d97828faa523549ed8744a20d62" [
          (s."escape-goat@^2.0.0")
          ];
        "pupa@^2.1.1" = s."pupa@2.1.1";
        "pure-color@1.3.0" = f "pure-color" "1.3.0" y "1fe064fb0ac851f0de61320a8bf796836422f33e" [];
        "pure-color@^1.2.0" = s."pure-color@1.3.0";
        "pure-rand@5.0.1" = f "pure-rand" "5.0.1" y "97a287b4b4960b2a3448c0932bf28f2405cac51d" [];
        "pure-rand@^5.0.1" = s."pure-rand@5.0.1";
        "q@1.5.1" = f "q" "1.5.1" y "7e32f75b41381291d04611f1bf14109ac00651d7" [];
        "q@^1.1.2" = s."q@1.5.1";
        "qs@6.10.3" = f "qs" "6.10.3" y "d6cde1b2ffca87b5aa57889816c5f81535e22e8e" [
          (s."side-channel@^1.0.4")
          ];
        "qs@6.10.5" = f "qs" "6.10.5" y "974715920a80ff6a262264acd2c7e6c2a53282b4" [
          (s."side-channel@^1.0.4")
          ];
        "qs@^6.10.0" = s."qs@6.10.5";
        "querystring-es3@0.2.1" = f "querystring-es3" "0.2.1" y "9ec61f79049875707d69414596fd907a4d711e73" [];
        "querystring-es3@^0.2.0" = s."querystring-es3@0.2.1";
        "querystring@0.2.0" = f "querystring" "0.2.0" y "b209849203bb25df820da756e747005878521620" [];
        "querystring@0.2.1" = f "querystring" "0.2.1" y "40d77615bb09d16902a85c3e38aa8b5ed761c2dd" [];
        "querystring@^0.2.0" = s."querystring@0.2.1";
        "queue-microtask@1.2.3" = f "queue-microtask" "1.2.3" y "4929228bbc724dfac43e0efb058caf7b6cfb6243" [];
        "queue-microtask@^1.2.2" = s."queue-microtask@1.2.3";
        "queue@6.0.2" = f "queue" "6.0.2" y "b91525283e2315c7553d2efa18d83e76432fed65" [
          (s."inherits@~2.0.3")
          ];
        "quick-lru@5.1.1" = f "quick-lru" "5.1.1" y "366493e6b3e42a3a6885e2e99d18f80fb7a8c932" [];
        "quick-lru@^5.1.1" = s."quick-lru@5.1.1";
        "raf-schd@4.0.3" = f "raf-schd" "4.0.3" y "5d6c34ef46f8b2a0e880a8fcdb743efc5bfdbc1a" [];
        "raf-schd@^4.0.2" = s."raf-schd@4.0.3";
        "raf@3.4.1" = f "raf" "3.4.1" y "0742e99a4a6552f445d73e3ee0328af0ff1ede39" [
          (s."performance-now@^2.1.0")
          ];
        "raf@^3.4.1" = s."raf@3.4.1";
        "ramda@0.28.0" = f "ramda" "0.28.0" y "acd785690100337e8b063cab3470019be427cc97" [];
        "ramda@^0.28.0" = s."ramda@0.28.0";
        "randombytes@2.1.0" = f "randombytes" "2.1.0" y "df6f84372f0270dc65cdf6291349ab7a473d4f2a" [
          (s."safe-buffer@^5.1.0")
          ];
        "randombytes@^2.0.0" = s."randombytes@2.1.0";
        "randombytes@^2.0.1" = s."randombytes@2.1.0";
        "randombytes@^2.0.5" = s."randombytes@2.1.0";
        "randombytes@^2.1.0" = s."randombytes@2.1.0";
        "randomfill@1.0.4" = f "randomfill" "1.0.4" y "c92196fc86ab42be983f1bf31778224931d61458" [
          (s."randombytes@^2.0.5")
          (s."safe-buffer@^5.1.0")
          ];
        "randomfill@^1.0.3" = s."randomfill@1.0.4";
        "range-parser@1.2.0" = f "range-parser" "1.2.0" y "f49be6b487894ddc40dcc94a322f611092e00d5e" [];
        "range-parser@1.2.1" = f "range-parser" "1.2.1" y "3cf37023d199e1c24d1a55b84800c2f3e6468031" [];
        "range-parser@^1.2.1" = s."range-parser@1.2.1";
        "range-parser@~1.2.1" = s."range-parser@1.2.1";
        "raw-body@2.5.1" = f "raw-body" "2.5.1" y "fe1b1628b181b700215e5fd42389f98b71392857" [
          (s."bytes@3.1.2")
          (s."http-errors@2.0.0")
          (s."iconv-lite@0.4.24")
          (s."unpipe@1.0.0")
          ];
        "raw-loader@4.0.2" = f "raw-loader" "4.0.2" y "1aac6b7d1ad1501e66efdac1522c73e59a584eb6" [
          (s."loader-utils@^2.0.0")
          (s."schema-utils@^3.0.0")
          ];
        "raw-loader@^4.0.2" = s."raw-loader@4.0.2";
        "rc@1.2.8" = f "rc" "1.2.8" y "cd924bf5200a075b83c188cd6b9e211b7fc0d3ed" [
          (s."deep-extend@^0.6.0")
          (s."ini@~1.3.0")
          (s."minimist@^1.2.0")
          (s."strip-json-comments@~2.0.1")
          ];
        "rc@^1.2.8" = s."rc@1.2.8";
        "react-ace@10.1.0" = f "react-ace" "10.1.0" y "d348eac2b16475231779070b6cd16768deed565f" [
          (s."ace-builds@^1.4.14")
          (s."diff-match-patch@^1.0.5")
          (s."lodash.get@^4.4.2")
          (s."lodash.isequal@^4.5.0")
          (s."prop-types@^15.7.2")
          ];
        "react-ace@^10.1.0" = s."react-ace@10.1.0";
        "react-app-polyfill@3.0.0" = f "react-app-polyfill" "3.0.0" y "95221e0a9bd259e5ca6b177c7bb1cb6768f68fd7" [
          (s."core-js@^3.19.2")
          (s."object-assign@^4.1.1")
          (s."promise@^8.1.0")
          (s."raf@^3.4.1")
          (s."regenerator-runtime@^0.13.9")
          (s."whatwg-fetch@^3.6.2")
          ];
        "react-app-polyfill@^3.0.0" = s."react-app-polyfill@3.0.0";
        "react-base16-styling@0.6.0" = f "react-base16-styling" "0.6.0" y "ef2156d66cf4139695c8a167886cb69ea660792c" [
          (s."base16@^1.0.0")
          (s."lodash.curry@^4.0.1")
          (s."lodash.flow@^3.3.0")
          (s."pure-color@^1.2.0")
          ];
        "react-base16-styling@^0.6.0" = s."react-base16-styling@0.6.0";
        "react-dev-utils@12.0.1" = f "react-dev-utils" "12.0.1" y "ba92edb4a1f379bd46ccd6bcd4e7bc398df33e73" [
          (s."@babel/code-frame@^7.16.0")
          (s."address@^1.1.2")
          (s."browserslist@^4.18.1")
          (s."chalk@^4.1.2")
          (s."cross-spawn@^7.0.3")
          (s."detect-port-alt@^1.1.6")
          (s."escape-string-regexp@^4.0.0")
          (s."filesize@^8.0.6")
          (s."find-up@^5.0.0")
          (s."fork-ts-checker-webpack-plugin@^6.5.0")
          (s."global-modules@^2.0.0")
          (s."globby@^11.0.4")
          (s."gzip-size@^6.0.0")
          (s."immer@^9.0.7")
          (s."is-root@^2.1.0")
          (s."loader-utils@^3.2.0")
          (s."open@^8.4.0")
          (s."pkg-up@^3.1.0")
          (s."prompts@^2.4.2")
          (s."react-error-overlay@^6.0.11")
          (s."recursive-readdir@^2.2.2")
          (s."shell-quote@^1.7.3")
          (s."strip-ansi@^6.0.1")
          (s."text-table@^0.2.0")
          ];
        "react-dev-utils@^12.0.1" = s."react-dev-utils@12.0.1";
        "react-docgen-typescript@2.2.2" = f "react-docgen-typescript" "2.2.2" y "4611055e569edc071204aadb20e1c93e1ab1659c" [];
        "react-docgen-typescript@^2.1.1" = s."react-docgen-typescript@2.2.2";
        "react-docgen@5.4.2" = f "react-docgen" "5.4.2" y "697ec899e8dd493bb7ba0d50ec0aa5e49f41d3fa" [
          (s."@babel/core@^7.7.5")
          (s."@babel/generator@^7.12.11")
          (s."@babel/runtime@^7.7.6")
          (s."ast-types@^0.14.2")
          (s."commander@^2.19.0")
          (s."doctrine@^3.0.0")
          (s."estree-to-babel@^3.1.0")
          (s."neo-async@^2.6.1")
          (s."node-dir@^0.1.10")
          (s."strip-indent@^3.0.0")
          ];
        "react-docgen@^5.0.0" = s."react-docgen@5.4.2";
        "react-dom@18.2.0" = f "react-dom" "18.2.0" y "22aaf38708db2674ed9ada224ca4aa708d821e3d" [
          (s."loose-envify@^1.1.0")
          (s."scheduler@^0.23.0")
          ];
        "react-dom@^18.2.0" = s."react-dom@18.2.0";
        "react-element-to-jsx-string@14.3.4" = f "react-element-to-jsx-string" "14.3.4" y "709125bc72f06800b68f9f4db485f2c7d31218a8" [
          (s."@base2/pretty-print-object@1.0.1")
          (s."is-plain-object@5.0.0")
          (s."react-is@17.0.2")
          ];
        "react-element-to-jsx-string@^14.3.4" = s."react-element-to-jsx-string@14.3.4";
        "react-error-overlay@6.0.11" = f "react-error-overlay" "6.0.11" y "92835de5841c5cf08ba00ddd2d677b6d17ff9adb" [];
        "react-error-overlay@^6.0.11" = s."react-error-overlay@6.0.11";
        "react-fast-compare@3.2.0" = f "react-fast-compare" "3.2.0" y "641a9da81b6a6320f270e89724fb45a0b39e43bb" [];
        "react-fast-compare@^3.2.0" = s."react-fast-compare@3.2.0";
        "react-helmet-async@*" = s."react-helmet-async@1.3.0";
        "react-helmet-async@1.3.0" = f "react-helmet-async" "1.3.0" y "7bd5bf8c5c69ea9f02f6083f14ce33ef545c222e" [
          (s."@babel/runtime@^7.12.5")
          (s."invariant@^2.2.4")
          (s."prop-types@^15.7.2")
          (s."react-fast-compare@^3.2.0")
          (s."shallowequal@^1.1.0")
          ];
        "react-helmet-async@^1.3.0" = s."react-helmet-async@1.3.0";
        "react-hook-form@7.34.0" = f "react-hook-form" "7.34.0" y "22883b5e014e5c5e35f3061d0e3862153b0df2ec" [];
        "react-hook-form@^7.34.0" = s."react-hook-form@7.34.0";
        "react-inspector@5.1.1" = f "react-inspector" "5.1.1" y "58476c78fde05d5055646ed8ec02030af42953c8" [
          (s."@babel/runtime@^7.0.0")
          (s."is-dom@^1.0.0")
          (s."prop-types@^15.0.0")
          ];
        "react-inspector@^5.1.0" = s."react-inspector@5.1.1";
        "react-is@16.13.1" = f "react-is" "16.13.1" y "789729a4dc36de2999dc156dd6c1d9c18cea56a4" [];
        "react-is@17.0.2" = f "react-is" "17.0.2" y "e691d4a8e9c789365655539ab372762b0efb54f0" [];
        "react-is@18.2.0" = f "react-is" "18.2.0" y "199431eeaaa2e09f86427efbb4f1473edb47609b" [];
        "react-is@^16.13.1" = s."react-is@16.13.1";
        "react-is@^16.6.0" = s."react-is@16.13.1";
        "react-is@^16.7.0" = s."react-is@16.13.1";
        "react-is@^17.0.1" = s."react-is@17.0.2";
        "react-is@^18.0.0" = s."react-is@18.2.0";
        "react-json-view@1.21.3" = f "react-json-view" "1.21.3" y "f184209ee8f1bf374fb0c41b0813cff54549c475" [
          (s."flux@^4.0.1")
          (s."react-base16-styling@^0.6.0")
          (s."react-lifecycles-compat@^3.0.4")
          (s."react-textarea-autosize@^8.3.2")
          ];
        "react-json-view@^1.21.3" = s."react-json-view@1.21.3";
        "react-lifecycles-compat@3.0.4" = f "react-lifecycles-compat" "3.0.4" y "4f1a273afdfc8f3488a8c516bfda78f872352362" [];
        "react-lifecycles-compat@^3.0.4" = s."react-lifecycles-compat@3.0.4";
        "react-loadable-ssr-addon-v5-slorber@1.0.1" = f "react-loadable-ssr-addon-v5-slorber" "1.0.1" y "2cdc91e8a744ffdf9e3556caabeb6e4278689883" [
          (s."@babel/runtime@^7.10.3")
          ];
        "react-loadable-ssr-addon-v5-slorber@^1.0.1" = s."react-loadable-ssr-addon-v5-slorber@1.0.1";
        "react-loadable@npm:@docusaurus/react-loadable@5.5.2" = s."@docusaurus/react-loadable@5.5.2";
        "react-refresh@0.11.0" = f "react-refresh" "0.11.0" y "77198b944733f0f1f1a90e791de4541f9f074046" [];
        "react-refresh@^0.11.0" = s."react-refresh@0.11.0";
        "react-router-config@5.1.1" = f "react-router-config" "5.1.1" y "0f4263d1a80c6b2dc7b9c1902c9526478194a988" [
          (s."@babel/runtime@^7.1.2")
          ];
        "react-router-config@^5.1.1" = s."react-router-config@5.1.1";
        "react-router-dom@5.3.3" = f "react-router-dom" "5.3.3" y "8779fc28e6691d07afcaf98406d3812fe6f11199" [
          (s."@babel/runtime@^7.12.13")
          (s."history@^4.9.0")
          (s."loose-envify@^1.3.1")
          (s."prop-types@^15.6.2")
          (s."react-router@5.3.3")
          (s."tiny-invariant@^1.0.2")
          (s."tiny-warning@^1.0.0")
          ];
        "react-router-dom@^5.3.3" = s."react-router-dom@5.3.3";
        "react-router@5.3.3" = f "react-router" "5.3.3" y "8e3841f4089e728cf82a429d92cdcaa5e4a3a288" [
          (s."@babel/runtime@^7.12.13")
          (s."history@^4.9.0")
          (s."hoist-non-react-statics@^3.1.0")
          (s."loose-envify@^1.3.1")
          (s."mini-create-react-context@^0.4.0")
          (s."path-to-regexp@^1.7.0")
          (s."prop-types@^15.6.2")
          (s."react-is@^16.6.0")
          (s."tiny-invariant@^1.0.2")
          (s."tiny-warning@^1.0.0")
          ];
        "react-router@^5.3.3" = s."react-router@5.3.3";
        "react-scripts@5.0.1" = f "react-scripts" "5.0.1" y "6285dbd65a8ba6e49ca8d651ce30645a6d980003" [
          (s."@babel/core@^7.16.0")
          (s."@pmmmwh/react-refresh-webpack-plugin@^0.5.3")
          (s."@svgr/webpack@^5.5.0")
          (s."babel-jest@^27.4.2")
          (s."babel-loader@^8.2.3")
          (s."babel-plugin-named-asset-import@^0.3.8")
          (s."babel-preset-react-app@^10.0.1")
          (s."bfj@^7.0.2")
          (s."browserslist@^4.18.1")
          (s."camelcase@^6.2.1")
          (s."case-sensitive-paths-webpack-plugin@^2.4.0")
          (s."css-loader@^6.5.1")
          (s."css-minimizer-webpack-plugin@^3.2.0")
          (s."dotenv@^10.0.0")
          (s."dotenv-expand@^5.1.0")
          (s."eslint@^8.3.0")
          (s."eslint-config-react-app@^7.0.1")
          (s."eslint-webpack-plugin@^3.1.1")
          (s."file-loader@^6.2.0")
          (s."fs-extra@^10.0.0")
          (s."html-webpack-plugin@^5.5.0")
          (s."identity-obj-proxy@^3.0.0")
          (s."jest@^27.4.3")
          (s."jest-resolve@^27.4.2")
          (s."jest-watch-typeahead@^1.0.0")
          (s."mini-css-extract-plugin@^2.4.5")
          (s."postcss@^8.4.4")
          (s."postcss-flexbugs-fixes@^5.0.2")
          (s."postcss-loader@^6.2.1")
          (s."postcss-normalize@^10.0.1")
          (s."postcss-preset-env@^7.0.1")
          (s."prompts@^2.4.2")
          (s."react-app-polyfill@^3.0.0")
          (s."react-dev-utils@^12.0.1")
          (s."react-refresh@^0.11.0")
          (s."resolve@^1.20.0")
          (s."resolve-url-loader@^4.0.0")
          (s."sass-loader@^12.3.0")
          (s."semver@^7.3.5")
          (s."source-map-loader@^3.0.0")
          (s."style-loader@^3.3.1")
          (s."tailwindcss@^3.0.2")
          (s."terser-webpack-plugin@^5.2.5")
          (s."webpack@^5.64.4")
          (s."webpack-dev-server@^4.6.0")
          (s."webpack-manifest-plugin@^4.0.2")
          (s."workbox-webpack-plugin@^6.4.1")
          (s."fsevents@^2.3.2")
          ];
        "react-scripts@^5.0.1" = s."react-scripts@5.0.1";
        "react-syntax-highlighter@15.5.0" = f "react-syntax-highlighter" "15.5.0" y "4b3eccc2325fa2ec8eff1e2d6c18fa4a9e07ab20" [
          (s."@babel/runtime@^7.3.1")
          (s."highlight.js@^10.4.1")
          (s."lowlight@^1.17.0")
          (s."prismjs@^1.27.0")
          (s."refractor@^3.6.0")
          ];
        "react-syntax-highlighter@^15.4.5" = s."react-syntax-highlighter@15.5.0";
        "react-textarea-autosize@8.3.4" = f "react-textarea-autosize" "8.3.4" y "270a343de7ad350534141b02c9cb78903e553524" [
          (s."@babel/runtime@^7.10.2")
          (s."use-composed-ref@^1.3.0")
          (s."use-latest@^1.2.1")
          ];
        "react-textarea-autosize@^8.3.2" = s."react-textarea-autosize@8.3.4";
        "react-universal-interface@0.6.2" = f "react-universal-interface" "0.6.2" y "5e8d438a01729a4dbbcbeeceb0b86be146fe2b3b" [];
        "react-universal-interface@^0.6.2" = s."react-universal-interface@0.6.2";
        "react-use@17.4.0" = f "react-use" "17.4.0" y "cefef258b0a6c534a5c8021c2528ac6e1a4cdc6d" [
          (s."@types/js-cookie@^2.2.6")
          (s."@xobotyi/scrollbar-width@^1.9.5")
          (s."copy-to-clipboard@^3.3.1")
          (s."fast-deep-equal@^3.1.3")
          (s."fast-shallow-equal@^1.0.0")
          (s."js-cookie@^2.2.1")
          (s."nano-css@^5.3.1")
          (s."react-universal-interface@^0.6.2")
          (s."resize-observer-polyfill@^1.5.1")
          (s."screenfull@^5.1.0")
          (s."set-harmonic-interval@^1.0.1")
          (s."throttle-debounce@^3.0.1")
          (s."ts-easing@^0.2.0")
          (s."tslib@^2.1.0")
          ];
        "react-use@^17.4.0" = s."react-use@17.4.0";
        "react-vega@7.6.0" = f "react-vega" "7.6.0" y "b791c944046b20e02d366c7d0f8dcc21bdb4a6bb" [
          (s."@types/react@*")
          (s."fast-deep-equal@^3.1.1")
          (s."prop-types@^15.8.1")
          (s."vega-embed@^6.5.1")
          ];
        "react-vega@^7.6.0" = s."react-vega@7.6.0";
        "react@18.2.0" = f "react" "18.2.0" y "555bd98592883255fa00de14f1151a917b5d77d5" [
          (s."loose-envify@^1.1.0")
          ];
        "react@^18.0.0" = s."react@18.2.0";
        "react@^18.1.0" = s."react@18.2.0";
        "read-cache@1.0.0" = f "read-cache" "1.0.0" y "e664ef31161166c9751cdbe8dbcf86b5fb58f774" [
          (s."pify@^2.3.0")
          ];
        "read-cache@^1.0.0" = s."read-cache@1.0.0";
        "read-pkg-up@1.0.1" = f "read-pkg-up" "1.0.1" y "9d63c13276c065918d57f002a57f40a1b643fb02" [
          (s."find-up@^1.0.0")
          (s."read-pkg@^1.0.0")
          ];
        "read-pkg-up@7.0.1" = f "read-pkg-up" "7.0.1" y "f3a6135758459733ae2b95638056e1854e7ef507" [
          (s."find-up@^4.1.0")
          (s."read-pkg@^5.2.0")
          (s."type-fest@^0.8.1")
          ];
        "read-pkg-up@^1.0.1" = s."read-pkg-up@1.0.1";
        "read-pkg-up@^7.0.1" = s."read-pkg-up@7.0.1";
        "read-pkg@1.1.0" = f "read-pkg" "1.1.0" y "f5ffaa5ecd29cb31c0474bca7d756b6bb29e3f28" [
          (s."load-json-file@^1.0.0")
          (s."normalize-package-data@^2.3.2")
          (s."path-type@^1.0.0")
          ];
        "read-pkg@5.2.0" = f "read-pkg" "5.2.0" y "7bf295438ca5a33e56cd30e053b34ee7250c93cc" [
          (s."@types/normalize-package-data@^2.4.0")
          (s."normalize-package-data@^2.5.0")
          (s."parse-json@^5.0.0")
          (s."type-fest@^0.6.0")
          ];
        "read-pkg@^1.0.0" = s."read-pkg@1.1.0";
        "read-pkg@^5.2.0" = s."read-pkg@5.2.0";
        "read@1.0.7" = f "read" "1.0.7" y "b3da19bd052431a97671d44a42634adf710b40c4" [
          (s."mute-stream@~0.0.4")
          ];
        "read@^1.0.7" = s."read@1.0.7";
        "readable-stream@1 || 2" = s."readable-stream@2.3.7";
        "readable-stream@2.3.7" = f "readable-stream" "2.3.7" y "1eca1cf711aef814c04f62252a36a62f6cb23b57" [
          (s."core-util-is@~1.0.0")
          (s."inherits@~2.0.3")
          (s."isarray@~1.0.0")
          (s."process-nextick-args@~2.0.0")
          (s."safe-buffer@~5.1.1")
          (s."string_decoder@~1.1.1")
          (s."util-deprecate@~1.0.1")
          ];
        "readable-stream@3.6.0" = f "readable-stream" "3.6.0" y "337bbda3adc0706bd3e024426a286d4b4b2c9198" [
          (s."inherits@^2.0.3")
          (s."string_decoder@^1.1.1")
          (s."util-deprecate@^1.0.1")
          ];
        "readable-stream@^2.0.0" = s."readable-stream@2.3.7";
        "readable-stream@^2.0.1" = s."readable-stream@2.3.7";
        "readable-stream@^2.0.2" = s."readable-stream@2.3.7";
        "readable-stream@^2.1.4" = s."readable-stream@2.3.7";
        "readable-stream@^2.1.5" = s."readable-stream@2.3.7";
        "readable-stream@^2.2.2" = s."readable-stream@2.3.7";
        "readable-stream@^2.3.3" = s."readable-stream@2.3.7";
        "readable-stream@^2.3.6" = s."readable-stream@2.3.7";
        "readable-stream@^3.0.6" = s."readable-stream@3.6.0";
        "readable-stream@^3.6.0" = s."readable-stream@3.6.0";
        "readable-stream@~2.3.6" = s."readable-stream@2.3.7";
        "readdirp@2.2.1" = f "readdirp" "2.2.1" y "0e87622a3325aa33e892285caf8b4e846529a525" [
          (s."graceful-fs@^4.1.11")
          (s."micromatch@^3.1.10")
          (s."readable-stream@^2.0.2")
          ];
        "readdirp@3.6.0" = f "readdirp" "3.6.0" y "74a370bd857116e245b29cc97340cd431a02a6c7" [
          (s."picomatch@^2.2.1")
          ];
        "readdirp@^2.2.1" = s."readdirp@2.2.1";
        "readdirp@~3.6.0" = s."readdirp@3.6.0";
        "reading-time@1.5.0" = f "reading-time" "1.5.0" y "d2a7f1b6057cb2e169beaf87113cc3411b5bc5bb" [];
        "reading-time@^1.5.0" = s."reading-time@1.5.0";
        "reanalyze@2.23.0" = f "reanalyze" "2.23.0" y "0e2a3109518ccad0ba04366ec1811db17fa07b7e" [];
        "reanalyze@^2.23.0" = s."reanalyze@2.23.0";
        "rechoir@0.6.2" = f "rechoir" "0.6.2" y "85204b54dba82d5742e28c96756ef43af50e3384" [
          (s."resolve@^1.1.6")
          ];
        "rechoir@0.7.1" = f "rechoir" "0.7.1" y "9478a96a1ca135b5e88fc027f03ee92d6c645686" [
          (s."resolve@^1.9.0")
          ];
        "rechoir@^0.6.2" = s."rechoir@0.6.2";
        "rechoir@^0.7.0" = s."rechoir@0.7.1";
        "recursive-readdir@2.2.2" = f "recursive-readdir" "2.2.2" y "9946fb3274e1628de6e36b2f6714953b4845094f" [
          (s."minimatch@3.0.4")
          ];
        "recursive-readdir@^2.2.2" = s."recursive-readdir@2.2.2";
        "redent@1.0.0" = f "redent" "1.0.0" y "cf916ab1fd5f1f16dfb20822dd6ec7f730c2afde" [
          (s."indent-string@^2.1.0")
          (s."strip-indent@^1.0.1")
          ];
        "redent@3.0.0" = f "redent" "3.0.0" y "e557b7998316bb53c9f1f56fa626352c6963059f" [
          (s."indent-string@^4.0.0")
          (s."strip-indent@^3.0.0")
          ];
        "redent@^1.0.0" = s."redent@1.0.0";
        "redent@^3.0.0" = s."redent@3.0.0";
        "refractor@3.6.0" = f "refractor" "3.6.0" y "ac318f5a0715ead790fcfb0c71f4dd83d977935a" [
          (s."hastscript@^6.0.0")
          (s."parse-entities@^2.0.0")
          (s."prismjs@~1.27.0")
          ];
        "refractor@^3.6.0" = s."refractor@3.6.0";
        "regenerate-unicode-properties@10.0.1" = f "regenerate-unicode-properties" "10.0.1" y "7f442732aa7934a3740c779bb9b3340dccc1fb56" [
          (s."regenerate@^1.4.2")
          ];
        "regenerate-unicode-properties@^10.0.1" = s."regenerate-unicode-properties@10.0.1";
        "regenerate@1.4.2" = f "regenerate" "1.4.2" y "b9346d8827e8f5a32f7ba29637d398b69014848a" [];
        "regenerate@^1.4.2" = s."regenerate@1.4.2";
        "regenerator-runtime@0.11.1" = f "regenerator-runtime" "0.11.1" y "be05ad7f9bf7d22e056f9726cee5017fbf19e2e9" [];
        "regenerator-runtime@0.13.9" = f "regenerator-runtime" "0.13.9" y "8925742a98ffd90814988d7566ad30ca3b263b52" [];
        "regenerator-runtime@^0.11.0" = s."regenerator-runtime@0.11.1";
        "regenerator-runtime@^0.13.4" = s."regenerator-runtime@0.13.9";
        "regenerator-runtime@^0.13.7" = s."regenerator-runtime@0.13.9";
        "regenerator-runtime@^0.13.9" = s."regenerator-runtime@0.13.9";
        "regenerator-transform@0.15.0" = f "regenerator-transform" "0.15.0" y "cbd9ead5d77fae1a48d957cf889ad0586adb6537" [
          (s."@babel/runtime@^7.8.4")
          ];
        "regenerator-transform@^0.15.0" = s."regenerator-transform@0.15.0";
        "regex-not@1.0.2" = f "regex-not" "1.0.2" y "1f4ece27e00b0b65e0247a6810e6a85d83a5752c" [
          (s."extend-shallow@^3.0.2")
          (s."safe-regex@^1.1.0")
          ];
        "regex-not@^1.0.0" = s."regex-not@1.0.2";
        "regex-not@^1.0.2" = s."regex-not@1.0.2";
        "regex-parser@2.2.11" = f "regex-parser" "2.2.11" y "3b37ec9049e19479806e878cabe7c1ca83ccfe58" [];
        "regex-parser@^2.2.11" = s."regex-parser@2.2.11";
        "regexp.prototype.flags@1.4.3" = f "regexp.prototype.flags" "1.4.3" y "87cab30f80f66660181a3bb7bf5981a872b367ac" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."functions-have-names@^1.2.2")
          ];
        "regexp.prototype.flags@^1.4.1" = s."regexp.prototype.flags@1.4.3";
        "regexp.prototype.flags@^1.4.3" = s."regexp.prototype.flags@1.4.3";
        "regexpp@3.2.0" = f "regexpp" "3.2.0" y "0425a2768d8f23bad70ca4b90461fa2f1213e1b2" [];
        "regexpp@^3.2.0" = s."regexpp@3.2.0";
        "regexpu-core@5.0.1" = f "regexpu-core" "5.0.1" y "c531122a7840de743dcf9c83e923b5560323ced3" [
          (s."regenerate@^1.4.2")
          (s."regenerate-unicode-properties@^10.0.1")
          (s."regjsgen@^0.6.0")
          (s."regjsparser@^0.8.2")
          (s."unicode-match-property-ecmascript@^2.0.0")
          (s."unicode-match-property-value-ecmascript@^2.0.0")
          ];
        "regexpu-core@5.1.0" = f "regexpu-core" "5.1.0" y "2f8504c3fd0ebe11215783a41541e21c79942c6d" [
          (s."regenerate@^1.4.2")
          (s."regenerate-unicode-properties@^10.0.1")
          (s."regjsgen@^0.6.0")
          (s."regjsparser@^0.8.2")
          (s."unicode-match-property-ecmascript@^2.0.0")
          (s."unicode-match-property-value-ecmascript@^2.0.0")
          ];
        "regexpu-core@^5.0.1" = s."regexpu-core@5.0.1";
        "regexpu-core@^5.1.0" = s."regexpu-core@5.1.0";
        "registry-auth-token@4.2.2" = f "registry-auth-token" "4.2.2" y "f02d49c3668884612ca031419491a13539e21fac" [
          (s."rc@1.2.8")
          ];
        "registry-auth-token@^4.0.0" = s."registry-auth-token@4.2.2";
        "registry-url@5.1.0" = f "registry-url" "5.1.0" y "e98334b50d5434b81136b44ec638d9c2009c5009" [
          (s."rc@^1.2.8")
          ];
        "registry-url@^5.0.0" = s."registry-url@5.1.0";
        "regjsgen@0.6.0" = f "regjsgen" "0.6.0" y "83414c5354afd7d6627b16af5f10f41c4e71808d" [];
        "regjsgen@^0.6.0" = s."regjsgen@0.6.0";
        "regjsparser@0.8.4" = f "regjsparser" "0.8.4" y "8a14285ffcc5de78c5b95d62bbf413b6bc132d5f" [
          (s."jsesc@~0.5.0")
          ];
        "regjsparser@^0.8.2" = s."regjsparser@0.8.4";
        "rehype-katex@5.0.0" = f "rehype-katex" "5.0.0" y "b556f24fde918f28ba1cb642ea71c7e82f3373d7" [
          (s."@types/katex@^0.11.0")
          (s."hast-util-to-text@^2.0.0")
          (s."katex@^0.13.0")
          (s."rehype-parse@^7.0.0")
          (s."unified@^9.0.0")
          (s."unist-util-visit@^2.0.0")
          ];
        "rehype-katex@^5" = s."rehype-katex@5.0.0";
        "rehype-parse@7.0.1" = f "rehype-parse" "7.0.1" y "58900f6702b56767814afc2a9efa2d42b1c90c57" [
          (s."hast-util-from-parse5@^6.0.0")
          (s."parse5@^6.0.0")
          ];
        "rehype-parse@^7.0.0" = s."rehype-parse@7.0.1";
        "relateurl@0.2.7" = f "relateurl" "0.2.7" y "54dbf377e51440aca90a4cd274600d3ff2d888a9" [];
        "relateurl@^0.2.7" = s."relateurl@0.2.7";
        "release-zalgo@1.0.0" = f "release-zalgo" "1.0.0" y "09700b7e5074329739330e535c5a90fb67851730" [
          (s."es6-error@^4.0.1")
          ];
        "release-zalgo@^1.0.0" = s."release-zalgo@1.0.0";
        "remark-emoji@2.2.0" = f "remark-emoji" "2.2.0" y "1c702090a1525da5b80e15a8f963ef2c8236cac7" [
          (s."emoticon@^3.2.0")
          (s."node-emoji@^1.10.0")
          (s."unist-util-visit@^2.0.3")
          ];
        "remark-emoji@^2.2.0" = s."remark-emoji@2.2.0";
        "remark-external-links@8.0.0" = f "remark-external-links" "8.0.0" y "308de69482958b5d1cd3692bc9b725ce0240f345" [
          (s."extend@^3.0.0")
          (s."is-absolute-url@^3.0.0")
          (s."mdast-util-definitions@^4.0.0")
          (s."space-separated-tokens@^1.0.0")
          (s."unist-util-visit@^2.0.0")
          ];
        "remark-external-links@^8.0.0" = s."remark-external-links@8.0.0";
        "remark-footnotes@2.0.0" = f "remark-footnotes" "2.0.0" y "9001c4c2ffebba55695d2dd80ffb8b82f7e6303f" [];
        "remark-math@3.0.1" = f "remark-math" "3.0.1" y "85a02a15b15cad34b89a27244d4887b3a95185bb" [];
        "remark-math@^3" = s."remark-math@3.0.1";
        "remark-mdx@1.6.22" = f "remark-mdx" "1.6.22" y "06a8dab07dcfdd57f3373af7f86bd0e992108bbd" [
          (s."@babel/core@7.12.9")
          (s."@babel/helper-plugin-utils@7.10.4")
          (s."@babel/plugin-proposal-object-rest-spread@7.12.1")
          (s."@babel/plugin-syntax-jsx@7.12.1")
          (s."@mdx-js/util@1.6.22")
          (s."is-alphabetical@1.0.4")
          (s."remark-parse@8.0.3")
          (s."unified@9.2.0")
          ];
        "remark-parse@8.0.3" = f "remark-parse" "8.0.3" y "9c62aa3b35b79a486454c690472906075f40c7e1" [
          (s."ccount@^1.0.0")
          (s."collapse-white-space@^1.0.2")
          (s."is-alphabetical@^1.0.0")
          (s."is-decimal@^1.0.0")
          (s."is-whitespace-character@^1.0.0")
          (s."is-word-character@^1.0.0")
          (s."markdown-escapes@^1.0.0")
          (s."parse-entities@^2.0.0")
          (s."repeat-string@^1.5.4")
          (s."state-toggle@^1.0.0")
          (s."trim@0.0.1")
          (s."trim-trailing-lines@^1.0.0")
          (s."unherit@^1.0.4")
          (s."unist-util-remove-position@^2.0.0")
          (s."vfile-location@^3.0.0")
          (s."xtend@^4.0.1")
          ];
        "remark-slug@6.1.0" = f "remark-slug" "6.1.0" y "0503268d5f0c4ecb1f33315c00465ccdd97923ce" [
          (s."github-slugger@^1.0.0")
          (s."mdast-util-to-string@^1.0.0")
          (s."unist-util-visit@^2.0.0")
          ];
        "remark-slug@^6.0.0" = s."remark-slug@6.1.0";
        "remark-squeeze-paragraphs@4.0.0" = f "remark-squeeze-paragraphs" "4.0.0" y "76eb0e085295131c84748c8e43810159c5653ead" [
          (s."mdast-squeeze-paragraphs@^4.0.0")
          ];
        "remove-trailing-separator@1.1.0" = f "remove-trailing-separator" "1.1.0" y "c24bce2a283adad5bc3f58e0d48249b92379d8ef" [];
        "remove-trailing-separator@^1.0.1" = s."remove-trailing-separator@1.1.0";
        "renderkid@2.0.7" = f "renderkid" "2.0.7" y "464f276a6bdcee606f4a15993f9b29fc74ca8609" [
          (s."css-select@^4.1.3")
          (s."dom-converter@^0.2.0")
          (s."htmlparser2@^6.1.0")
          (s."lodash@^4.17.21")
          (s."strip-ansi@^3.0.1")
          ];
        "renderkid@3.0.0" = f "renderkid" "3.0.0" y "5fd823e4d6951d37358ecc9a58b1f06836b6268a" [
          (s."css-select@^4.1.3")
          (s."dom-converter@^0.2.0")
          (s."htmlparser2@^6.1.0")
          (s."lodash@^4.17.21")
          (s."strip-ansi@^6.0.1")
          ];
        "renderkid@^2.0.4" = s."renderkid@2.0.7";
        "renderkid@^3.0.0" = s."renderkid@3.0.0";
        "repeat-element@1.1.4" = f "repeat-element" "1.1.4" y "be681520847ab58c7568ac75fbfad28ed42d39e9" [];
        "repeat-element@^1.1.2" = s."repeat-element@1.1.4";
        "repeat-string@1.6.1" = f "repeat-string" "1.6.1" y "8dcae470e1c88abc2d600fff4a776286da75e637" [];
        "repeat-string@^1.0.0" = s."repeat-string@1.6.1";
        "repeat-string@^1.5.4" = s."repeat-string@1.6.1";
        "repeat-string@^1.6.1" = s."repeat-string@1.6.1";
        "repeating@2.0.1" = f "repeating" "2.0.1" y "5214c53a926d3552707527fbab415dbc08d06dda" [
          (s."is-finite@^1.0.0")
          ];
        "repeating@^2.0.0" = s."repeating@2.0.1";
        "require-directory@2.1.1" = f "require-directory" "2.1.1" y "8c64ad5fd30dab1c976e2344ffe7f792a6a6df42" [];
        "require-directory@^2.1.1" = s."require-directory@2.1.1";
        "require-from-string@2.0.2" = f "require-from-string" "2.0.2" y "89a7fdd938261267318eafe14f9c32e598c36909" [];
        "require-from-string@^2.0.2" = s."require-from-string@2.0.2";
        "require-like@0.1.2" = f "require-like" "0.1.2" y "ad6f30c13becd797010c468afa775c0c0a6b47fa" [];
        "require-like@>= 0.1.1" = s."require-like@0.1.2";
        "require-main-filename@2.0.0" = f "require-main-filename" "2.0.0" y "d0b329ecc7cc0f61649f62215be69af54aa8989b" [];
        "require-main-filename@^2.0.0" = s."require-main-filename@2.0.0";
        "requires-port@1.0.0" = f "requires-port" "1.0.0" y "925d2601d39ac485e091cf0da5c6e694dc3dcaff" [];
        "requires-port@^1.0.0" = s."requires-port@1.0.0";
        "rescript-fast-check@1.1.1" = f "rescript-fast-check" "1.1.1" y "ef153cb01254b2f01a738faf85b73327d423d5e1" [
          (s."fast-check@^2.17.0")
          ];
        "rescript-fast-check@^1.1.1" = s."rescript-fast-check@1.1.1";
        "rescript@9.1.4" = f "rescript" "9.1.4" y "1eb126f98d6c16942c0bf0df67c050198e580515" [];
        "rescript@^9.1.4" = s."rescript@9.1.4";
        "resize-observer-polyfill@1.5.1" = f "resize-observer-polyfill" "1.5.1" y "0e9020dd3d21024458d4ebd27e23e40269810464" [];
        "resize-observer-polyfill@^1.5.1" = s."resize-observer-polyfill@1.5.1";
        "resolve-cwd@3.0.0" = f "resolve-cwd" "3.0.0" y "0f0075f1bb2544766cf73ba6a6e2adfebcb13f2d" [
          (s."resolve-from@^5.0.0")
          ];
        "resolve-cwd@^3.0.0" = s."resolve-cwd@3.0.0";
        "resolve-from@4.0.0" = f "resolve-from" "4.0.0" y "4abcd852ad32dd7baabfe9b40e00a36db5f392e6" [];
        "resolve-from@5.0.0" = f "resolve-from" "5.0.0" y "c35225843df8f776df21c57557bc087e9dfdfc69" [];
        "resolve-from@^4.0.0" = s."resolve-from@4.0.0";
        "resolve-from@^5.0.0" = s."resolve-from@5.0.0";
        "resolve-pathname@3.0.0" = f "resolve-pathname" "3.0.0" y "99d02224d3cf263689becbb393bc560313025dcd" [];
        "resolve-pathname@^3.0.0" = s."resolve-pathname@3.0.0";
        "resolve-url-loader@4.0.0" = f "resolve-url-loader" "4.0.0" y "d50d4ddc746bb10468443167acf800dcd6c3ad57" [
          (s."adjust-sourcemap-loader@^4.0.0")
          (s."convert-source-map@^1.7.0")
          (s."loader-utils@^2.0.0")
          (s."postcss@^7.0.35")
          (s."source-map@0.6.1")
          ];
        "resolve-url-loader@^4.0.0" = s."resolve-url-loader@4.0.0";
        "resolve-url@0.2.1" = f "resolve-url" "0.2.1" y "2c637fe77c893afd2a663fe21aa9080068e2052a" [];
        "resolve-url@^0.2.1" = s."resolve-url@0.2.1";
        "resolve.exports@1.1.0" = f "resolve.exports" "1.1.0" y "5ce842b94b05146c0e03076985d1d0e7e48c90c9" [];
        "resolve.exports@^1.1.0" = s."resolve.exports@1.1.0";
        "resolve@1.22.1" = f "resolve" "1.22.1" y "27cb2ebb53f91abb49470a928bba7558066ac177" [
          (s."is-core-module@^2.9.0")
          (s."path-parse@^1.0.7")
          (s."supports-preserve-symlinks-flag@^1.0.0")
          ];
        "resolve@2.0.0-next.4" = f "resolve" "2.0.0-next.4" y "3d37a113d6429f496ec4752d2a2e58efb1fd4660" [
          (s."is-core-module@^2.9.0")
          (s."path-parse@^1.0.7")
          (s."supports-preserve-symlinks-flag@^1.0.0")
          ];
        "resolve@^1.1.6" = s."resolve@1.22.1";
        "resolve@^1.1.7" = s."resolve@1.22.1";
        "resolve@^1.10.0" = s."resolve@1.22.1";
        "resolve@^1.14.2" = s."resolve@1.22.1";
        "resolve@^1.19.0" = s."resolve@1.22.1";
        "resolve@^1.20.0" = s."resolve@1.22.1";
        "resolve@^1.22.0" = s."resolve@1.22.1";
        "resolve@^1.22.1" = s."resolve@1.22.1";
        "resolve@^1.3.2" = s."resolve@1.22.1";
        "resolve@^1.9.0" = s."resolve@1.22.1";
        "resolve@^2.0.0-next.3" = s."resolve@2.0.0-next.4";
        "responselike@1.0.2" = f "responselike" "1.0.2" y "918720ef3b631c5642be068f15ade5a46f4ba1e7" [
          (s."lowercase-keys@^1.0.0")
          ];
        "responselike@^1.0.2" = s."responselike@1.0.2";
        "ret@0.1.15" = f "ret" "0.1.15" y "b8a4825d5bdb1fc3f6f53c2bc33f81388681c7bc" [];
        "ret@~0.1.10" = s."ret@0.1.15";
        "retry@0.13.1" = f "retry" "0.13.1" y "185b1587acf67919d63b357349e03537b2484658" [];
        "retry@^0.13.1" = s."retry@0.13.1";
        "reusify@1.0.4" = f "reusify" "1.0.4" y "90da382b1e126efc02146e90845a88db12925d76" [];
        "reusify@^1.0.4" = s."reusify@1.0.4";
        "rimraf@2.7.1" = f "rimraf" "2.7.1" y "35797f13a7fdadc566142c29d4f07ccad483e3ec" [
          (s."glob@^7.1.3")
          ];
        "rimraf@3.0.2" = f "rimraf" "3.0.2" y "f1a5402ba6220ad52cc1282bac1ae3aa49fd061a" [
          (s."glob@^7.1.3")
          ];
        "rimraf@^2.5.4" = s."rimraf@2.7.1";
        "rimraf@^2.6.3" = s."rimraf@2.7.1";
        "rimraf@^3.0.0" = s."rimraf@3.0.2";
        "rimraf@^3.0.2" = s."rimraf@3.0.2";
        "ripemd160@2.0.2" = f "ripemd160" "2.0.2" y "a1c1a6f624751577ba5d07914cbc92850585890c" [
          (s."hash-base@^3.0.0")
          (s."inherits@^2.0.1")
          ];
        "ripemd160@^2.0.0" = s."ripemd160@2.0.2";
        "ripemd160@^2.0.1" = s."ripemd160@2.0.2";
        "robust-predicates@3.0.1" = f "robust-predicates" "3.0.1" y "ecde075044f7f30118682bd9fb3f123109577f9a" [];
        "robust-predicates@^3.0.0" = s."robust-predicates@3.0.1";
        "rollup-plugin-terser@7.0.2" = f "rollup-plugin-terser" "7.0.2" y "e8fbba4869981b2dc35ae7e8a502d5c6c04d324d" [
          (s."@babel/code-frame@^7.10.4")
          (s."jest-worker@^26.2.1")
          (s."serialize-javascript@^4.0.0")
          (s."terser@^5.0.0")
          ];
        "rollup-plugin-terser@^7.0.0" = s."rollup-plugin-terser@7.0.2";
        "rollup@2.75.7" = f "rollup" "2.75.7" y "221ff11887ae271e37dcc649ba32ce1590aaa0b9" [
          (s."fsevents@~2.3.2")
          ];
        "rollup@^2.43.1" = s."rollup@2.75.7";
        "rsvp@4.8.5" = f "rsvp" "4.8.5" y "c8f155311d167f68f21e168df71ec5b083113734" [];
        "rsvp@^4.8.4" = s."rsvp@4.8.5";
        "rtl-css-js@1.15.0" = f "rtl-css-js" "1.15.0" y "680ed816e570a9ebccba9e1cd0f202c6a8bb2dc0" [
          (s."@babel/runtime@^7.1.2")
          ];
        "rtl-css-js@^1.14.0" = s."rtl-css-js@1.15.0";
        "rtl-detect@1.0.4" = f "rtl-detect" "1.0.4" y "40ae0ea7302a150b96bc75af7d749607392ecac6" [];
        "rtl-detect@^1.0.4" = s."rtl-detect@1.0.4";
        "rtlcss@3.5.0" = f "rtlcss" "3.5.0" y "c9eb91269827a102bac7ae3115dd5d049de636c3" [
          (s."find-up@^5.0.0")
          (s."picocolors@^1.0.0")
          (s."postcss@^8.3.11")
          (s."strip-json-comments@^3.1.1")
          ];
        "rtlcss@^3.5.0" = s."rtlcss@3.5.0";
        "run-parallel@1.2.0" = f "run-parallel" "1.2.0" y "66d1368da7bdf921eb9d95bd1a9229e7f21a43ee" [
          (s."queue-microtask@^1.2.2")
          ];
        "run-parallel@^1.1.9" = s."run-parallel@1.2.0";
        "run-queue@1.0.3" = f "run-queue" "1.0.3" y "e848396f057d223f24386924618e25694161ec47" [
          (s."aproba@^1.1.1")
          ];
        "run-queue@^1.0.0" = s."run-queue@1.0.3";
        "run-queue@^1.0.3" = s."run-queue@1.0.3";
        "rw@1" = s."rw@1.3.3";
        "rw@1.3.3" = f "rw" "1.3.3" y "3f862dfa91ab766b14885ef4d01124bfda074fb4" [];
        "rxjs@7.5.5" = f "rxjs" "7.5.5" y "2ebad89af0f560f460ad5cc4213219e1f7dd4e9f" [
          (s."tslib@^2.1.0")
          ];
        "rxjs@^7.5.4" = s."rxjs@7.5.5";
        "safe-buffer@5.1.1" = f "safe-buffer" "5.1.1" y "893312af69b2123def71f57889001671eeb2c853" [];
        "safe-buffer@5.1.2" = f "safe-buffer" "5.1.2" y "991ec69d296e0313747d59bdfd2b745c35f8828d" [];
        "safe-buffer@5.2.1" = f "safe-buffer" "5.2.1" y "1eaf9fa9bdb1fdd4ec75f58f9cdb4e6b7827eec6" [];
        "safe-buffer@>=5.1.0" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.0.1" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.1.0" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.1.1" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.1.2" = s."safe-buffer@5.2.1";
        "safe-buffer@^5.2.0" = s."safe-buffer@5.2.1";
        "safe-buffer@~5.1.0" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.1.1" = s."safe-buffer@5.1.2";
        "safe-buffer@~5.2.0" = s."safe-buffer@5.2.1";
        "safe-regex@1.1.0" = f "safe-regex" "1.1.0" y "40a3669f3b077d1e943d44629e157dd48023bf2e" [
          (s."ret@~0.1.10")
          ];
        "safe-regex@^1.1.0" = s."safe-regex@1.1.0";
        "safer-buffer@2.1.2" = f "safer-buffer" "2.1.2" y "44fa161b0187b9549dd84bb91802f9bd8385cd6a" [];
        "safer-buffer@>= 2.1.2 < 3" = s."safer-buffer@2.1.2";
        "safer-buffer@>= 2.1.2 < 3.0.0" = s."safer-buffer@2.1.2";
        "safer-buffer@^2.1.0" = s."safer-buffer@2.1.2";
        "sane@4.1.0" = f "sane" "4.1.0" y "ed881fd922733a6c461bc189dc2b6c006f3ffded" [
          (s."@cnakazawa/watch@^1.0.3")
          (s."anymatch@^2.0.0")
          (s."capture-exit@^2.0.0")
          (s."exec-sh@^0.3.2")
          (s."execa@^1.0.0")
          (s."fb-watchman@^2.0.0")
          (s."micromatch@^3.1.4")
          (s."minimist@^1.1.1")
          (s."walker@~1.0.5")
          ];
        "sane@^4.0.3" = s."sane@4.1.0";
        "sanitize.css@*" = s."sanitize.css@13.0.0";
        "sanitize.css@13.0.0" = f "sanitize.css" "13.0.0" y "2675553974b27964c75562ade3bd85d79879f173" [];
        "sass-loader@12.6.0" = f "sass-loader" "12.6.0" y "5148362c8e2cdd4b950f3c63ac5d16dbfed37bcb" [
          (s."klona@^2.0.4")
          (s."neo-async@^2.6.2")
          ];
        "sass-loader@^12.3.0" = s."sass-loader@12.6.0";
        "sax@1.2.4" = f "sax" "1.2.4" y "2816234e2378bddc4e5354fab5caa895df7100d9" [];
        "sax@^1.2.4" = s."sax@1.2.4";
        "sax@~1.2.4" = s."sax@1.2.4";
        "saxes@5.0.1" = f "saxes" "5.0.1" y "eebab953fa3b7608dbe94e5dadb15c888fa6696d" [
          (s."xmlchars@^2.2.0")
          ];
        "saxes@^5.0.1" = s."saxes@5.0.1";
        "scheduler@0.23.0" = f "scheduler" "0.23.0" y "ba8041afc3d30eb206a487b6b384002e4e61fdfe" [
          (s."loose-envify@^1.1.0")
          ];
        "scheduler@^0.23.0" = s."scheduler@0.23.0";
        "schema-utils@1.0.0" = f "schema-utils" "1.0.0" y "0b79a93204d7b600d4b2850d1f66c2a34951c770" [
          (s."ajv@^6.1.0")
          (s."ajv-errors@^1.0.0")
          (s."ajv-keywords@^3.1.0")
          ];
        "schema-utils@2.7.0" = f "schema-utils" "2.7.0" y "17151f76d8eae67fbbf77960c33c676ad9f4efc7" [
          (s."@types/json-schema@^7.0.4")
          (s."ajv@^6.12.2")
          (s."ajv-keywords@^3.4.1")
          ];
        "schema-utils@2.7.1" = f "schema-utils" "2.7.1" y "1ca4f32d1b24c590c203b8e7a50bf0ea4cd394d7" [
          (s."@types/json-schema@^7.0.5")
          (s."ajv@^6.12.4")
          (s."ajv-keywords@^3.5.2")
          ];
        "schema-utils@3.1.1" = f "schema-utils" "3.1.1" y "bc74c4b6b6995c1d88f76a8b77bea7219e0c8281" [
          (s."@types/json-schema@^7.0.8")
          (s."ajv@^6.12.5")
          (s."ajv-keywords@^3.5.2")
          ];
        "schema-utils@4.0.0" = f "schema-utils" "4.0.0" y "60331e9e3ae78ec5d16353c467c34b3a0a1d3df7" [
          (s."@types/json-schema@^7.0.9")
          (s."ajv@^8.8.0")
          (s."ajv-formats@^2.1.1")
          (s."ajv-keywords@^5.0.0")
          ];
        "schema-utils@^1.0.0" = s."schema-utils@1.0.0";
        "schema-utils@^2.6.5" = s."schema-utils@2.7.1";
        "schema-utils@^2.7.0" = s."schema-utils@2.7.1";
        "schema-utils@^3.0.0" = s."schema-utils@3.1.1";
        "schema-utils@^3.1.0" = s."schema-utils@3.1.1";
        "schema-utils@^3.1.1" = s."schema-utils@3.1.1";
        "schema-utils@^4.0.0" = s."schema-utils@4.0.0";
        "screenfull@5.2.0" = f "screenfull" "5.2.0" y "6533d524d30621fc1283b9692146f3f13a93d1ba" [];
        "screenfull@^5.1.0" = s."screenfull@5.2.0";
        "section-matter@1.0.0" = f "section-matter" "1.0.0" y "e9041953506780ec01d59f292a19c7b850b84167" [
          (s."extend-shallow@^2.0.1")
          (s."kind-of@^6.0.0")
          ];
        "section-matter@^1.0.0" = s."section-matter@1.0.0";
        "seedrandom@3.0.5" = f "seedrandom" "3.0.5" y "54edc85c95222525b0c7a6f6b3543d8e0b3aa0a7" [];
        "seedrandom@^3.0.5" = s."seedrandom@3.0.5";
        "select-hose@2.0.0" = f "select-hose" "2.0.0" y "625d8658f865af43ec962bfc376a37359a4994ca" [];
        "select-hose@^2.0.0" = s."select-hose@2.0.0";
        "selfsigned@2.0.1" = f "selfsigned" "2.0.1" y "8b2df7fa56bf014d19b6007655fff209c0ef0a56" [
          (s."node-forge@^1")
          ];
        "selfsigned@^2.0.1" = s."selfsigned@2.0.1";
        "semver-diff@3.1.1" = f "semver-diff" "3.1.1" y "05f77ce59f325e00e2706afd67bb506ddb1ca32b" [
          (s."semver@^6.3.0")
          ];
        "semver-diff@^3.1.1" = s."semver-diff@3.1.1";
        "semver@2 || 3 || 4 || 5" = s."semver@5.7.1";
        "semver@5.7.1" = f "semver" "5.7.1" y "a954f931aeba508d307bbf069eff0c01c96116f7" [];
        "semver@6.3.0" = f "semver" "6.3.0" y "ee0a64c8af5e8ceea67687b133761e1becbd1d3d" [];
        "semver@7.0.0" = f "semver" "7.0.0" y "5f3ca35761e47e05b206c6daff2cf814f0316b8e" [];
        "semver@7.3.7" = f "semver" "7.3.7" y "12c5b649afdbf9049707796e22a4028814ce523f" [
          (s."lru-cache@^6.0.0")
          ];
        "semver@7.x" = s."semver@7.3.7";
        "semver@^5.1.0" = s."semver@5.7.1";
        "semver@^5.4.1" = s."semver@5.7.1";
        "semver@^5.5.0" = s."semver@5.7.1";
        "semver@^5.6.0" = s."semver@5.7.1";
        "semver@^6.0.0" = s."semver@6.3.0";
        "semver@^6.1.1" = s."semver@6.3.0";
        "semver@^6.1.2" = s."semver@6.3.0";
        "semver@^6.2.0" = s."semver@6.3.0";
        "semver@^6.3.0" = s."semver@6.3.0";
        "semver@^7.3.2" = s."semver@7.3.7";
        "semver@^7.3.4" = s."semver@7.3.7";
        "semver@^7.3.5" = s."semver@7.3.7";
        "semver@^7.3.7" = s."semver@7.3.7";
        "send@0.17.2" = f "send" "0.17.2" y "926622f76601c41808012c8bf1688fe3906f7820" [
          (s."debug@2.6.9")
          (s."depd@~1.1.2")
          (s."destroy@~1.0.4")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."fresh@0.5.2")
          (s."http-errors@1.8.1")
          (s."mime@1.6.0")
          (s."ms@2.1.3")
          (s."on-finished@~2.3.0")
          (s."range-parser@~1.2.1")
          (s."statuses@~1.5.0")
          ];
        "send@0.18.0" = f "send" "0.18.0" y "670167cc654b05f5aa4a767f9113bb371bc706be" [
          (s."debug@2.6.9")
          (s."depd@2.0.0")
          (s."destroy@1.2.0")
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."etag@~1.8.1")
          (s."fresh@0.5.2")
          (s."http-errors@2.0.0")
          (s."mime@1.6.0")
          (s."ms@2.1.3")
          (s."on-finished@2.4.1")
          (s."range-parser@~1.2.1")
          (s."statuses@2.0.1")
          ];
        "send@^0.17.1" = s."send@0.17.2";
        "serialize-javascript@4.0.0" = f "serialize-javascript" "4.0.0" y "b525e1238489a5ecfc42afacc3fe99e666f4b1aa" [
          (s."randombytes@^2.1.0")
          ];
        "serialize-javascript@5.0.1" = f "serialize-javascript" "5.0.1" y "7886ec848049a462467a97d3d918ebb2aaf934f4" [
          (s."randombytes@^2.1.0")
          ];
        "serialize-javascript@6.0.0" = f "serialize-javascript" "6.0.0" y "efae5d88f45d7924141da8b5c3a7a7e663fefeb8" [
          (s."randombytes@^2.1.0")
          ];
        "serialize-javascript@^4.0.0" = s."serialize-javascript@4.0.0";
        "serialize-javascript@^5.0.1" = s."serialize-javascript@5.0.1";
        "serialize-javascript@^6.0.0" = s."serialize-javascript@6.0.0";
        "serve-favicon@2.5.0" = f "serve-favicon" "2.5.0" y "935d240cdfe0f5805307fdfe967d88942a2cbcf0" [
          (s."etag@~1.8.1")
          (s."fresh@0.5.2")
          (s."ms@2.1.1")
          (s."parseurl@~1.3.2")
          (s."safe-buffer@5.1.1")
          ];
        "serve-favicon@^2.5.0" = s."serve-favicon@2.5.0";
        "serve-handler@6.1.3" = f "serve-handler" "6.1.3" y "1bf8c5ae138712af55c758477533b9117f6435e8" [
          (s."bytes@3.0.0")
          (s."content-disposition@0.5.2")
          (s."fast-url-parser@1.1.3")
          (s."mime-types@2.1.18")
          (s."minimatch@3.0.4")
          (s."path-is-inside@1.0.2")
          (s."path-to-regexp@2.2.1")
          (s."range-parser@1.2.0")
          ];
        "serve-handler@^6.1.3" = s."serve-handler@6.1.3";
        "serve-index@1.9.1" = f "serve-index" "1.9.1" y "d3768d69b1e7d82e5ce050fff5b453bea12a9239" [
          (s."accepts@~1.3.4")
          (s."batch@0.6.1")
          (s."debug@2.6.9")
          (s."escape-html@~1.0.3")
          (s."http-errors@~1.6.2")
          (s."mime-types@~2.1.17")
          (s."parseurl@~1.3.2")
          ];
        "serve-index@^1.9.1" = s."serve-index@1.9.1";
        "serve-static@1.15.0" = f "serve-static" "1.15.0" y "faaef08cffe0a1a62f60cad0c4e513cff0ac9540" [
          (s."encodeurl@~1.0.2")
          (s."escape-html@~1.0.3")
          (s."parseurl@~1.3.3")
          (s."send@0.18.0")
          ];
        "serve-static@^1.14.1" = s."serve-static@1.15.0";
        "set-blocking@2.0.0" = f "set-blocking" "2.0.0" y "045f9782d011ae9a6803ddd382b24392b3d890f7" [];
        "set-blocking@^2.0.0" = s."set-blocking@2.0.0";
        "set-harmonic-interval@1.0.1" = f "set-harmonic-interval" "1.0.1" y "e1773705539cdfb80ce1c3d99e7f298bb3995249" [];
        "set-harmonic-interval@^1.0.1" = s."set-harmonic-interval@1.0.1";
        "set-value@2.0.1" = f "set-value" "2.0.1" y "a18d40530e6f07de4228c7defe4227af8cad005b" [
          (s."extend-shallow@^2.0.1")
          (s."is-extendable@^0.1.1")
          (s."is-plain-object@^2.0.3")
          (s."split-string@^3.0.1")
          ];
        "set-value@^2.0.0" = s."set-value@2.0.1";
        "set-value@^2.0.1" = s."set-value@2.0.1";
        "setimmediate@1.0.5" = f "setimmediate" "1.0.5" y "290cbb232e306942d7d7ea9b83732ab7856f8285" [];
        "setimmediate@^1.0.4" = s."setimmediate@1.0.5";
        "setimmediate@^1.0.5" = s."setimmediate@1.0.5";
        "setprototypeof@1.1.0" = f "setprototypeof" "1.1.0" y "d0bd85536887b6fe7c0d818cb962d9d91c54e656" [];
        "setprototypeof@1.2.0" = f "setprototypeof" "1.2.0" y "66c9a24a73f9fc28cbe66b09fed3d33dcaf1b424" [];
        "sha.js@2.4.11" = f "sha.js" "2.4.11" y "37a5cf0b81ecbc6943de109ba2960d1b26584ae7" [
          (s."inherits@^2.0.1")
          (s."safe-buffer@^5.0.1")
          ];
        "sha.js@^2.4.0" = s."sha.js@2.4.11";
        "sha.js@^2.4.8" = s."sha.js@2.4.11";
        "shallow-clone@3.0.1" = f "shallow-clone" "3.0.1" y "8f2981ad92531f55035b01fb230769a40e02efa3" [
          (s."kind-of@^6.0.2")
          ];
        "shallow-clone@^3.0.0" = s."shallow-clone@3.0.1";
        "shallowequal@1.1.0" = f "shallowequal" "1.1.0" y "188d521de95b9087404fd4dcb68b13df0ae4e7f8" [];
        "shallowequal@^1.1.0" = s."shallowequal@1.1.0";
        "shebang-command@1.2.0" = f "shebang-command" "1.2.0" y "44aac65b695b03398968c39f363fee5deafdf1ea" [
          (s."shebang-regex@^1.0.0")
          ];
        "shebang-command@2.0.0" = f "shebang-command" "2.0.0" y "ccd0af4f8835fbdc265b82461aaf0c36663f34ea" [
          (s."shebang-regex@^3.0.0")
          ];
        "shebang-command@^1.2.0" = s."shebang-command@1.2.0";
        "shebang-command@^2.0.0" = s."shebang-command@2.0.0";
        "shebang-regex@1.0.0" = f "shebang-regex" "1.0.0" y "da42f49740c0b42db2ca9728571cb190c98efea3" [];
        "shebang-regex@3.0.0" = f "shebang-regex" "3.0.0" y "ae16f1644d873ecad843b0307b143362d4c42172" [];
        "shebang-regex@^1.0.0" = s."shebang-regex@1.0.0";
        "shebang-regex@^3.0.0" = s."shebang-regex@3.0.0";
        "shell-quote@1.7.3" = f "shell-quote" "1.7.3" y "aa40edac170445b9a431e17bb62c0b881b9c4123" [];
        "shell-quote@^1.7.3" = s."shell-quote@1.7.3";
        "shelljs@0.8.5" = f "shelljs" "0.8.5" y "de055408d8361bed66c669d2f000538ced8ee20c" [
          (s."glob@^7.0.0")
          (s."interpret@^1.0.0")
          (s."rechoir@^0.6.2")
          ];
        "shelljs@^0.8.5" = s."shelljs@0.8.5";
        "side-channel@1.0.4" = f "side-channel" "1.0.4" y "efce5c8fdc104ee751b25c58d4290011fa5ea2cf" [
          (s."call-bind@^1.0.0")
          (s."get-intrinsic@^1.0.2")
          (s."object-inspect@^1.9.0")
          ];
        "side-channel@^1.0.4" = s."side-channel@1.0.4";
        "signal-exit@3.0.7" = f "signal-exit" "3.0.7" y "a9a1767f8af84155114eaabd73f99273c8f59ad9" [];
        "signal-exit@^3.0.0" = s."signal-exit@3.0.7";
        "signal-exit@^3.0.2" = s."signal-exit@3.0.7";
        "signal-exit@^3.0.3" = s."signal-exit@3.0.7";
        "sirv@1.0.19" = f "sirv" "1.0.19" y "1d73979b38c7fe91fcba49c85280daa9c2363b49" [
          (s."@polka/url@^1.0.0-next.20")
          (s."mrmime@^1.0.0")
          (s."totalist@^1.0.0")
          ];
        "sirv@^1.0.7" = s."sirv@1.0.19";
        "sisteransi@1.0.5" = f "sisteransi" "1.0.5" y "134d681297756437cc05ca01370d3a7a571075ed" [];
        "sisteransi@^1.0.5" = s."sisteransi@1.0.5";
        "sitemap@7.1.1" = f "sitemap" "7.1.1" y "eeed9ad6d95499161a3eadc60f8c6dce4bea2bef" [
          (s."@types/node@^17.0.5")
          (s."@types/sax@^1.2.1")
          (s."arg@^5.0.0")
          (s."sax@^1.2.4")
          ];
        "sitemap@^7.1.1" = s."sitemap@7.1.1";
        "slash@2.0.0" = f "slash" "2.0.0" y "de552851a1759df3a8f206535442f5ec4ddeab44" [];
        "slash@3.0.0" = f "slash" "3.0.0" y "6539be870c165adbd5240220dbe361f1bc4d4634" [];
        "slash@4.0.0" = f "slash" "4.0.0" y "2422372176c4c6c5addb5e2ada885af984b396a7" [];
        "slash@^2.0.0" = s."slash@2.0.0";
        "slash@^3.0.0" = s."slash@3.0.0";
        "slash@^4.0.0" = s."slash@4.0.0";
        "snapdragon-node@2.1.1" = f "snapdragon-node" "2.1.1" y "6c175f86ff14bdb0724563e8f3c1b021a286853b" [
          (s."define-property@^1.0.0")
          (s."isobject@^3.0.0")
          (s."snapdragon-util@^3.0.1")
          ];
        "snapdragon-node@^2.0.1" = s."snapdragon-node@2.1.1";
        "snapdragon-util@3.0.1" = f "snapdragon-util" "3.0.1" y "f956479486f2acd79700693f6f7b805e45ab56e2" [
          (s."kind-of@^3.2.0")
          ];
        "snapdragon-util@^3.0.1" = s."snapdragon-util@3.0.1";
        "snapdragon@0.8.2" = f "snapdragon" "0.8.2" y "64922e7c565b0e14204ba1aa7d6964278d25182d" [
          (s."base@^0.11.1")
          (s."debug@^2.2.0")
          (s."define-property@^0.2.5")
          (s."extend-shallow@^2.0.1")
          (s."map-cache@^0.2.2")
          (s."source-map@^0.5.6")
          (s."source-map-resolve@^0.5.0")
          (s."use@^3.1.0")
          ];
        "snapdragon@^0.8.1" = s."snapdragon@0.8.2";
        "sockjs@0.3.24" = f "sockjs" "0.3.24" y "c9bc8995f33a111bea0395ec30aa3206bdb5ccce" [
          (s."faye-websocket@^0.11.3")
          (s."uuid@^8.3.2")
          (s."websocket-driver@^0.7.4")
          ];
        "sockjs@^0.3.24" = s."sockjs@0.3.24";
        "sort-css-media-queries@2.0.4" = f "sort-css-media-queries" "2.0.4" y "b2badfa519cb4a938acbc6d3aaa913d4949dc908" [];
        "source-list-map@2.0.1" = f "source-list-map" "2.0.1" y "3993bd873bfc48479cca9ea3a547835c7c154b34" [];
        "source-list-map@^2.0.0" = s."source-list-map@2.0.1";
        "source-list-map@^2.0.1" = s."source-list-map@2.0.1";
        "source-map-generator@0.8.0" = f "source-map-generator" "0.8.0" y "10d5ca0651e2c9302ea338739cbd4408849c5d00" [];
        "source-map-js@1.0.2" = f "source-map-js" "1.0.2" y "adbc361d9c62df380125e7f161f71c826f1e490c" [];
        "source-map-js@^1.0.1" = s."source-map-js@1.0.2";
        "source-map-js@^1.0.2" = s."source-map-js@1.0.2";
        "source-map-loader@3.0.1" = f "source-map-loader" "3.0.1" y "9ae5edc7c2d42570934be4c95d1ccc6352eba52d" [
          (s."abab@^2.0.5")
          (s."iconv-lite@^0.6.3")
          (s."source-map-js@^1.0.1")
          ];
        "source-map-loader@^3.0.0" = s."source-map-loader@3.0.1";
        "source-map-resolve@0.5.3" = f "source-map-resolve" "0.5.3" y "190866bece7553e1f8f267a2ee82c606b5509a1a" [
          (s."atob@^2.1.2")
          (s."decode-uri-component@^0.2.0")
          (s."resolve-url@^0.2.1")
          (s."source-map-url@^0.4.0")
          (s."urix@^0.1.0")
          ];
        "source-map-resolve@0.6.0" = f "source-map-resolve" "0.6.0" y "3d9df87e236b53f16d01e58150fc7711138e5ed2" [
          (s."atob@^2.1.2")
          (s."decode-uri-component@^0.2.0")
          ];
        "source-map-resolve@^0.5.0" = s."source-map-resolve@0.5.3";
        "source-map-resolve@^0.6.0" = s."source-map-resolve@0.6.0";
        "source-map-support@0.5.21" = f "source-map-support" "0.5.21" y "04fe7c7f9e1ed2d662233c28cb2b35b9f63f6e4f" [
          (s."buffer-from@^1.0.0")
          (s."source-map@^0.6.0")
          ];
        "source-map-support@^0.5.16" = s."source-map-support@0.5.21";
        "source-map-support@^0.5.6" = s."source-map-support@0.5.21";
        "source-map-support@~0.5.12" = s."source-map-support@0.5.21";
        "source-map-support@~0.5.20" = s."source-map-support@0.5.21";
        "source-map-url@0.4.1" = f "source-map-url" "0.4.1" y "0af66605a745a5a2f91cf1bbf8a7afbc283dec56" [];
        "source-map-url@^0.4.0" = s."source-map-url@0.4.1";
        "source-map@0.5.6" = f "source-map" "0.5.6" y "75ce38f52bf0733c5a7f0c118d81334a2bb5f412" [];
        "source-map@0.5.7" = f "source-map" "0.5.7" y "8a039d2d1021d22d1ea14c80d8ea468ba2ef3fcc" [];
        "source-map@0.6.1" = f "source-map" "0.6.1" y "74722af32e9614e9c287a8d0bbde48b5e2f1a263" [];
        "source-map@0.7.4" = f "source-map" "0.7.4" y "a9bbe705c9d8846f4e08ff6765acf0f1b0898656" [];
        "source-map@0.8.0-beta.0" = f "source-map" "0.8.0-beta.0" y "d4c1bb42c3f7ee925f005927ba10709e0d1d1f11" [
          (s."whatwg-url@^7.0.0")
          ];
        "source-map@^0.5.0" = s."source-map@0.5.7";
        "source-map@^0.5.6" = s."source-map@0.5.7";
        "source-map@^0.6.0" = s."source-map@0.6.1";
        "source-map@^0.6.1" = s."source-map@0.6.1";
        "source-map@^0.7.3" = s."source-map@0.7.4";
        "source-map@^0.8.0-beta.0" = s."source-map@0.8.0-beta.0";
        "source-map@~0.6.0" = s."source-map@0.6.1";
        "source-map@~0.6.1" = s."source-map@0.6.1";
        "sourcemap-codec@1.4.8" = f "sourcemap-codec" "1.4.8" y "ea804bd94857402e6992d05a38ef1ae35a9ab4c4" [];
        "sourcemap-codec@^1.4.8" = s."sourcemap-codec@1.4.8";
        "space-separated-tokens@1.1.5" = f "space-separated-tokens" "1.1.5" y "85f32c3d10d9682007e917414ddc5c26d1aa6899" [];
        "space-separated-tokens@^1.0.0" = s."space-separated-tokens@1.1.5";
        "spawn-wrap@2.0.0" = f "spawn-wrap" "2.0.0" y "103685b8b8f9b79771318827aa78650a610d457e" [
          (s."foreground-child@^2.0.0")
          (s."is-windows@^1.0.2")
          (s."make-dir@^3.0.0")
          (s."rimraf@^3.0.0")
          (s."signal-exit@^3.0.2")
          (s."which@^2.0.1")
          ];
        "spawn-wrap@^2.0.0" = s."spawn-wrap@2.0.0";
        "spdx-correct@3.1.1" = f "spdx-correct" "3.1.1" y "dece81ac9c1e6713e5f7d1b6f17d468fa53d89a9" [
          (s."spdx-expression-parse@^3.0.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-correct@^3.0.0" = s."spdx-correct@3.1.1";
        "spdx-exceptions@2.3.0" = f "spdx-exceptions" "2.3.0" y "3f28ce1a77a00372683eade4a433183527a2163d" [];
        "spdx-exceptions@^2.1.0" = s."spdx-exceptions@2.3.0";
        "spdx-expression-parse@3.0.1" = f "spdx-expression-parse" "3.0.1" y "cf70f50482eefdc98e3ce0a6833e4a53ceeba679" [
          (s."spdx-exceptions@^2.1.0")
          (s."spdx-license-ids@^3.0.0")
          ];
        "spdx-expression-parse@^3.0.0" = s."spdx-expression-parse@3.0.1";
        "spdx-license-ids@3.0.11" = f "spdx-license-ids" "3.0.11" y "50c0d8c40a14ec1bf449bae69a0ea4685a9d9f95" [];
        "spdx-license-ids@^3.0.0" = s."spdx-license-ids@3.0.11";
        "spdy-transport@3.0.0" = f "spdy-transport" "3.0.0" y "00d4863a6400ad75df93361a1608605e5dcdcf31" [
          (s."debug@^4.1.0")
          (s."detect-node@^2.0.4")
          (s."hpack.js@^2.1.6")
          (s."obuf@^1.1.2")
          (s."readable-stream@^3.0.6")
          (s."wbuf@^1.7.3")
          ];
        "spdy-transport@^3.0.0" = s."spdy-transport@3.0.0";
        "spdy@4.0.2" = f "spdy" "4.0.2" y "b74f466203a3eda452c02492b91fb9e84a27677b" [
          (s."debug@^4.1.0")
          (s."handle-thing@^2.0.0")
          (s."http-deceiver@^1.2.7")
          (s."select-hose@^2.0.0")
          (s."spdy-transport@^3.0.0")
          ];
        "spdy@^4.0.2" = s."spdy@4.0.2";
        "split-string@3.1.0" = f "split-string" "3.1.0" y "7cb09dda3a86585705c64b39a6466038682e8fe2" [
          (s."extend-shallow@^3.0.0")
          ];
        "split-string@^3.0.1" = s."split-string@3.1.0";
        "split-string@^3.0.2" = s."split-string@3.1.0";
        "sprintf-js@1.0.3" = f "sprintf-js" "1.0.3" y "04e6926f662895354f3dd015203633b857297e2c" [];
        "sprintf-js@~1.0.2" = s."sprintf-js@1.0.3";
        "ssri@6.0.2" = f "ssri" "6.0.2" y "157939134f20464e7301ddba3e90ffa8f7728ac5" [
          (s."figgy-pudding@^3.5.1")
          ];
        "ssri@8.0.1" = f "ssri" "8.0.1" y "638e4e439e2ffbd2cd289776d5ca457c4f51a2af" [
          (s."minipass@^3.1.1")
          ];
        "ssri@^6.0.1" = s."ssri@6.0.2";
        "ssri@^8.0.1" = s."ssri@8.0.1";
        "stable@0.1.8" = f "stable" "0.1.8" y "836eb3c8382fe2936feaf544631017ce7d47a3cf" [];
        "stable@^0.1.8" = s."stable@0.1.8";
        "stack-generator@2.0.10" = f "stack-generator" "2.0.10" y "8ae171e985ed62287d4f1ed55a1633b3fb53bb4d" [
          (s."stackframe@^1.3.4")
          ];
        "stack-generator@^2.0.5" = s."stack-generator@2.0.10";
        "stack-utils@2.0.5" = f "stack-utils" "2.0.5" y "d25265fca995154659dbbfba3b49254778d2fdd5" [
          (s."escape-string-regexp@^2.0.0")
          ];
        "stack-utils@^2.0.3" = s."stack-utils@2.0.5";
        "stackframe@1.3.4" = f "stackframe" "1.3.4" y "b881a004c8c149a5e8efef37d51b16e412943310" [];
        "stackframe@^1.3.4" = s."stackframe@1.3.4";
        "stacktrace-gps@3.1.2" = f "stacktrace-gps" "3.1.2" y "0c40b24a9b119b20da4525c398795338966a2fb0" [
          (s."source-map@0.5.6")
          (s."stackframe@^1.3.4")
          ];
        "stacktrace-gps@^3.0.4" = s."stacktrace-gps@3.1.2";
        "stacktrace-js@2.0.2" = f "stacktrace-js" "2.0.2" y "4ca93ea9f494752d55709a081d400fdaebee897b" [
          (s."error-stack-parser@^2.0.6")
          (s."stack-generator@^2.0.5")
          (s."stacktrace-gps@^3.0.4")
          ];
        "stacktrace-js@^2.0.2" = s."stacktrace-js@2.0.2";
        "state-toggle@1.0.3" = f "state-toggle" "1.0.3" y "e123b16a88e143139b09c6852221bc9815917dfe" [];
        "state-toggle@^1.0.0" = s."state-toggle@1.0.3";
        "static-extend@0.1.2" = f "static-extend" "0.1.2" y "60809c39cbff55337226fd5e0b520f341f1fb5c6" [
          (s."define-property@^0.2.5")
          (s."object-copy@^0.1.0")
          ];
        "static-extend@^0.1.1" = s."static-extend@0.1.2";
        "statuses@1.5.0" = f "statuses" "1.5.0" y "161c7dac177659fd9811f43771fa99381478628c" [];
        "statuses@2.0.1" = f "statuses" "2.0.1" y "55cb000ccf1d48728bd23c685a063998cf1a1b63" [];
        "statuses@>= 1.4.0 < 2" = s."statuses@1.5.0";
        "statuses@>= 1.5.0 < 2" = s."statuses@1.5.0";
        "statuses@~1.5.0" = s."statuses@1.5.0";
        "std-env@3.1.1" = f "std-env" "3.1.1" y "1f19c4d3f6278c52efd08a94574a2a8d32b7d092" [];
        "std-env@^3.0.1" = s."std-env@3.1.1";
        "store2@2.13.2" = f "store2" "2.13.2" y "01ad8802ca5b445b9c316b55e72645c13a3cd7e3" [];
        "store2@^2.12.0" = s."store2@2.13.2";
        "stream-browserify@2.0.2" = f "stream-browserify" "2.0.2" y "87521d38a44aa7ee91ce1cd2a47df0cb49dd660b" [
          (s."inherits@~2.0.1")
          (s."readable-stream@^2.0.2")
          ];
        "stream-browserify@^2.0.1" = s."stream-browserify@2.0.2";
        "stream-each@1.2.3" = f "stream-each" "1.2.3" y "ebe27a0c389b04fbcc233642952e10731afa9bae" [
          (s."end-of-stream@^1.1.0")
          (s."stream-shift@^1.0.0")
          ];
        "stream-each@^1.1.0" = s."stream-each@1.2.3";
        "stream-events@1.0.5" = f "stream-events" "1.0.5" y "bbc898ec4df33a4902d892333d47da9bf1c406d5" [
          (s."stubs@^3.0.0")
          ];
        "stream-events@^1.0.5" = s."stream-events@1.0.5";
        "stream-http@2.8.3" = f "stream-http" "2.8.3" y "b2d242469288a5a27ec4fe8933acf623de6514fc" [
          (s."builtin-status-codes@^3.0.0")
          (s."inherits@^2.0.1")
          (s."readable-stream@^2.3.6")
          (s."to-arraybuffer@^1.0.0")
          (s."xtend@^4.0.0")
          ];
        "stream-http@^2.7.2" = s."stream-http@2.8.3";
        "stream-shift@1.0.1" = f "stream-shift" "1.0.1" y "d7088281559ab2778424279b0877da3c392d5a3d" [];
        "stream-shift@^1.0.0" = s."stream-shift@1.0.1";
        "string-length@4.0.2" = f "string-length" "4.0.2" y "a8a8dc7bd5c1a82b9b3c8b87e125f66871b6e57a" [
          (s."char-regex@^1.0.2")
          (s."strip-ansi@^6.0.0")
          ];
        "string-length@5.0.1" = f "string-length" "5.0.1" y "3d647f497b6e8e8d41e422f7e0b23bc536c8381e" [
          (s."char-regex@^2.0.0")
          (s."strip-ansi@^7.0.1")
          ];
        "string-length@^4.0.1" = s."string-length@4.0.2";
        "string-length@^5.0.1" = s."string-length@5.0.1";
        "string-natural-compare@3.0.1" = f "string-natural-compare" "3.0.1" y "7a42d58474454963759e8e8b7ae63d71c1e7fdf4" [];
        "string-natural-compare@^3.0.1" = s."string-natural-compare@3.0.1";
        "string-width@4.2.3" = f "string-width" "4.2.3" y "269c7117d27b05ad2e536830a8ec895ef9c6d010" [
          (s."emoji-regex@^8.0.0")
          (s."is-fullwidth-code-point@^3.0.0")
          (s."strip-ansi@^6.0.1")
          ];
        "string-width@5.1.2" = f "string-width" "5.1.2" y "14f8daec6d81e7221d2a357e668cab73bdbca794" [
          (s."eastasianwidth@^0.2.0")
          (s."emoji-regex@^9.2.2")
          (s."strip-ansi@^7.0.1")
          ];
        "string-width@^1.0.2 || 2 || 3 || 4" = s."string-width@4.2.3";
        "string-width@^4.0.0" = s."string-width@4.2.3";
        "string-width@^4.1.0" = s."string-width@4.2.3";
        "string-width@^4.2.0" = s."string-width@4.2.3";
        "string-width@^4.2.2" = s."string-width@4.2.3";
        "string-width@^4.2.3" = s."string-width@4.2.3";
        "string-width@^5.0.1" = s."string-width@5.1.2";
        "string.prototype.matchall@4.0.7" = f "string.prototype.matchall" "4.0.7" y "8e6ecb0d8a1fb1fda470d81acecb2dba057a481d" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          (s."get-intrinsic@^1.1.1")
          (s."has-symbols@^1.0.3")
          (s."internal-slot@^1.0.3")
          (s."regexp.prototype.flags@^1.4.1")
          (s."side-channel@^1.0.4")
          ];
        "string.prototype.matchall@^4.0.0 || ^3.0.1" = s."string.prototype.matchall@4.0.7";
        "string.prototype.matchall@^4.0.6" = s."string.prototype.matchall@4.0.7";
        "string.prototype.matchall@^4.0.7" = s."string.prototype.matchall@4.0.7";
        "string.prototype.padend@3.1.3" = f "string.prototype.padend" "3.1.3" y "997a6de12c92c7cb34dc8a201a6c53d9bd88a5f1" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          ];
        "string.prototype.padend@^3.0.0" = s."string.prototype.padend@3.1.3";
        "string.prototype.padstart@3.1.3" = f "string.prototype.padstart" "3.1.3" y "4551d0117d9501692ec6000b15056ac3f816cfa5" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.19.1")
          ];
        "string.prototype.padstart@^3.0.0" = s."string.prototype.padstart@3.1.3";
        "string.prototype.trimend@1.0.5" = f "string.prototype.trimend" "1.0.5" y "914a65baaab25fbdd4ee291ca7dde57e869cb8d0" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.4")
          ];
        "string.prototype.trimend@^1.0.5" = s."string.prototype.trimend@1.0.5";
        "string.prototype.trimstart@1.0.5" = f "string.prototype.trimstart" "1.0.5" y "5466d93ba58cfa2134839f81d7f42437e8c01fef" [
          (s."call-bind@^1.0.2")
          (s."define-properties@^1.1.4")
          ];
        "string.prototype.trimstart@^1.0.5" = s."string.prototype.trimstart@1.0.5";
        "string_decoder@1.1.1" = f "string_decoder" "1.1.1" y "9cf1611ba62685d7030ae9e4ba34149c3af03fc8" [
          (s."safe-buffer@~5.1.0")
          ];
        "string_decoder@1.3.0" = f "string_decoder" "1.3.0" y "42f114594a46cf1a8e30b0a84f56c78c3edac21e" [
          (s."safe-buffer@~5.2.0")
          ];
        "string_decoder@^1.0.0" = s."string_decoder@1.3.0";
        "string_decoder@^1.1.1" = s."string_decoder@1.3.0";
        "string_decoder@~1.1.1" = s."string_decoder@1.1.1";
        "stringify-object@3.3.0" = f "stringify-object" "3.3.0" y "703065aefca19300d3ce88af4f5b3956d7556629" [
          (s."get-own-enumerable-property-symbols@^3.0.0")
          (s."is-obj@^1.0.1")
          (s."is-regexp@^1.0.0")
          ];
        "stringify-object@^3.3.0" = s."stringify-object@3.3.0";
        "strip-ansi@3.0.1" = f "strip-ansi" "3.0.1" y "6a385fb8853d952d5ff05d0e8aaf94278dc63dcf" [
          (s."ansi-regex@^2.0.0")
          ];
        "strip-ansi@6.0.1" = f "strip-ansi" "6.0.1" y "9e26c63d30f53443e9489495b2105d37b67a85d9" [
          (s."ansi-regex@^5.0.1")
          ];
        "strip-ansi@7.0.1" = f "strip-ansi" "7.0.1" y "61740a08ce36b61e50e65653f07060d000975fb2" [
          (s."ansi-regex@^6.0.1")
          ];
        "strip-ansi@^3.0.0" = s."strip-ansi@3.0.1";
        "strip-ansi@^3.0.1" = s."strip-ansi@3.0.1";
        "strip-ansi@^6.0.0" = s."strip-ansi@6.0.1";
        "strip-ansi@^6.0.1" = s."strip-ansi@6.0.1";
        "strip-ansi@^7.0.1" = s."strip-ansi@7.0.1";
        "strip-bom-string@1.0.0" = f "strip-bom-string" "1.0.0" y "e5211e9224369fbb81d633a2f00044dc8cedad92" [];
        "strip-bom-string@^1.0.0" = s."strip-bom-string@1.0.0";
        "strip-bom@2.0.0" = f "strip-bom" "2.0.0" y "6219a85616520491f35788bdbf1447a99c7e6b0e" [
          (s."is-utf8@^0.2.0")
          ];
        "strip-bom@3.0.0" = f "strip-bom" "3.0.0" y "2334c18e9c759f7bdd56fdef7e9ae3d588e68ed3" [];
        "strip-bom@4.0.0" = f "strip-bom" "4.0.0" y "9c3505c1db45bcedca3d9cf7a16f5c5aa3901878" [];
        "strip-bom@^2.0.0" = s."strip-bom@2.0.0";
        "strip-bom@^3.0.0" = s."strip-bom@3.0.0";
        "strip-bom@^4.0.0" = s."strip-bom@4.0.0";
        "strip-comments@2.0.1" = f "strip-comments" "2.0.1" y "4ad11c3fbcac177a67a40ac224ca339ca1c1ba9b" [];
        "strip-comments@^2.0.1" = s."strip-comments@2.0.1";
        "strip-eof@1.0.0" = f "strip-eof" "1.0.0" y "bb43ff5598a6eb05d89b59fcd129c983313606bf" [];
        "strip-eof@^1.0.0" = s."strip-eof@1.0.0";
        "strip-final-newline@2.0.0" = f "strip-final-newline" "2.0.0" y "89b852fb2fcbe936f6f4b3187afb0a12c1ab58ad" [];
        "strip-final-newline@^2.0.0" = s."strip-final-newline@2.0.0";
        "strip-indent@1.0.1" = f "strip-indent" "1.0.1" y "0c7962a6adefa7bbd4ac366460a638552ae1a0a2" [
          (s."get-stdin@^4.0.1")
          ];
        "strip-indent@3.0.0" = f "strip-indent" "3.0.0" y "c32e1cee940b6b3432c771bc2c54bcce73cd3001" [
          (s."min-indent@^1.0.0")
          ];
        "strip-indent@^1.0.1" = s."strip-indent@1.0.1";
        "strip-indent@^3.0.0" = s."strip-indent@3.0.0";
        "strip-json-comments@2.0.1" = f "strip-json-comments" "2.0.1" y "3c531942e908c2697c0ec344858c286c7ca0a60a" [];
        "strip-json-comments@3.1.1" = f "strip-json-comments" "3.1.1" y "31f1281b3832630434831c310c01cccda8cbe006" [];
        "strip-json-comments@^3.1.0" = s."strip-json-comments@3.1.1";
        "strip-json-comments@^3.1.1" = s."strip-json-comments@3.1.1";
        "strip-json-comments@~2.0.1" = s."strip-json-comments@2.0.1";
        "stubs@3.0.0" = f "stubs" "3.0.0" y "e8d2ba1fa9c90570303c030b6900f7d5f89abe5b" [];
        "stubs@^3.0.0" = s."stubs@3.0.0";
        "style-loader@1.3.0" = f "style-loader" "1.3.0" y "828b4a3b3b7e7aa5847ce7bae9e874512114249e" [
          (s."loader-utils@^2.0.0")
          (s."schema-utils@^2.7.0")
          ];
        "style-loader@2.0.0" = f "style-loader" "2.0.0" y "9669602fd4690740eaaec137799a03addbbc393c" [
          (s."loader-utils@^2.0.0")
          (s."schema-utils@^3.0.0")
          ];
        "style-loader@3.3.1" = f "style-loader" "3.3.1" y "057dfa6b3d4d7c7064462830f9113ed417d38575" [];
        "style-loader@^1.3.0" = s."style-loader@1.3.0";
        "style-loader@^2.0.0" = s."style-loader@2.0.0";
        "style-loader@^3.3.1" = s."style-loader@3.3.1";
        "style-to-object@0.3.0" = f "style-to-object" "0.3.0" y "b1b790d205991cc783801967214979ee19a76e46" [
          (s."inline-style-parser@0.1.1")
          ];
        "style-to-object@^0.3.0" = s."style-to-object@0.3.0";
        "style-value-types@5.0.0" = f "style-value-types" "5.0.0" y "76c35f0e579843d523187989da866729411fc8ad" [
          (s."hey-listen@^1.0.8")
          (s."tslib@^2.1.0")
          ];
        "stylehacks@5.1.0" = f "stylehacks" "5.1.0" y "a40066490ca0caca04e96c6b02153ddc39913520" [
          (s."browserslist@^4.16.6")
          (s."postcss-selector-parser@^6.0.4")
          ];
        "stylehacks@^5.1.0" = s."stylehacks@5.1.0";
        "stylis@4.1.1" = f "stylis" "4.1.1" y "e46c6a9bbf7c58db1e65bb730be157311ae1fe12" [];
        "stylis@^4.0.6" = s."stylis@4.1.1";
        "supports-color@2.0.0" = f "supports-color" "2.0.0" y "535d045ce6b6363fa40117084629995e9df324c7" [];
        "supports-color@5.5.0" = f "supports-color" "5.5.0" y "e2e69a44ac8772f78a1ec0b35b689df6530efc8f" [
          (s."has-flag@^3.0.0")
          ];
        "supports-color@7.2.0" = f "supports-color" "7.2.0" y "1b7dcdcb32b8138801b3e478ba6a51caa89648da" [
          (s."has-flag@^4.0.0")
          ];
        "supports-color@8.1.1" = f "supports-color" "8.1.1" y "cd6fc17e28500cff56c1b86c0a7fd4a54a73005c" [
          (s."has-flag@^4.0.0")
          ];
        "supports-color@^2.0.0" = s."supports-color@2.0.0";
        "supports-color@^5.3.0" = s."supports-color@5.5.0";
        "supports-color@^7.0.0" = s."supports-color@7.2.0";
        "supports-color@^7.1.0" = s."supports-color@7.2.0";
        "supports-color@^8.0.0" = s."supports-color@8.1.1";
        "supports-hyperlinks@2.2.0" = f "supports-hyperlinks" "2.2.0" y "4f77b42488765891774b70c79babd87f9bd594bb" [
          (s."has-flag@^4.0.0")
          (s."supports-color@^7.0.0")
          ];
        "supports-hyperlinks@^2.0.0" = s."supports-hyperlinks@2.2.0";
        "supports-preserve-symlinks-flag@1.0.0" = f "supports-preserve-symlinks-flag" "1.0.0" y "6eda4bd344a3c94aea376d4cc31bc77311039e09" [];
        "supports-preserve-symlinks-flag@^1.0.0" = s."supports-preserve-symlinks-flag@1.0.0";
        "svg-parser@2.0.4" = f "svg-parser" "2.0.4" y "fdc2e29e13951736140b76cb122c8ee6630eb6b5" [];
        "svg-parser@^2.0.2" = s."svg-parser@2.0.4";
        "svgo@1.3.2" = f "svgo" "1.3.2" y "b6dc511c063346c9e415b81e43401145b96d4167" [
          (s."chalk@^2.4.1")
          (s."coa@^2.0.2")
          (s."css-select@^2.0.0")
          (s."css-select-base-adapter@^0.1.1")
          (s."css-tree@1.0.0-alpha.37")
          (s."csso@^4.0.2")
          (s."js-yaml@^3.13.1")
          (s."mkdirp@~0.5.1")
          (s."object.values@^1.1.0")
          (s."sax@~1.2.4")
          (s."stable@^0.1.8")
          (s."unquote@~1.1.1")
          (s."util.promisify@~1.0.0")
          ];
        "svgo@2.8.0" = f "svgo" "2.8.0" y "4ff80cce6710dc2795f0c7c74101e6764cfccd24" [
          (s."@trysound/sax@0.2.0")
          (s."commander@^7.2.0")
          (s."css-select@^4.1.3")
          (s."css-tree@^1.1.3")
          (s."csso@^4.2.0")
          (s."picocolors@^1.0.0")
          (s."stable@^0.1.8")
          ];
        "svgo@^1.2.2" = s."svgo@1.3.2";
        "svgo@^2.5.0" = s."svgo@2.8.0";
        "svgo@^2.7.0" = s."svgo@2.8.0";
        "symbol-tree@3.2.4" = f "symbol-tree" "3.2.4" y "430637d248ba77e078883951fb9aa0eed7c63fa2" [];
        "symbol-tree@^3.2.4" = s."symbol-tree@3.2.4";
        "symbol.prototype.description@1.0.5" = f "symbol.prototype.description" "1.0.5" y "d30e01263b6020fbbd2d2884a6276ce4d49ab568" [
          (s."call-bind@^1.0.2")
          (s."get-symbol-description@^1.0.0")
          (s."has-symbols@^1.0.2")
          (s."object.getownpropertydescriptors@^2.1.2")
          ];
        "symbol.prototype.description@^1.0.0" = s."symbol.prototype.description@1.0.5";
        "synchronous-promise@2.0.15" = f "synchronous-promise" "2.0.15" y "07ca1822b9de0001f5ff73595f3d08c4f720eb8e" [];
        "synchronous-promise@^2.0.15" = s."synchronous-promise@2.0.15";
        "tailwindcss@3.1.7" = f "tailwindcss" "3.1.7" y "ce99425f30a74e01457a2e6a724463b0df3159ac" [
          (s."arg@^5.0.2")
          (s."chokidar@^3.5.3")
          (s."color-name@^1.1.4")
          (s."detective@^5.2.1")
          (s."didyoumean@^1.2.2")
          (s."dlv@^1.1.3")
          (s."fast-glob@^3.2.11")
          (s."glob-parent@^6.0.2")
          (s."is-glob@^4.0.3")
          (s."lilconfig@^2.0.6")
          (s."normalize-path@^3.0.0")
          (s."object-hash@^3.0.0")
          (s."picocolors@^1.0.0")
          (s."postcss@^8.4.14")
          (s."postcss-import@^14.1.0")
          (s."postcss-js@^4.0.0")
          (s."postcss-load-config@^3.1.4")
          (s."postcss-nested@5.0.6")
          (s."postcss-selector-parser@^6.0.10")
          (s."postcss-value-parser@^4.2.0")
          (s."quick-lru@^5.1.1")
          (s."resolve@^1.22.1")
          ];
        "tailwindcss@^3.0.2" = s."tailwindcss@3.1.7";
        "tailwindcss@^3.1.7" = s."tailwindcss@3.1.7";
        "tapable@1.1.3" = f "tapable" "1.1.3" y "a1fccc06b58db61fd7a45da2da44f5f3a3e67ba2" [];
        "tapable@2.2.1" = f "tapable" "2.2.1" y "1967a73ef4060a82f12ab96af86d52fdb76eeca0" [];
        "tapable@^1.0.0" = s."tapable@1.1.3";
        "tapable@^1.1.3" = s."tapable@1.1.3";
        "tapable@^2.0.0" = s."tapable@2.2.1";
        "tapable@^2.1.1" = s."tapable@2.2.1";
        "tapable@^2.2.0" = s."tapable@2.2.1";
        "tar@6.1.11" = f "tar" "6.1.11" y "6760a38f003afa1b2ffd0ffe9e9abbd0eab3d621" [
          (s."chownr@^2.0.0")
          (s."fs-minipass@^2.0.0")
          (s."minipass@^3.0.0")
          (s."minizlib@^2.1.1")
          (s."mkdirp@^1.0.3")
          (s."yallist@^4.0.0")
          ];
        "tar@^6.0.2" = s."tar@6.1.11";
        "teeny-request@7.1.1" = f "teeny-request" "7.1.1" y "2b0d156f4a8ad81de44303302ba8d7f1f05e20e6" [
          (s."http-proxy-agent@^4.0.0")
          (s."https-proxy-agent@^5.0.0")
          (s."node-fetch@^2.6.1")
          (s."stream-events@^1.0.5")
          (s."uuid@^8.0.0")
          ];
        "telejson@6.0.8" = f "telejson" "6.0.8" y "1c432db7e7a9212c1fbd941c3e5174ec385148f7" [
          (s."@types/is-function@^1.0.0")
          (s."global@^4.4.0")
          (s."is-function@^1.0.2")
          (s."is-regex@^1.1.2")
          (s."is-symbol@^1.0.3")
          (s."isobject@^4.0.0")
          (s."lodash@^4.17.21")
          (s."memoizerific@^1.11.3")
          ];
        "telejson@^6.0.8" = s."telejson@6.0.8";
        "temp-dir@2.0.0" = f "temp-dir" "2.0.0" y "bde92b05bdfeb1516e804c9c00ad45177f31321e" [];
        "temp-dir@^2.0.0" = s."temp-dir@2.0.0";
        "tempy@0.6.0" = f "tempy" "0.6.0" y "65e2c35abc06f1124a97f387b08303442bde59f3" [
          (s."is-stream@^2.0.0")
          (s."temp-dir@^2.0.0")
          (s."type-fest@^0.16.0")
          (s."unique-string@^2.0.0")
          ];
        "tempy@^0.6.0" = s."tempy@0.6.0";
        "terminal-link@2.1.1" = f "terminal-link" "2.1.1" y "14a64a27ab3c0df933ea546fba55f2d078edc994" [
          (s."ansi-escapes@^4.2.1")
          (s."supports-hyperlinks@^2.0.0")
          ];
        "terminal-link@^2.0.0" = s."terminal-link@2.1.1";
        "terser-webpack-plugin@1.4.5" = f "terser-webpack-plugin" "1.4.5" y "a217aefaea330e734ffacb6120ec1fa312d6040b" [
          (s."cacache@^12.0.2")
          (s."find-cache-dir@^2.1.0")
          (s."is-wsl@^1.1.0")
          (s."schema-utils@^1.0.0")
          (s."serialize-javascript@^4.0.0")
          (s."source-map@^0.6.1")
          (s."terser@^4.1.2")
          (s."webpack-sources@^1.4.0")
          (s."worker-farm@^1.7.0")
          ];
        "terser-webpack-plugin@4.2.3" = f "terser-webpack-plugin" "4.2.3" y "28daef4a83bd17c1db0297070adc07fc8cfc6a9a" [
          (s."cacache@^15.0.5")
          (s."find-cache-dir@^3.3.1")
          (s."jest-worker@^26.5.0")
          (s."p-limit@^3.0.2")
          (s."schema-utils@^3.0.0")
          (s."serialize-javascript@^5.0.1")
          (s."source-map@^0.6.1")
          (s."terser@^5.3.4")
          (s."webpack-sources@^1.4.3")
          ];
        "terser-webpack-plugin@5.3.3" = f "terser-webpack-plugin" "5.3.3" y "8033db876dd5875487213e87c627bca323e5ed90" [
          (s."@jridgewell/trace-mapping@^0.3.7")
          (s."jest-worker@^27.4.5")
          (s."schema-utils@^3.1.1")
          (s."serialize-javascript@^6.0.0")
          (s."terser@^5.7.2")
          ];
        "terser-webpack-plugin@^1.4.3" = s."terser-webpack-plugin@1.4.5";
        "terser-webpack-plugin@^4.2.3" = s."terser-webpack-plugin@4.2.3";
        "terser-webpack-plugin@^5.0.3" = s."terser-webpack-plugin@5.3.3";
        "terser-webpack-plugin@^5.1.3" = s."terser-webpack-plugin@5.3.3";
        "terser-webpack-plugin@^5.2.5" = s."terser-webpack-plugin@5.3.3";
        "terser-webpack-plugin@^5.3.3" = s."terser-webpack-plugin@5.3.3";
        "terser@4.8.1" = f "terser" "4.8.1" y "a00e5634562de2239fd404c649051bf6fc21144f" [
          (s."commander@^2.20.0")
          (s."source-map@~0.6.1")
          (s."source-map-support@~0.5.12")
          ];
        "terser@5.14.1" = f "terser" "5.14.1" y "7c95eec36436cb11cf1902cc79ac564741d19eca" [
          (s."@jridgewell/source-map@^0.3.2")
          (s."acorn@^8.5.0")
          (s."commander@^2.20.0")
          (s."source-map-support@~0.5.20")
          ];
        "terser@^4.1.2" = s."terser@4.8.1";
        "terser@^4.6.3" = s."terser@4.8.1";
        "terser@^5.0.0" = s."terser@5.14.1";
        "terser@^5.10.0" = s."terser@5.14.1";
        "terser@^5.3.4" = s."terser@5.14.1";
        "terser@^5.7.2" = s."terser@5.14.1";
        "test-exclude@6.0.0" = f "test-exclude" "6.0.0" y "04a8698661d805ea6fa293b6cb9e63ac044ef15e" [
          (s."@istanbuljs/schema@^0.1.2")
          (s."glob@^7.1.4")
          (s."minimatch@^3.0.4")
          ];
        "test-exclude@^6.0.0" = s."test-exclude@6.0.0";
        "text-table@0.2.0" = f "text-table" "0.2.0" y "7f5ee823ae805207c00af2df4a84ec3fcfa570b4" [];
        "text-table@^0.2.0" = s."text-table@0.2.0";
        "thenby@1.3.4" = f "thenby" "1.3.4" y "81581f6e1bb324c6dedeae9bfc28e59b1a2201cc" [];
        "thenby@^1.3.4" = s."thenby@1.3.4";
        "throat@6.0.1" = f "throat" "6.0.1" y "d514fedad95740c12c2d7fc70ea863eb51ade375" [];
        "throat@^6.0.1" = s."throat@6.0.1";
        "throttle-debounce@3.0.1" = f "throttle-debounce" "3.0.1" y "32f94d84dfa894f786c9a1f290e7a645b6a19abb" [];
        "throttle-debounce@^3.0.1" = s."throttle-debounce@3.0.1";
        "through2@2.0.5" = f "through2" "2.0.5" y "01c1e39eb31d07cb7d03a96a70823260b23132cd" [
          (s."readable-stream@~2.3.6")
          (s."xtend@~4.0.1")
          ];
        "through2@^2.0.0" = s."through2@2.0.5";
        "thunky@1.1.0" = f "thunky" "1.1.0" y "5abaf714a9405db0504732bbccd2cedd9ef9537d" [];
        "thunky@^1.0.2" = s."thunky@1.1.0";
        "timers-browserify@2.0.12" = f "timers-browserify" "2.0.12" y "44a45c11fbf407f34f97bccd1577c652361b00ee" [
          (s."setimmediate@^1.0.4")
          ];
        "timers-browserify@^2.0.4" = s."timers-browserify@2.0.12";
        "tiny-emitter@2.1.0" = f "tiny-emitter" "2.1.0" y "1d1a56edfc51c43e863cbb5382a72330e3555423" [];
        "tiny-emitter@^2.1.0" = s."tiny-emitter@2.1.0";
        "tiny-invariant@1.2.0" = f "tiny-invariant" "1.2.0" y "a1141f86b672a9148c72e978a19a73b9b94a15a9" [];
        "tiny-invariant@^1.0.2" = s."tiny-invariant@1.2.0";
        "tiny-warning@1.0.3" = f "tiny-warning" "1.0.3" y "94a30db453df4c643d0fd566060d60a875d84754" [];
        "tiny-warning@^1.0.0" = s."tiny-warning@1.0.3";
        "tiny-warning@^1.0.3" = s."tiny-warning@1.0.3";
        "tmp@0.0.29" = f "tmp" "0.0.29" y "f25125ff0dd9da3ccb0c2dd371ee1288bb9128c0" [
          (s."os-tmpdir@~1.0.1")
          ];
        "tmpl@1.0.5" = f "tmpl" "1.0.5" y "8683e0b902bb9c20c4f726e3c0b69f36518c07cc" [];
        "to-arraybuffer@1.0.1" = f "to-arraybuffer" "1.0.1" y "7d229b1fcc637e466ca081180836a7aabff83f43" [];
        "to-arraybuffer@^1.0.0" = s."to-arraybuffer@1.0.1";
        "to-fast-properties@1.0.3" = f "to-fast-properties" "1.0.3" y "b83571fa4d8c25b82e231b06e3a3055de4ca1a47" [];
        "to-fast-properties@2.0.0" = f "to-fast-properties" "2.0.0" y "dc5e698cbd079265bc73e0377681a4e4e83f616e" [];
        "to-fast-properties@^1.0.3" = s."to-fast-properties@1.0.3";
        "to-fast-properties@^2.0.0" = s."to-fast-properties@2.0.0";
        "to-object-path@0.3.0" = f "to-object-path" "0.3.0" y "297588b7b0e7e0ac08e04e672f85c1f4999e17af" [
          (s."kind-of@^3.0.2")
          ];
        "to-object-path@^0.3.0" = s."to-object-path@0.3.0";
        "to-readable-stream@1.0.0" = f "to-readable-stream" "1.0.0" y "ce0aa0c2f3df6adf852efb404a783e77c0475771" [];
        "to-readable-stream@^1.0.0" = s."to-readable-stream@1.0.0";
        "to-regex-range@2.1.1" = f "to-regex-range" "2.1.1" y "7c80c17b9dfebe599e27367e0d4dd5590141db38" [
          (s."is-number@^3.0.0")
          (s."repeat-string@^1.6.1")
          ];
        "to-regex-range@5.0.1" = f "to-regex-range" "5.0.1" y "1648c44aae7c8d988a326018ed72f5b4dd0392e4" [
          (s."is-number@^7.0.0")
          ];
        "to-regex-range@^2.1.0" = s."to-regex-range@2.1.1";
        "to-regex-range@^5.0.1" = s."to-regex-range@5.0.1";
        "to-regex@3.0.2" = f "to-regex" "3.0.2" y "13cfdd9b336552f30b51f33a8ae1b42a7a7599ce" [
          (s."define-property@^2.0.2")
          (s."extend-shallow@^3.0.2")
          (s."regex-not@^1.0.2")
          (s."safe-regex@^1.1.0")
          ];
        "to-regex@^3.0.1" = s."to-regex@3.0.2";
        "to-regex@^3.0.2" = s."to-regex@3.0.2";
        "toggle-selection@1.0.6" = f "toggle-selection" "1.0.6" y "6e45b1263f2017fa0acc7d89d78b15b8bf77da32" [];
        "toggle-selection@^1.0.6" = s."toggle-selection@1.0.6";
        "toidentifier@1.0.1" = f "toidentifier" "1.0.1" y "3be34321a88a820ed1bd80dfaa33e479fbb8dd35" [];
        "topojson-client@3.1.0" = f "topojson-client" "3.1.0" y "22e8b1ed08a2b922feeb4af6f53b6ef09a467b99" [
          (s."commander@2")
          ];
        "topojson-client@^3.1.0" = s."topojson-client@3.1.0";
        "toposort@2.0.2" = f "toposort" "2.0.2" y "ae21768175d1559d48bef35420b2f4962f09c330" [];
        "toposort@^2.0.2" = s."toposort@2.0.2";
        "totalist@1.1.0" = f "totalist" "1.1.0" y "a4d65a3e546517701e3e5c37a47a70ac97fe56df" [];
        "totalist@^1.0.0" = s."totalist@1.1.0";
        "tough-cookie@4.0.0" = f "tough-cookie" "4.0.0" y "d822234eeca882f991f0f908824ad2622ddbece4" [
          (s."psl@^1.1.33")
          (s."punycode@^2.1.1")
          (s."universalify@^0.1.2")
          ];
        "tough-cookie@^4.0.0" = s."tough-cookie@4.0.0";
        "tr46@0.0.3" = f "tr46" "0.0.3" y "8184fd347dac9cdc185992f3a6622e14b9d9ab6a" [];
        "tr46@1.0.1" = f "tr46" "1.0.1" y "a8b13fd6bfd2489519674ccde55ba3693b706d09" [
          (s."punycode@^2.1.0")
          ];
        "tr46@2.1.0" = f "tr46" "2.1.0" y "fa87aa81ca5d5941da8cbf1f9b749dc969a4e240" [
          (s."punycode@^2.1.1")
          ];
        "tr46@^1.0.1" = s."tr46@1.0.1";
        "tr46@^2.1.0" = s."tr46@2.1.0";
        "tr46@~0.0.3" = s."tr46@0.0.3";
        "trim-newlines@1.0.0" = f "trim-newlines" "1.0.0" y "5887966bb582a4503a41eb524f7d35011815a613" [];
        "trim-newlines@^1.0.0" = s."trim-newlines@1.0.0";
        "trim-trailing-lines@1.1.4" = f "trim-trailing-lines" "1.1.4" y "bd4abbec7cc880462f10b2c8b5ce1d8d1ec7c2c0" [];
        "trim-trailing-lines@^1.0.0" = s."trim-trailing-lines@1.1.4";
        "trim@0.0.1" = f "trim" "0.0.1" y "5858547f6b290757ee95cccc666fb50084c460dd" [];
        "trough@1.0.5" = f "trough" "1.0.5" y "b8b639cefad7d0bb2abd37d433ff8293efa5f406" [];
        "trough@^1.0.0" = s."trough@1.0.5";
        "tryer@1.0.1" = f "tryer" "1.0.1" y "f2c85406800b9b0f74c9f7465b81eaad241252f8" [];
        "tryer@^1.0.1" = s."tryer@1.0.1";
        "ts-dedent@2.2.0" = f "ts-dedent" "2.2.0" y "39e4bd297cd036292ae2394eb3412be63f563bb5" [];
        "ts-dedent@^2.0.0" = s."ts-dedent@2.2.0";
        "ts-easing@0.2.0" = f "ts-easing" "0.2.0" y "c8a8a35025105566588d87dbda05dd7fbfa5a4ec" [];
        "ts-easing@^0.2.0" = s."ts-easing@0.2.0";
        "ts-jest@27.1.5" = f "ts-jest" "27.1.5" y "0ddf1b163fbaae3d5b7504a1e65c914a95cff297" [
          (s."bs-logger@0.x")
          (s."fast-json-stable-stringify@2.x")
          (s."jest-util@^27.0.0")
          (s."json5@2.x")
          (s."lodash.memoize@4.x")
          (s."make-error@1.x")
          (s."semver@7.x")
          (s."yargs-parser@20.x")
          ];
        "ts-jest@^27.1.4" = s."ts-jest@27.1.5";
        "ts-loader@9.3.1" = f "ts-loader" "9.3.1" y "fe25cca56e3e71c1087fe48dc67f4df8c59b22d4" [
          (s."chalk@^4.1.0")
          (s."enhanced-resolve@^5.0.0")
          (s."micromatch@^4.0.0")
          (s."semver@^7.3.4")
          ];
        "ts-loader@^9.3.0" = s."ts-loader@9.3.1";
        "ts-node@10.9.1" = f "ts-node" "10.9.1" y "e73de9102958af9e1f0b168a6ff320e25adcff4b" [
          (s."@cspotcode/source-map-support@^0.8.0")
          (s."@tsconfig/node10@^1.0.7")
          (s."@tsconfig/node12@^1.0.7")
          (s."@tsconfig/node14@^1.0.0")
          (s."@tsconfig/node16@^1.0.2")
          (s."acorn@^8.4.1")
          (s."acorn-walk@^8.1.1")
          (s."arg@^4.1.0")
          (s."create-require@^1.1.0")
          (s."diff@^4.0.1")
          (s."make-error@^1.1.1")
          (s."v8-compile-cache-lib@^3.0.1")
          (s."yn@3.1.1")
          ];
        "ts-node@^10.9.1" = s."ts-node@10.9.1";
        "ts-pnp@1.2.0" = f "ts-pnp" "1.2.0" y "a500ad084b0798f1c3071af391e65912c86bca92" [];
        "ts-pnp@^1.1.6" = s."ts-pnp@1.2.0";
        "tsconfig-paths-webpack-plugin@4.0.0" = f "tsconfig-paths-webpack-plugin" "4.0.0" y "84008fc3e3e0658fdb0262758b07b4da6265ff1a" [
          (s."chalk@^4.1.0")
          (s."enhanced-resolve@^5.7.0")
          (s."tsconfig-paths@^4.0.0")
          ];
        "tsconfig-paths-webpack-plugin@^4.0.0" = s."tsconfig-paths-webpack-plugin@4.0.0";
        "tsconfig-paths@3.14.1" = f "tsconfig-paths" "3.14.1" y "ba0734599e8ea36c862798e920bcf163277b137a" [
          (s."@types/json5@^0.0.29")
          (s."json5@^1.0.1")
          (s."minimist@^1.2.6")
          (s."strip-bom@^3.0.0")
          ];
        "tsconfig-paths@4.0.0" = f "tsconfig-paths" "4.0.0" y "1082f5d99fd127b72397eef4809e4dd06d229b64" [
          (s."json5@^2.2.1")
          (s."minimist@^1.2.6")
          (s."strip-bom@^3.0.0")
          ];
        "tsconfig-paths@^3.14.1" = s."tsconfig-paths@3.14.1";
        "tsconfig-paths@^4.0.0" = s."tsconfig-paths@4.0.0";
        "tslib@1.14.1" = f "tslib" "1.14.1" y "cf2d38bdc34a134bcaf1091c41f6619e2f672d00" [];
        "tslib@2.4.0" = f "tslib" "2.4.0" y "7cecaa7f073ce680a05847aa77be941098f36dc3" [];
        "tslib@^1.0.0" = s."tslib@1.14.1";
        "tslib@^1.8.1" = s."tslib@1.14.1";
        "tslib@^2.0.0" = s."tslib@2.4.0";
        "tslib@^2.0.1" = s."tslib@2.4.0";
        "tslib@^2.0.3" = s."tslib@2.4.0";
        "tslib@^2.1.0" = s."tslib@2.4.0";
        "tslib@^2.3.1" = s."tslib@2.4.0";
        "tslib@^2.4.0" = s."tslib@2.4.0";
        "tslib@~2.4.0" = s."tslib@2.4.0";
        "tsutils@3.21.0" = f "tsutils" "3.21.0" y "b48717d394cea6c1e096983eed58e9d61715b623" [
          (s."tslib@^1.8.1")
          ];
        "tsutils@^3.21.0" = s."tsutils@3.21.0";
        "tty-browserify@0.0.0" = f "tty-browserify" "0.0.0" y "a157ba402da24e9bf957f9aa69d524eed42901a6" [];
        "tunnel@0.0.4" = f "tunnel" "0.0.4" y "2d3785a158c174c9a16dc2c046ec5fc5f1742213" [];
        "type-check@0.3.2" = f "type-check" "0.3.2" y "5884cab512cf1d355e3fb784f30804b2b520db72" [
          (s."prelude-ls@~1.1.2")
          ];
        "type-check@0.4.0" = f "type-check" "0.4.0" y "07b8203bfa7056c0657050e3ccd2c37730bab8f1" [
          (s."prelude-ls@^1.2.1")
          ];
        "type-check@^0.4.0" = s."type-check@0.4.0";
        "type-check@~0.3.2" = s."type-check@0.3.2";
        "type-check@~0.4.0" = s."type-check@0.4.0";
        "type-detect@4.0.8" = f "type-detect" "4.0.8" y "7646fb5f18871cfbb7749e69bd39a6388eb7450c" [];
        "type-fest@0.16.0" = f "type-fest" "0.16.0" y "3240b891a78b0deae910dbeb86553e552a148860" [];
        "type-fest@0.20.2" = f "type-fest" "0.20.2" y "1bf207f4b28f91583666cb5fbd327887301cd5f4" [];
        "type-fest@0.21.3" = f "type-fest" "0.21.3" y "d260a24b0198436e133fa26a524a6d65fa3b2e37" [];
        "type-fest@0.6.0" = f "type-fest" "0.6.0" y "8d2a2370d3df886eb5c90ada1c5bf6188acf838b" [];
        "type-fest@0.8.1" = f "type-fest" "0.8.1" y "09e249ebde851d3b1e48d27c105444667f17b83d" [];
        "type-fest@2.13.1" = f "type-fest" "2.13.1" y "621c84220df0e01a8469002594fc005714f0cfba" [];
        "type-fest@^0.16.0" = s."type-fest@0.16.0";
        "type-fest@^0.20.2" = s."type-fest@0.20.2";
        "type-fest@^0.21.3" = s."type-fest@0.21.3";
        "type-fest@^0.6.0" = s."type-fest@0.6.0";
        "type-fest@^0.8.0" = s."type-fest@0.8.1";
        "type-fest@^0.8.1" = s."type-fest@0.8.1";
        "type-fest@^2.5.0" = s."type-fest@2.13.1";
        "type-is@1.6.18" = f "type-is" "1.6.18" y "4e552cd05df09467dcbc4ef739de89f2cf37c131" [
          (s."media-typer@0.3.0")
          (s."mime-types@~2.1.24")
          ];
        "type-is@~1.6.18" = s."type-is@1.6.18";
        "typed-function@3.0.0" = f "typed-function" "3.0.0" y "42f75ffdd7dd63bf5dcc950847138f2bb65f1ad3" [];
        "typed-function@^3.0.0" = s."typed-function@3.0.0";
        "typed-rest-client@1.2.0" = f "typed-rest-client" "1.2.0" y "723085d203f38d7d147271e5ed3a75488eb44a02" [
          (s."tunnel@0.0.4")
          (s."underscore@1.8.3")
          ];
        "typedarray-to-buffer@3.1.5" = f "typedarray-to-buffer" "3.1.5" y "a97ee7a9ff42691b9f783ff1bc5112fe3fca9080" [
          (s."is-typedarray@^1.0.0")
          ];
        "typedarray-to-buffer@^3.1.5" = s."typedarray-to-buffer@3.1.5";
        "typedarray@0.0.6" = f "typedarray" "0.0.6" y "867ac74e3864187b1d3d47d996a78ec5c8830777" [];
        "typedarray@^0.0.6" = s."typedarray@0.0.6";
        "typescript@4.7.4" = f "typescript" "4.7.4" y "1a88596d1cf47d59507a1bcdfb5b9dfe4d488235" [];
        "typescript@^4.7.4" = s."typescript@4.7.4";
        "ua-parser-js@0.7.31" = f "ua-parser-js" "0.7.31" y "649a656b191dffab4f21d5e053e27ca17cbff5c6" [];
        "ua-parser-js@^0.7.30" = s."ua-parser-js@0.7.31";
        "uc.micro@1.0.6" = f "uc.micro" "1.0.6" y "9c411a802a409a91fc6cf74081baba34b24499ac" [];
        "uc.micro@^1.0.1" = s."uc.micro@1.0.6";
        "uc.micro@^1.0.5" = s."uc.micro@1.0.6";
        "uglify-js@3.16.1" = f "uglify-js" "3.16.1" y "0e7ec928b3d0b1e1d952bce634c384fd56377317" [];
        "uglify-js@^3.1.4" = s."uglify-js@3.16.1";
        "unbox-primitive@1.0.2" = f "unbox-primitive" "1.0.2" y "29032021057d5e6cdbd08c5129c226dff8ed6f9e" [
          (s."call-bind@^1.0.2")
          (s."has-bigints@^1.0.2")
          (s."has-symbols@^1.0.3")
          (s."which-boxed-primitive@^1.0.2")
          ];
        "unbox-primitive@^1.0.2" = s."unbox-primitive@1.0.2";
        "underscore@1.8.3" = f "underscore" "1.8.3" y "4f3fb53b106e6097fcf9cb4109f2a5e9bdfa5022" [];
        "unfetch@4.2.0" = f "unfetch" "4.2.0" y "7e21b0ef7d363d8d9af0fb929a5555f6ef97a3be" [];
        "unfetch@^4.2.0" = s."unfetch@4.2.0";
        "unherit@1.1.3" = f "unherit" "1.1.3" y "6c9b503f2b41b262330c80e91c8614abdaa69c22" [
          (s."inherits@^2.0.0")
          (s."xtend@^4.0.0")
          ];
        "unherit@^1.0.4" = s."unherit@1.1.3";
        "unicode-canonical-property-names-ecmascript@2.0.0" = f "unicode-canonical-property-names-ecmascript" "2.0.0" y "301acdc525631670d39f6146e0e77ff6bbdebddc" [];
        "unicode-canonical-property-names-ecmascript@^2.0.0" = s."unicode-canonical-property-names-ecmascript@2.0.0";
        "unicode-match-property-ecmascript@2.0.0" = f "unicode-match-property-ecmascript" "2.0.0" y "54fd16e0ecb167cf04cf1f756bdcc92eba7976c3" [
          (s."unicode-canonical-property-names-ecmascript@^2.0.0")
          (s."unicode-property-aliases-ecmascript@^2.0.0")
          ];
        "unicode-match-property-ecmascript@^2.0.0" = s."unicode-match-property-ecmascript@2.0.0";
        "unicode-match-property-value-ecmascript@2.0.0" = f "unicode-match-property-value-ecmascript" "2.0.0" y "1a01aa57247c14c568b89775a54938788189a714" [];
        "unicode-match-property-value-ecmascript@^2.0.0" = s."unicode-match-property-value-ecmascript@2.0.0";
        "unicode-property-aliases-ecmascript@2.0.0" = f "unicode-property-aliases-ecmascript" "2.0.0" y "0a36cb9a585c4f6abd51ad1deddb285c165297c8" [];
        "unicode-property-aliases-ecmascript@^2.0.0" = s."unicode-property-aliases-ecmascript@2.0.0";
        "unified@9.2.0" = f "unified" "9.2.0" y "67a62c627c40589edebbf60f53edfd4d822027f8" [
          (s."bail@^1.0.0")
          (s."extend@^3.0.0")
          (s."is-buffer@^2.0.0")
          (s."is-plain-obj@^2.0.0")
          (s."trough@^1.0.0")
          (s."vfile@^4.0.0")
          ];
        "unified@9.2.2" = f "unified" "9.2.2" y "67649a1abfc3ab85d2969502902775eb03146975" [
          (s."bail@^1.0.0")
          (s."extend@^3.0.0")
          (s."is-buffer@^2.0.0")
          (s."is-plain-obj@^2.0.0")
          (s."trough@^1.0.0")
          (s."vfile@^4.0.0")
          ];
        "unified@^9.0.0" = s."unified@9.2.2";
        "unified@^9.2.2" = s."unified@9.2.2";
        "union-value@1.0.1" = f "union-value" "1.0.1" y "0b6fe7b835aecda61c6ea4d4f02c14221e109847" [
          (s."arr-union@^3.1.0")
          (s."get-value@^2.0.6")
          (s."is-extendable@^0.1.1")
          (s."set-value@^2.0.1")
          ];
        "union-value@^1.0.0" = s."union-value@1.0.1";
        "unique-filename@1.1.1" = f "unique-filename" "1.1.1" y "1d69769369ada0583103a1e6ae87681b56573230" [
          (s."unique-slug@^2.0.0")
          ];
        "unique-filename@^1.1.1" = s."unique-filename@1.1.1";
        "unique-slug@2.0.2" = f "unique-slug" "2.0.2" y "baabce91083fc64e945b0f3ad613e264f7cd4e6c" [
          (s."imurmurhash@^0.1.4")
          ];
        "unique-slug@^2.0.0" = s."unique-slug@2.0.2";
        "unique-string@2.0.0" = f "unique-string" "2.0.0" y "39c6451f81afb2749de2b233e3f7c5e8843bd89d" [
          (s."crypto-random-string@^2.0.0")
          ];
        "unique-string@^2.0.0" = s."unique-string@2.0.0";
        "unist-builder@2.0.3" = f "unist-builder" "2.0.3" y "77648711b5d86af0942f334397a33c5e91516436" [];
        "unist-builder@^2.0.0" = s."unist-builder@2.0.3";
        "unist-util-find-after@3.0.0" = f "unist-util-find-after" "3.0.0" y "5c65fcebf64d4f8f496db46fa8fd0fbf354b43e6" [
          (s."unist-util-is@^4.0.0")
          ];
        "unist-util-find-after@^3.0.0" = s."unist-util-find-after@3.0.0";
        "unist-util-generated@1.1.6" = f "unist-util-generated" "1.1.6" y "5ab51f689e2992a472beb1b35f2ce7ff2f324d4b" [];
        "unist-util-generated@^1.0.0" = s."unist-util-generated@1.1.6";
        "unist-util-is@4.1.0" = f "unist-util-is" "4.1.0" y "976e5f462a7a5de73d94b706bac1b90671b57797" [];
        "unist-util-is@^4.0.0" = s."unist-util-is@4.1.0";
        "unist-util-position@3.1.0" = f "unist-util-position" "3.1.0" y "1c42ee6301f8d52f47d14f62bbdb796571fa2d47" [];
        "unist-util-position@^3.0.0" = s."unist-util-position@3.1.0";
        "unist-util-remove-position@2.0.1" = f "unist-util-remove-position" "2.0.1" y "5d19ca79fdba712301999b2b73553ca8f3b352cc" [
          (s."unist-util-visit@^2.0.0")
          ];
        "unist-util-remove-position@^2.0.0" = s."unist-util-remove-position@2.0.1";
        "unist-util-remove@2.1.0" = f "unist-util-remove" "2.1.0" y "b0b4738aa7ee445c402fda9328d604a02d010588" [
          (s."unist-util-is@^4.0.0")
          ];
        "unist-util-remove@^2.0.0" = s."unist-util-remove@2.1.0";
        "unist-util-stringify-position@2.0.3" = f "unist-util-stringify-position" "2.0.3" y "cce3bfa1cdf85ba7375d1d5b17bdc4cada9bd9da" [
          (s."@types/unist@^2.0.2")
          ];
        "unist-util-stringify-position@^2.0.0" = s."unist-util-stringify-position@2.0.3";
        "unist-util-visit-parents@3.1.1" = f "unist-util-visit-parents" "3.1.1" y "65a6ce698f78a6b0f56aa0e88f13801886cdaef6" [
          (s."@types/unist@^2.0.0")
          (s."unist-util-is@^4.0.0")
          ];
        "unist-util-visit-parents@^3.0.0" = s."unist-util-visit-parents@3.1.1";
        "unist-util-visit@2.0.3" = f "unist-util-visit" "2.0.3" y "c3703893146df47203bb8a9795af47d7b971208c" [
          (s."@types/unist@^2.0.0")
          (s."unist-util-is@^4.0.0")
          (s."unist-util-visit-parents@^3.0.0")
          ];
        "unist-util-visit@^2.0.0" = s."unist-util-visit@2.0.3";
        "unist-util-visit@^2.0.3" = s."unist-util-visit@2.0.3";
        "universalify@0.1.2" = f "universalify" "0.1.2" y "b646f69be3942dabcecc9d6639c80dc105efaa66" [];
        "universalify@2.0.0" = f "universalify" "2.0.0" y "75a4984efedc4b08975c5aeb73f530d02df25717" [];
        "universalify@^0.1.2" = s."universalify@0.1.2";
        "universalify@^2.0.0" = s."universalify@2.0.0";
        "unpipe@1.0.0" = f "unpipe" "1.0.0" y "b2bf4ee8514aae6165b4817829d21b2ef49904ec" [];
        "unpipe@~1.0.0" = s."unpipe@1.0.0";
        "unquote@1.1.1" = f "unquote" "1.1.1" y "8fded7324ec6e88a0ff8b905e7c098cdc086d544" [];
        "unquote@~1.1.1" = s."unquote@1.1.1";
        "unset-value@1.0.0" = f "unset-value" "1.0.0" y "8376873f7d2335179ffb1e6fc3a8ed0dfc8ab559" [
          (s."has-value@^0.3.1")
          (s."isobject@^3.0.0")
          ];
        "unset-value@^1.0.0" = s."unset-value@1.0.0";
        "untildify@2.1.0" = f "untildify" "2.1.0" y "17eb2807987f76952e9c0485fc311d06a826a2e0" [
          (s."os-homedir@^1.0.0")
          ];
        "untildify@^2.0.0" = s."untildify@2.1.0";
        "upath@1.2.0" = f "upath" "1.2.0" y "8f66dbcd55a883acdae4408af8b035a5044c1894" [];
        "upath@^1.1.1" = s."upath@1.2.0";
        "upath@^1.2.0" = s."upath@1.2.0";
        "update-browserslist-db@1.0.3" = f "update-browserslist-db" "1.0.3" y "6c47cb996f34afb363e924748e2f6e4d983c6fc1" [
          (s."escalade@^3.1.1")
          (s."picocolors@^1.0.0")
          ];
        "update-browserslist-db@^1.0.0" = s."update-browserslist-db@1.0.3";
        "update-notifier@5.1.0" = f "update-notifier" "5.1.0" y "4ab0d7c7f36a231dd7316cf7729313f0214d9ad9" [
          (s."boxen@^5.0.0")
          (s."chalk@^4.1.0")
          (s."configstore@^5.0.1")
          (s."has-yarn@^2.1.0")
          (s."import-lazy@^2.1.0")
          (s."is-ci@^2.0.0")
          (s."is-installed-globally@^0.4.0")
          (s."is-npm@^5.0.0")
          (s."is-yarn-global@^0.3.0")
          (s."latest-version@^5.1.0")
          (s."pupa@^2.1.1")
          (s."semver@^7.3.4")
          (s."semver-diff@^3.1.1")
          (s."xdg-basedir@^4.0.0")
          ];
        "update-notifier@^5.1.0" = s."update-notifier@5.1.0";
        "uri-js@4.4.1" = f "uri-js" "4.4.1" y "9b1a52595225859e55f669d928f88c6c57f2a77e" [
          (s."punycode@^2.1.0")
          ];
        "uri-js@^4.2.2" = s."uri-js@4.4.1";
        "urix@0.1.0" = f "urix" "0.1.0" y "da937f7a62e21fec1fd18d49b35c2935067a6c72" [];
        "urix@^0.1.0" = s."urix@0.1.0";
        "url-join@1.1.0" = f "url-join" "1.1.0" y "741c6c2f4596c4830d6718460920d0c92202dc78" [];
        "url-join@^1.1.0" = s."url-join@1.1.0";
        "url-loader@4.1.1" = f "url-loader" "4.1.1" y "28505e905cae158cf07c92ca622d7f237e70a4e2" [
          (s."loader-utils@^2.0.0")
          (s."mime-types@^2.1.27")
          (s."schema-utils@^3.0.0")
          ];
        "url-loader@^4.1.1" = s."url-loader@4.1.1";
        "url-parse-lax@3.0.0" = f "url-parse-lax" "3.0.0" y "16b5cafc07dbe3676c1b1999177823d6503acb0c" [
          (s."prepend-http@^2.0.0")
          ];
        "url-parse-lax@^3.0.0" = s."url-parse-lax@3.0.0";
        "url@0.11.0" = f "url" "0.11.0" y "3838e97cfc60521eb73c525a8e55bfdd9e2e28f1" [
          (s."punycode@1.3.2")
          (s."querystring@0.2.0")
          ];
        "url@^0.11.0" = s."url@0.11.0";
        "urlgrey@1.0.0" = f "urlgrey" "1.0.0" y "72d2f904482d0b602e3c7fa599343d699bbe1017" [
          (s."fast-url-parser@^1.1.3")
          ];
        "use-composed-ref@1.3.0" = f "use-composed-ref" "1.3.0" y "3d8104db34b7b264030a9d916c5e94fbe280dbda" [];
        "use-composed-ref@^1.3.0" = s."use-composed-ref@1.3.0";
        "use-isomorphic-layout-effect@1.1.2" = f "use-isomorphic-layout-effect" "1.1.2" y "497cefb13d863d687b08477d9e5a164ad8c1a6fb" [];
        "use-isomorphic-layout-effect@^1.1.1" = s."use-isomorphic-layout-effect@1.1.2";
        "use-latest@1.2.1" = f "use-latest" "1.2.1" y "d13dfb4b08c28e3e33991546a2cee53e14038cf2" [
          (s."use-isomorphic-layout-effect@^1.1.1")
          ];
        "use-latest@^1.2.1" = s."use-latest@1.2.1";
        "use@3.1.1" = f "use" "3.1.1" y "d50c8cac79a19fbc20f2911f56eb973f4e10070f" [];
        "use@^3.1.0" = s."use@3.1.1";
        "util-deprecate@1.0.2" = f "util-deprecate" "1.0.2" y "450d4dc9fa70de732762fbd2d4a28981419a0ccf" [];
        "util-deprecate@^1.0.1" = s."util-deprecate@1.0.2";
        "util-deprecate@^1.0.2" = s."util-deprecate@1.0.2";
        "util-deprecate@~1.0.1" = s."util-deprecate@1.0.2";
        "util.promisify@1.0.0" = f "util.promisify" "1.0.0" y "440f7165a459c9a16dc145eb8e72f35687097030" [
          (s."define-properties@^1.1.2")
          (s."object.getownpropertydescriptors@^2.0.3")
          ];
        "util.promisify@1.0.1" = f "util.promisify" "1.0.1" y "6baf7774b80eeb0f7520d8b81d07982a59abbaee" [
          (s."define-properties@^1.1.3")
          (s."es-abstract@^1.17.2")
          (s."has-symbols@^1.0.1")
          (s."object.getownpropertydescriptors@^2.1.0")
          ];
        "util.promisify@~1.0.0" = s."util.promisify@1.0.1";
        "util@0.10.3" = f "util" "0.10.3" y "7afb1afe50805246489e3db7fe0ed379336ac0f9" [
          (s."inherits@2.0.1")
          ];
        "util@0.11.1" = f "util" "0.11.1" y "3236733720ec64bb27f6e26f421aaa2e1b588d61" [
          (s."inherits@2.0.3")
          ];
        "util@^0.11.0" = s."util@0.11.1";
        "utila@0.4.0" = f "utila" "0.4.0" y "8a16a05d445657a3aea5eecc5b12a4fa5379772c" [];
        "utila@~0.4" = s."utila@0.4.0";
        "utility-types@3.10.0" = f "utility-types" "3.10.0" y "ea4148f9a741015f05ed74fd615e1d20e6bed82b" [];
        "utility-types@^3.10.0" = s."utility-types@3.10.0";
        "utils-merge@1.0.1" = f "utils-merge" "1.0.1" y "9f95710f50a267947b2ccc124741c1028427e713" [];
        "uuid-browser@3.1.0" = f "uuid-browser" "3.1.0" y "0f05a40aef74f9e5951e20efbf44b11871e56410" [];
        "uuid-browser@^3.1.0" = s."uuid-browser@3.1.0";
        "uuid@3.4.0" = f "uuid" "3.4.0" y "b23e4358afa8a202fe7a100af1f5f883f02007ee" [];
        "uuid@8.3.2" = f "uuid" "8.3.2" y "80d5b5ced271bb9af6c445f21a1a04c606cefbe2" [];
        "uuid@^3.3.2" = s."uuid@3.4.0";
        "uuid@^8.0.0" = s."uuid@8.3.2";
        "uuid@^8.3.2" = s."uuid@8.3.2";
        "v8-compile-cache-lib@3.0.1" = f "v8-compile-cache-lib" "3.0.1" y "6336e8d71965cb3d35a1bbb7868445a7c05264bf" [];
        "v8-compile-cache-lib@^3.0.1" = s."v8-compile-cache-lib@3.0.1";
        "v8-compile-cache@2.3.0" = f "v8-compile-cache" "2.3.0" y "2de19618c66dc247dcfb6f99338035d8245a2cee" [];
        "v8-compile-cache@^2.0.3" = s."v8-compile-cache@2.3.0";
        "v8-to-istanbul@8.1.1" = f "v8-to-istanbul" "8.1.1" y "77b752fd3975e31bbcef938f85e9bd1c7a8d60ed" [
          (s."@types/istanbul-lib-coverage@^2.0.1")
          (s."convert-source-map@^1.6.0")
          (s."source-map@^0.7.3")
          ];
        "v8-to-istanbul@9.0.1" = f "v8-to-istanbul" "9.0.1" y "b6f994b0b5d4ef255e17a0d17dc444a9f5132fa4" [
          (s."@jridgewell/trace-mapping@^0.3.12")
          (s."@types/istanbul-lib-coverage@^2.0.1")
          (s."convert-source-map@^1.6.0")
          ];
        "v8-to-istanbul@^8.1.0" = s."v8-to-istanbul@8.1.1";
        "v8-to-istanbul@^9.0.0" = s."v8-to-istanbul@9.0.1";
        "validate-npm-package-license@3.0.4" = f "validate-npm-package-license" "3.0.4" y "fc91f6b9c7ba15c857f4cb2c5defeec39d4f410a" [
          (s."spdx-correct@^3.0.0")
          (s."spdx-expression-parse@^3.0.0")
          ];
        "validate-npm-package-license@^3.0.1" = s."validate-npm-package-license@3.0.4";
        "value-equal@1.0.1" = f "value-equal" "1.0.1" y "1e0b794c734c5c0cade179c437d356d931a34d6c" [];
        "value-equal@^1.0.1" = s."value-equal@1.0.1";
        "vary@1.1.2" = f "vary" "1.1.2" y "2299f02c6ded30d4a5961b0b9f74524a18f634fc" [];
        "vary@~1.1.2" = s."vary@1.1.2";
        "vega-canvas@1.2.6" = f "vega-canvas" "1.2.6" y "55e032ce9a62acd17229f6bac66d99db3d6879cd" [];
        "vega-canvas@^1.2.5" = s."vega-canvas@1.2.6";
        "vega-canvas@^1.2.6" = s."vega-canvas@1.2.6";
        "vega-crossfilter@4.1.0" = f "vega-crossfilter" "4.1.0" y "b6c5a728ce987f2514074adb22cf86b9bc63e0c8" [
          (s."d3-array@^3.1.1")
          (s."vega-dataflow@^5.7.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-crossfilter@~4.1.0" = s."vega-crossfilter@4.1.0";
        "vega-dataflow@5.7.4" = f "vega-dataflow" "5.7.4" y "7cafc0a41b9d0b11dd2e34a513f8b7ca345dfd74" [
          (s."vega-format@^1.0.4")
          (s."vega-loader@^4.3.2")
          (s."vega-util@^1.16.1")
          ];
        "vega-dataflow@^5.7.3" = s."vega-dataflow@5.7.4";
        "vega-dataflow@^5.7.4" = s."vega-dataflow@5.7.4";
        "vega-dataflow@~5.7.4" = s."vega-dataflow@5.7.4";
        "vega-embed@6.21.0" = f "vega-embed" "6.21.0" y "a6f7d4965c653e40620bfd0a51fb419321cff02c" [
          (s."fast-json-patch@^3.1.1")
          (s."json-stringify-pretty-compact@^3.0.0")
          (s."semver@^7.3.7")
          (s."tslib@^2.4.0")
          (s."vega-interpreter@^1.0.4")
          (s."vega-schema-url-parser@^2.2.0")
          (s."vega-themes@^2.10.0")
          (s."vega-tooltip@^0.28.0")
          ];
        "vega-embed@^6.21.0" = s."vega-embed@6.21.0";
        "vega-embed@^6.5.1" = s."vega-embed@6.21.0";
        "vega-encode@4.9.0" = f "vega-encode" "4.9.0" y "3dd1031056bb8029f262afc4b4d58372c8f073a6" [
          (s."d3-array@^3.1.1")
          (s."d3-interpolate@^3.0.1")
          (s."vega-dataflow@^5.7.3")
          (s."vega-scale@^7.0.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-encode@~4.9.0" = s."vega-encode@4.9.0";
        "vega-event-selector@3.0.0" = f "vega-event-selector" "3.0.0" y "7b855ac0c3ddb59bc5b5caa0d96dbbc9fbd33a4c" [];
        "vega-event-selector@^3.0.0" = s."vega-event-selector@3.0.0";
        "vega-event-selector@~3.0.0" = s."vega-event-selector@3.0.0";
        "vega-expression@5.0.0" = f "vega-expression" "5.0.0" y "938f26689693a1e0d26716030cdaed43ca7abdfb" [
          (s."@types/estree@^0.0.50")
          (s."vega-util@^1.16.0")
          ];
        "vega-expression@^5.0.0" = s."vega-expression@5.0.0";
        "vega-expression@~5.0.0" = s."vega-expression@5.0.0";
        "vega-force@4.1.0" = f "vega-force" "4.1.0" y "cc8dea972baa52adc60840ff744ebb9e57d8f1f5" [
          (s."d3-force@^3.0.0")
          (s."vega-dataflow@^5.7.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-force@~4.1.0" = s."vega-force@4.1.0";
        "vega-format@1.1.0" = f "vega-format" "1.1.0" y "b9d81cf1bcf222ae5cbd94357ae70245d2c7b18d" [
          (s."d3-array@^3.1.1")
          (s."d3-format@^3.1.0")
          (s."d3-time-format@^4.1.0")
          (s."vega-time@^2.0.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-format@^1.0.4" = s."vega-format@1.1.0";
        "vega-format@^1.1.0" = s."vega-format@1.1.0";
        "vega-format@~1.1.0" = s."vega-format@1.1.0";
        "vega-functions@5.13.0" = f "vega-functions" "5.13.0" y "c9ab8c6eedbf39f75b424cca6776b1d0b8c74b32" [
          (s."d3-array@^3.1.1")
          (s."d3-color@^3.0.1")
          (s."d3-geo@^3.0.1")
          (s."vega-dataflow@^5.7.3")
          (s."vega-expression@^5.0.0")
          (s."vega-scale@^7.2.0")
          (s."vega-scenegraph@^4.9.3")
          (s."vega-selections@^5.3.1")
          (s."vega-statistics@^1.7.9")
          (s."vega-time@^2.1.0")
          (s."vega-util@^1.16.0")
          ];
        "vega-functions@^5.12.1" = s."vega-functions@5.13.0";
        "vega-functions@^5.13.0" = s."vega-functions@5.13.0";
        "vega-functions@~5.13.0" = s."vega-functions@5.13.0";
        "vega-geo@4.4.0" = f "vega-geo" "4.4.0" y "ce792df57f8ca4c54a7a1a29467cfa24bc53f573" [
          (s."d3-array@^3.1.1")
          (s."d3-color@^3.0.1")
          (s."d3-geo@^3.0.1")
          (s."vega-canvas@^1.2.5")
          (s."vega-dataflow@^5.7.3")
          (s."vega-projection@^1.4.5")
          (s."vega-statistics@^1.7.9")
          (s."vega-util@^1.15.2")
          ];
        "vega-geo@~4.4.0" = s."vega-geo@4.4.0";
        "vega-hierarchy@4.1.0" = f "vega-hierarchy" "4.1.0" y "605edbe3a6232853f9e8b57e3b905471d33b1a48" [
          (s."d3-hierarchy@^3.1.0")
          (s."vega-dataflow@^5.7.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-hierarchy@~4.1.0" = s."vega-hierarchy@4.1.0";
        "vega-interpreter@1.0.4" = f "vega-interpreter" "1.0.4" y "291ebf85bc2d1c3550a3da22ff75b3ba0d326a39" [];
        "vega-interpreter@^1.0.4" = s."vega-interpreter@1.0.4";
        "vega-label@1.2.0" = f "vega-label" "1.2.0" y "bcb2659aec54f890f9debab3e41ab87a58292dce" [
          (s."vega-canvas@^1.2.6")
          (s."vega-dataflow@^5.7.3")
          (s."vega-scenegraph@^4.9.2")
          (s."vega-util@^1.15.2")
          ];
        "vega-label@~1.2.0" = s."vega-label@1.2.0";
        "vega-lite@5.4.0" = f "vega-lite" "5.4.0" y "d09331e2a1c87843d5865de0fa7704919796ab56" [
          (s."@types/clone@~2.1.1")
          (s."array-flat-polyfill@^1.0.1")
          (s."clone@~2.1.2")
          (s."fast-deep-equal@~3.1.3")
          (s."fast-json-stable-stringify@~2.1.0")
          (s."json-stringify-pretty-compact@~3.0.0")
          (s."tslib@~2.4.0")
          (s."vega-event-selector@~3.0.0")
          (s."vega-expression@~5.0.0")
          (s."vega-util@~1.17.0")
          (s."yargs@~17.5.1")
          ];
        "vega-lite@^5.4.0" = s."vega-lite@5.4.0";
        "vega-loader@4.5.0" = f "vega-loader" "4.5.0" y "b15acc4c8f84191f500e94d35ddfb9721ac943ad" [
          (s."d3-dsv@^3.0.1")
          (s."node-fetch@^2.6.7")
          (s."topojson-client@^3.1.0")
          (s."vega-format@^1.1.0")
          (s."vega-util@^1.16.0")
          ];
        "vega-loader@^4.3.2" = s."vega-loader@4.5.0";
        "vega-loader@^4.4.0" = s."vega-loader@4.5.0";
        "vega-loader@~4.5.0" = s."vega-loader@4.5.0";
        "vega-parser@6.1.4" = f "vega-parser" "6.1.4" y "4868e41af2c9645b6d7daeeb205cfad06b9d465c" [
          (s."vega-dataflow@^5.7.3")
          (s."vega-event-selector@^3.0.0")
          (s."vega-functions@^5.12.1")
          (s."vega-scale@^7.1.1")
          (s."vega-util@^1.16.0")
          ];
        "vega-parser@~6.1.4" = s."vega-parser@6.1.4";
        "vega-projection@1.5.0" = f "vega-projection" "1.5.0" y "51c5f0455170cd35b3c5f3e653e99c3616520640" [
          (s."d3-geo@^3.0.1")
          (s."d3-geo-projection@^4.0.0")
          ];
        "vega-projection@^1.4.5" = s."vega-projection@1.5.0";
        "vega-projection@~1.5.0" = s."vega-projection@1.5.0";
        "vega-regression@1.1.0" = f "vega-regression" "1.1.0" y "b4394db403ada93de52bb4536d04be336c983a8c" [
          (s."d3-array@^3.1.1")
          (s."vega-dataflow@^5.7.3")
          (s."vega-statistics@^1.7.9")
          (s."vega-util@^1.15.2")
          ];
        "vega-regression@~1.1.0" = s."vega-regression@1.1.0";
        "vega-runtime@6.1.3" = f "vega-runtime" "6.1.3" y "01e18246f7a80cee034a96017ac30113b92c4034" [
          (s."vega-dataflow@^5.7.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-runtime@^6.1.3" = s."vega-runtime@6.1.3";
        "vega-runtime@~6.1.3" = s."vega-runtime@6.1.3";
        "vega-scale@7.2.0" = f "vega-scale" "7.2.0" y "9e298cc02ad340498cb56847436b19439911f0fc" [
          (s."d3-array@^3.1.1")
          (s."d3-interpolate@^3.0.1")
          (s."d3-scale@^4.0.2")
          (s."vega-time@^2.1.0")
          (s."vega-util@^1.17.0")
          ];
        "vega-scale@^7.0.3" = s."vega-scale@7.2.0";
        "vega-scale@^7.1.1" = s."vega-scale@7.2.0";
        "vega-scale@^7.2.0" = s."vega-scale@7.2.0";
        "vega-scale@~7.2.0" = s."vega-scale@7.2.0";
        "vega-scenegraph@4.10.1" = f "vega-scenegraph" "4.10.1" y "944da67b8a28758fab2e1306259fb7ff6be89f6b" [
          (s."d3-path@^3.0.1")
          (s."d3-shape@^3.1.0")
          (s."vega-canvas@^1.2.5")
          (s."vega-loader@^4.4.0")
          (s."vega-scale@^7.2.0")
          (s."vega-util@^1.15.2")
          ];
        "vega-scenegraph@^4.10.0" = s."vega-scenegraph@4.10.1";
        "vega-scenegraph@^4.9.2" = s."vega-scenegraph@4.10.1";
        "vega-scenegraph@^4.9.3" = s."vega-scenegraph@4.10.1";
        "vega-scenegraph@~4.10.1" = s."vega-scenegraph@4.10.1";
        "vega-schema-url-parser@2.2.0" = f "vega-schema-url-parser" "2.2.0" y "a0d1e02915adfbfcb1fd517c8c2ebe2419985c1e" [];
        "vega-schema-url-parser@^2.2.0" = s."vega-schema-url-parser@2.2.0";
        "vega-selections@5.4.0" = f "vega-selections" "5.4.0" y "c2783897421fa39b674c015fa8f15a0023b8054e" [
          (s."d3-array@3.1.1")
          (s."vega-expression@^5.0.0")
          (s."vega-util@^1.16.0")
          ];
        "vega-selections@^5.3.1" = s."vega-selections@5.4.0";
        "vega-statistics@1.8.0" = f "vega-statistics" "1.8.0" y "ad66f7461473d58bc96671588981a059ffd60b59" [
          (s."d3-array@^3.1.1")
          ];
        "vega-statistics@^1.7.9" = s."vega-statistics@1.8.0";
        "vega-statistics@^1.8.0" = s."vega-statistics@1.8.0";
        "vega-statistics@~1.8.0" = s."vega-statistics@1.8.0";
        "vega-themes@2.10.0" = f "vega-themes" "2.10.0" y "82768b14686e3fbfbdab0e77cb63e12c62b4911e" [];
        "vega-themes@^2.10.0" = s."vega-themes@2.10.0";
        "vega-time@2.1.0" = f "vega-time" "2.1.0" y "acfbab88d7798b87ff63913b0dce2ca5eb0d46ca" [
          (s."d3-array@^3.1.1")
          (s."d3-time@^3.0.0")
          (s."vega-util@^1.15.2")
          ];
        "vega-time@^2.0.3" = s."vega-time@2.1.0";
        "vega-time@^2.1.0" = s."vega-time@2.1.0";
        "vega-time@~2.1.0" = s."vega-time@2.1.0";
        "vega-tooltip@0.28.0" = f "vega-tooltip" "0.28.0" y "8bae2601ffae5e67622de37108f53f284e9a978b" [
          (s."vega-util@^1.17.0")
          ];
        "vega-tooltip@^0.28.0" = s."vega-tooltip@0.28.0";
        "vega-transforms@4.10.0" = f "vega-transforms" "4.10.0" y "a1017ede13cf4e25499f588610a3be4da615d82d" [
          (s."d3-array@^3.1.1")
          (s."vega-dataflow@^5.7.4")
          (s."vega-statistics@^1.8.0")
          (s."vega-time@^2.1.0")
          (s."vega-util@^1.16.1")
          ];
        "vega-transforms@~4.10.0" = s."vega-transforms@4.10.0";
        "vega-typings@0.22.3" = f "vega-typings" "0.22.3" y "f6c73b5ffcdb152539cfcc5ad240a413af579ba7" [
          (s."vega-event-selector@^3.0.0")
          (s."vega-expression@^5.0.0")
          (s."vega-util@^1.15.2")
          ];
        "vega-typings@~0.22.0" = s."vega-typings@0.22.3";
        "vega-util@1.17.0" = f "vega-util" "1.17.0" y "b72ae0baa97f943bf591f8f5bb27ceadf06834ac" [];
        "vega-util@^1.15.2" = s."vega-util@1.17.0";
        "vega-util@^1.16.0" = s."vega-util@1.17.0";
        "vega-util@^1.16.1" = s."vega-util@1.17.0";
        "vega-util@^1.17.0" = s."vega-util@1.17.0";
        "vega-util@~1.17.0" = s."vega-util@1.17.0";
        "vega-view-transforms@4.5.8" = f "vega-view-transforms" "4.5.8" y "c8dc42c3c7d4aa725d40b8775180c9f23bc98f4e" [
          (s."vega-dataflow@^5.7.3")
          (s."vega-scenegraph@^4.9.2")
          (s."vega-util@^1.15.2")
          ];
        "vega-view-transforms@~4.5.8" = s."vega-view-transforms@4.5.8";
        "vega-view@5.11.0" = f "vega-view" "5.11.0" y "8a7b29a36776e43cc6599e087ed7f48a918b805d" [
          (s."d3-array@^3.1.1")
          (s."d3-timer@^3.0.1")
          (s."vega-dataflow@^5.7.3")
          (s."vega-format@^1.1.0")
          (s."vega-functions@^5.13.0")
          (s."vega-runtime@^6.1.3")
          (s."vega-scenegraph@^4.10.0")
          (s."vega-util@^1.16.1")
          ];
        "vega-view@~5.11.0" = s."vega-view@5.11.0";
        "vega-voronoi@4.2.0" = f "vega-voronoi" "4.2.0" y "14c74c84f52d9a16be2facd1bede879d32d988f2" [
          (s."d3-delaunay@^6.0.2")
          (s."vega-dataflow@^5.7.3")
          (s."vega-util@^1.15.2")
          ];
        "vega-voronoi@~4.2.0" = s."vega-voronoi@4.2.0";
        "vega-wordcloud@4.1.3" = f "vega-wordcloud" "4.1.3" y "ce90900333f4e0d3ee706ba4f36bb0905f8b4a9f" [
          (s."vega-canvas@^1.2.5")
          (s."vega-dataflow@^5.7.3")
          (s."vega-scale@^7.1.1")
          (s."vega-statistics@^1.7.9")
          (s."vega-util@^1.15.2")
          ];
        "vega-wordcloud@~4.1.3" = s."vega-wordcloud@4.1.3";
        "vega@5.22.1" = f "vega" "5.22.1" y "e028f3645de18e0070317bc04410282975549e1e" [
          (s."vega-crossfilter@~4.1.0")
          (s."vega-dataflow@~5.7.4")
          (s."vega-encode@~4.9.0")
          (s."vega-event-selector@~3.0.0")
          (s."vega-expression@~5.0.0")
          (s."vega-force@~4.1.0")
          (s."vega-format@~1.1.0")
          (s."vega-functions@~5.13.0")
          (s."vega-geo@~4.4.0")
          (s."vega-hierarchy@~4.1.0")
          (s."vega-label@~1.2.0")
          (s."vega-loader@~4.5.0")
          (s."vega-parser@~6.1.4")
          (s."vega-projection@~1.5.0")
          (s."vega-regression@~1.1.0")
          (s."vega-runtime@~6.1.3")
          (s."vega-scale@~7.2.0")
          (s."vega-scenegraph@~4.10.1")
          (s."vega-statistics@~1.8.0")
          (s."vega-time@~2.1.0")
          (s."vega-transforms@~4.10.0")
          (s."vega-typings@~0.22.0")
          (s."vega-util@~1.17.0")
          (s."vega-view@~5.11.0")
          (s."vega-view-transforms@~4.5.8")
          (s."vega-voronoi@~4.2.0")
          (s."vega-wordcloud@~4.1.3")
          ];
        "vega@^5.22.1" = s."vega@5.22.1";
        "vfile-location@3.2.0" = f "vfile-location" "3.2.0" y "d8e41fbcbd406063669ebf6c33d56ae8721d0f3c" [];
        "vfile-location@^3.0.0" = s."vfile-location@3.2.0";
        "vfile-location@^3.2.0" = s."vfile-location@3.2.0";
        "vfile-message@2.0.4" = f "vfile-message" "2.0.4" y "5b43b88171d409eae58477d13f23dd41d52c371a" [
          (s."@types/unist@^2.0.0")
          (s."unist-util-stringify-position@^2.0.0")
          ];
        "vfile-message@^2.0.0" = s."vfile-message@2.0.4";
        "vfile@4.2.1" = f "vfile" "4.2.1" y "03f1dce28fc625c625bc6514350fbdb00fa9e624" [
          (s."@types/unist@^2.0.0")
          (s."is-buffer@^2.0.0")
          (s."unist-util-stringify-position@^2.0.0")
          (s."vfile-message@^2.0.0")
          ];
        "vfile@^4.0.0" = s."vfile@4.2.1";
        "vm-browserify@1.1.2" = f "vm-browserify" "1.1.2" y "78641c488b8e6ca91a75f511e7a3b32a86e5dda0" [];
        "vm-browserify@^1.0.1" = s."vm-browserify@1.1.2";
        "vsce-yarn-patch@1.66.2" = f "vsce-yarn-patch" "1.66.2" y "b217a9d73ee715ad41ec44393a5d78ed0955ab44" [
          (s."azure-devops-node-api@^7.2.0")
          (s."chalk@^2.4.2")
          (s."cheerio@^1.0.0-rc.1")
          (s."commander@^2.8.1")
          (s."denodeify@^1.2.1")
          (s."didyoumean@^1.2.1")
          (s."glob@^7.0.6")
          (s."lodash@^4.17.10")
          (s."markdown-it@^8.3.1")
          (s."mime@^1.3.4")
          (s."minimatch@^3.0.3")
          (s."osenv@^0.1.3")
          (s."parse-semver@^1.1.1")
          (s."read@^1.0.7")
          (s."semver@^5.1.0")
          (s."tmp@0.0.29")
          (s."typed-rest-client@1.2.0")
          (s."url-join@^1.1.0")
          (s."yauzl@^2.3.1")
          (s."yazl@^2.2.2")
          ];
        "vsce-yarn-patch@^1.66.2" = s."vsce-yarn-patch@1.66.2";
        "vscode-jsonrpc@8.0.2" = f "vscode-jsonrpc" "8.0.2" y "f239ed2cd6004021b6550af9fd9d3e47eee3cac9" [];
        "vscode-languageclient@8.0.2" = f "vscode-languageclient" "8.0.2" y "f1f23ce8c8484aa11e4b7dfb24437d3e59bb61c6" [
          (s."minimatch@^3.0.4")
          (s."semver@^7.3.5")
          (s."vscode-languageserver-protocol@3.17.2")
          ];
        "vscode-languageclient@^8.0.2" = s."vscode-languageclient@8.0.2";
        "vscode-languageserver-protocol@3.17.2" = f "vscode-languageserver-protocol" "3.17.2" y "beaa46aea06ed061576586c5e11368a9afc1d378" [
          (s."vscode-jsonrpc@8.0.2")
          (s."vscode-languageserver-types@3.17.2")
          ];
        "vscode-languageserver-textdocument@1.0.5" = f "vscode-languageserver-textdocument" "1.0.5" y "838769940ece626176ec5d5a2aa2d0aa69f5095c" [];
        "vscode-languageserver-textdocument@^1.0.5" = s."vscode-languageserver-textdocument@1.0.5";
        "vscode-languageserver-types@3.17.2" = f "vscode-languageserver-types" "3.17.2" y "b2c2e7de405ad3d73a883e91989b850170ffc4f2" [];
        "vscode-languageserver@8.0.2" = f "vscode-languageserver" "8.0.2" y "cfe2f0996d9dfd40d3854e786b2821604dfec06d" [
          (s."vscode-languageserver-protocol@3.17.2")
          ];
        "vscode-languageserver@^8.0.2" = s."vscode-languageserver@8.0.2";
        "vscode-uri@3.0.3" = f "vscode-uri" "3.0.3" y "a95c1ce2e6f41b7549f86279d19f47951e4f4d84" [];
        "vscode-uri@^3.0.3" = s."vscode-uri@3.0.3";
        "w3c-hr-time@1.0.2" = f "w3c-hr-time" "1.0.2" y "0a89cdf5cc15822df9c360543676963e0cc308cd" [
          (s."browser-process-hrtime@^1.0.0")
          ];
        "w3c-hr-time@^1.0.2" = s."w3c-hr-time@1.0.2";
        "w3c-xmlserializer@2.0.0" = f "w3c-xmlserializer" "2.0.0" y "3e7104a05b75146cc60f564380b7f683acf1020a" [
          (s."xml-name-validator@^3.0.0")
          ];
        "w3c-xmlserializer@^2.0.0" = s."w3c-xmlserializer@2.0.0";
        "wait-on@6.0.1" = f "wait-on" "6.0.1" y "16bbc4d1e4ebdd41c5b4e63a2e16dbd1f4e5601e" [
          (s."axios@^0.25.0")
          (s."joi@^17.6.0")
          (s."lodash@^4.17.21")
          (s."minimist@^1.2.5")
          (s."rxjs@^7.5.4")
          ];
        "wait-on@^6.0.1" = s."wait-on@6.0.1";
        "walker@1.0.8" = f "walker" "1.0.8" y "bd498db477afe573dc04185f011d3ab8a8d7653f" [
          (s."makeerror@1.0.12")
          ];
        "walker@^1.0.7" = s."walker@1.0.8";
        "walker@~1.0.5" = s."walker@1.0.8";
        "watchpack-chokidar2@2.0.1" = f "watchpack-chokidar2" "2.0.1" y "38500072ee6ece66f3769936950ea1771be1c957" [
          (s."chokidar@^2.1.8")
          ];
        "watchpack-chokidar2@^2.0.1" = s."watchpack-chokidar2@2.0.1";
        "watchpack@1.7.5" = f "watchpack" "1.7.5" y "1267e6c55e0b9b5be44c2023aed5437a2c26c453" [
          (s."graceful-fs@^4.1.2")
          (s."neo-async@^2.5.0")
          (s."chokidar@^3.4.1")
          (s."watchpack-chokidar2@^2.0.1")
          ];
        "watchpack@2.4.0" = f "watchpack" "2.4.0" y "fa33032374962c78113f93c7f2fb4c54c9862a5d" [
          (s."glob-to-regexp@^0.4.1")
          (s."graceful-fs@^4.1.2")
          ];
        "watchpack@^1.7.4" = s."watchpack@1.7.5";
        "watchpack@^2.2.0" = s."watchpack@2.4.0";
        "watchpack@^2.4.0" = s."watchpack@2.4.0";
        "wbuf@1.7.3" = f "wbuf" "1.7.3" y "c1d8d149316d3ea852848895cb6a0bfe887b87df" [
          (s."minimalistic-assert@^1.0.0")
          ];
        "wbuf@^1.1.0" = s."wbuf@1.7.3";
        "wbuf@^1.7.3" = s."wbuf@1.7.3";
        "web-namespaces@1.1.4" = f "web-namespaces" "1.1.4" y "bc98a3de60dadd7faefc403d1076d529f5e030ec" [];
        "web-namespaces@^1.0.0" = s."web-namespaces@1.1.4";
        "web-vitals@2.1.4" = f "web-vitals" "2.1.4" y "76563175a475a5e835264d373704f9dde718290c" [];
        "web-vitals@^2.1.4" = s."web-vitals@2.1.4";
        "webidl-conversions@3.0.1" = f "webidl-conversions" "3.0.1" y "24534275e2a7bc6be7bc86611cc16ae0a5654871" [];
        "webidl-conversions@4.0.2" = f "webidl-conversions" "4.0.2" y "a855980b1f0b6b359ba1d5d9fb39ae941faa63ad" [];
        "webidl-conversions@5.0.0" = f "webidl-conversions" "5.0.0" y "ae59c8a00b121543a2acc65c0434f57b0fc11aff" [];
        "webidl-conversions@6.1.0" = f "webidl-conversions" "6.1.0" y "9111b4d7ea80acd40f5270d666621afa78b69514" [];
        "webidl-conversions@^3.0.0" = s."webidl-conversions@3.0.1";
        "webidl-conversions@^4.0.2" = s."webidl-conversions@4.0.2";
        "webidl-conversions@^5.0.0" = s."webidl-conversions@5.0.0";
        "webidl-conversions@^6.1.0" = s."webidl-conversions@6.1.0";
        "webpack-bundle-analyzer@4.5.0" = f "webpack-bundle-analyzer" "4.5.0" y "1b0eea2947e73528754a6f9af3e91b2b6e0f79d5" [
          (s."acorn@^8.0.4")
          (s."acorn-walk@^8.0.0")
          (s."chalk@^4.1.0")
          (s."commander@^7.2.0")
          (s."gzip-size@^6.0.0")
          (s."lodash@^4.17.20")
          (s."opener@^1.5.2")
          (s."sirv@^1.0.7")
          (s."ws@^7.3.1")
          ];
        "webpack-bundle-analyzer@^4.5.0" = s."webpack-bundle-analyzer@4.5.0";
        "webpack-cli@4.10.0" = f "webpack-cli" "4.10.0" y "37c1d69c8d85214c5a65e589378f53aec64dab31" [
          (s."@discoveryjs/json-ext@^0.5.0")
          (s."@webpack-cli/configtest@^1.2.0")
          (s."@webpack-cli/info@^1.5.0")
          (s."@webpack-cli/serve@^1.7.0")
          (s."colorette@^2.0.14")
          (s."commander@^7.0.0")
          (s."cross-spawn@^7.0.3")
          (s."fastest-levenshtein@^1.0.12")
          (s."import-local@^3.0.2")
          (s."interpret@^2.2.0")
          (s."rechoir@^0.7.0")
          (s."webpack-merge@^5.7.3")
          ];
        "webpack-cli@^4.10.0" = s."webpack-cli@4.10.0";
        "webpack-dev-middleware@3.7.3" = f "webpack-dev-middleware" "3.7.3" y "0639372b143262e2b84ab95d3b91a7597061c2c5" [
          (s."memory-fs@^0.4.1")
          (s."mime@^2.4.4")
          (s."mkdirp@^0.5.1")
          (s."range-parser@^1.2.1")
          (s."webpack-log@^2.0.0")
          ];
        "webpack-dev-middleware@4.3.0" = f "webpack-dev-middleware" "4.3.0" y "179cc40795882cae510b1aa7f3710cbe93c9333e" [
          (s."colorette@^1.2.2")
          (s."mem@^8.1.1")
          (s."memfs@^3.2.2")
          (s."mime-types@^2.1.30")
          (s."range-parser@^1.2.1")
          (s."schema-utils@^3.0.0")
          ];
        "webpack-dev-middleware@5.3.3" = f "webpack-dev-middleware" "5.3.3" y "efae67c2793908e7311f1d9b06f2a08dcc97e51f" [
          (s."colorette@^2.0.10")
          (s."memfs@^3.4.3")
          (s."mime-types@^2.1.31")
          (s."range-parser@^1.2.1")
          (s."schema-utils@^4.0.0")
          ];
        "webpack-dev-middleware@^3.7.3" = s."webpack-dev-middleware@3.7.3";
        "webpack-dev-middleware@^4.1.0" = s."webpack-dev-middleware@4.3.0";
        "webpack-dev-middleware@^5.3.1" = s."webpack-dev-middleware@5.3.3";
        "webpack-dev-server@4.9.3" = f "webpack-dev-server" "4.9.3" y "2360a5d6d532acb5410a668417ad549ee3b8a3c9" [
          (s."@types/bonjour@^3.5.9")
          (s."@types/connect-history-api-fallback@^1.3.5")
          (s."@types/express@^4.17.13")
          (s."@types/serve-index@^1.9.1")
          (s."@types/serve-static@^1.13.10")
          (s."@types/sockjs@^0.3.33")
          (s."@types/ws@^8.5.1")
          (s."ansi-html-community@^0.0.8")
          (s."bonjour-service@^1.0.11")
          (s."chokidar@^3.5.3")
          (s."colorette@^2.0.10")
          (s."compression@^1.7.4")
          (s."connect-history-api-fallback@^2.0.0")
          (s."default-gateway@^6.0.3")
          (s."express@^4.17.3")
          (s."graceful-fs@^4.2.6")
          (s."html-entities@^2.3.2")
          (s."http-proxy-middleware@^2.0.3")
          (s."ipaddr.js@^2.0.1")
          (s."open@^8.0.9")
          (s."p-retry@^4.5.0")
          (s."rimraf@^3.0.2")
          (s."schema-utils@^4.0.0")
          (s."selfsigned@^2.0.1")
          (s."serve-index@^1.9.1")
          (s."sockjs@^0.3.24")
          (s."spdy@^4.0.2")
          (s."webpack-dev-middleware@^5.3.1")
          (s."ws@^8.4.2")
          ];
        "webpack-dev-server@^4.6.0" = s."webpack-dev-server@4.9.3";
        "webpack-dev-server@^4.9.3" = s."webpack-dev-server@4.9.3";
        "webpack-filter-warnings-plugin@1.2.1" = f "webpack-filter-warnings-plugin" "1.2.1" y "dc61521cf4f9b4a336fbc89108a75ae1da951cdb" [];
        "webpack-filter-warnings-plugin@^1.2.1" = s."webpack-filter-warnings-plugin@1.2.1";
        "webpack-hot-middleware@2.25.1" = f "webpack-hot-middleware" "2.25.1" y "581f59edf0781743f4ca4c200fd32c9266c6cf7c" [
          (s."ansi-html-community@0.0.8")
          (s."html-entities@^2.1.0")
          (s."querystring@^0.2.0")
          (s."strip-ansi@^6.0.0")
          ];
        "webpack-hot-middleware@^2.25.1" = s."webpack-hot-middleware@2.25.1";
        "webpack-log@2.0.0" = f "webpack-log" "2.0.0" y "5b7928e0637593f119d32f6227c1e0ac31e1b47f" [
          (s."ansi-colors@^3.0.0")
          (s."uuid@^3.3.2")
          ];
        "webpack-log@^2.0.0" = s."webpack-log@2.0.0";
        "webpack-manifest-plugin@4.1.1" = f "webpack-manifest-plugin" "4.1.1" y "10f8dbf4714ff93a215d5a45bcc416d80506f94f" [
          (s."tapable@^2.0.0")
          (s."webpack-sources@^2.2.0")
          ];
        "webpack-manifest-plugin@^4.0.2" = s."webpack-manifest-plugin@4.1.1";
        "webpack-merge@5.8.0" = f "webpack-merge" "5.8.0" y "2b39dbf22af87776ad744c390223731d30a68f61" [
          (s."clone-deep@^4.0.1")
          (s."wildcard@^2.0.0")
          ];
        "webpack-merge@^5.7.3" = s."webpack-merge@5.8.0";
        "webpack-merge@^5.8.0" = s."webpack-merge@5.8.0";
        "webpack-sources@1.4.3" = f "webpack-sources" "1.4.3" y "eedd8ec0b928fbf1cbfe994e22d2d890f330a933" [
          (s."source-list-map@^2.0.0")
          (s."source-map@~0.6.1")
          ];
        "webpack-sources@2.3.1" = f "webpack-sources" "2.3.1" y "570de0af163949fe272233c2cefe1b56f74511fd" [
          (s."source-list-map@^2.0.1")
          (s."source-map@^0.6.1")
          ];
        "webpack-sources@3.2.3" = f "webpack-sources" "3.2.3" y "2d4daab8451fd4b240cc27055ff6a0c2ccea0cde" [];
        "webpack-sources@^1.4.0" = s."webpack-sources@1.4.3";
        "webpack-sources@^1.4.1" = s."webpack-sources@1.4.3";
        "webpack-sources@^1.4.3" = s."webpack-sources@1.4.3";
        "webpack-sources@^2.2.0" = s."webpack-sources@2.3.1";
        "webpack-sources@^3.2.2" = s."webpack-sources@3.2.3";
        "webpack-sources@^3.2.3" = s."webpack-sources@3.2.3";
        "webpack-virtual-modules@0.2.2" = f "webpack-virtual-modules" "0.2.2" y "20863dc3cb6bb2104729fff951fbe14b18bd0299" [
          (s."debug@^3.0.0")
          ];
        "webpack-virtual-modules@0.4.3" = f "webpack-virtual-modules" "0.4.3" y "cd597c6d51d5a5ecb473eea1983a58fa8a17ded9" [];
        "webpack-virtual-modules@^0.2.2" = s."webpack-virtual-modules@0.2.2";
        "webpack-virtual-modules@^0.4.1" = s."webpack-virtual-modules@0.4.3";
        "webpack@4" = s."webpack@4.46.0";
        "webpack@4.46.0" = f "webpack" "4.46.0" y "bf9b4404ea20a073605e0a011d188d77cb6ad542" [
          (s."@webassemblyjs/ast@1.9.0")
          (s."@webassemblyjs/helper-module-context@1.9.0")
          (s."@webassemblyjs/wasm-edit@1.9.0")
          (s."@webassemblyjs/wasm-parser@1.9.0")
          (s."acorn@^6.4.1")
          (s."ajv@^6.10.2")
          (s."ajv-keywords@^3.4.1")
          (s."chrome-trace-event@^1.0.2")
          (s."enhanced-resolve@^4.5.0")
          (s."eslint-scope@^4.0.3")
          (s."json-parse-better-errors@^1.0.2")
          (s."loader-runner@^2.4.0")
          (s."loader-utils@^1.2.3")
          (s."memory-fs@^0.4.1")
          (s."micromatch@^3.1.10")
          (s."mkdirp@^0.5.3")
          (s."neo-async@^2.6.1")
          (s."node-libs-browser@^2.2.1")
          (s."schema-utils@^1.0.0")
          (s."tapable@^1.1.3")
          (s."terser-webpack-plugin@^1.4.3")
          (s."watchpack@^1.7.4")
          (s."webpack-sources@^1.4.1")
          ];
        "webpack@5.74.0" = f "webpack" "5.74.0" y "02a5dac19a17e0bb47093f2be67c695102a55980" [
          (s."@types/eslint-scope@^3.7.3")
          (s."@types/estree@^0.0.51")
          (s."@webassemblyjs/ast@1.11.1")
          (s."@webassemblyjs/wasm-edit@1.11.1")
          (s."@webassemblyjs/wasm-parser@1.11.1")
          (s."acorn@^8.7.1")
          (s."acorn-import-assertions@^1.7.6")
          (s."browserslist@^4.14.5")
          (s."chrome-trace-event@^1.0.2")
          (s."enhanced-resolve@^5.10.0")
          (s."es-module-lexer@^0.9.0")
          (s."eslint-scope@5.1.1")
          (s."events@^3.2.0")
          (s."glob-to-regexp@^0.4.1")
          (s."graceful-fs@^4.2.9")
          (s."json-parse-even-better-errors@^2.3.1")
          (s."loader-runner@^4.2.0")
          (s."mime-types@^2.1.27")
          (s."neo-async@^2.6.2")
          (s."schema-utils@^3.1.0")
          (s."tapable@^2.1.1")
          (s."terser-webpack-plugin@^5.1.3")
          (s."watchpack@^2.4.0")
          (s."webpack-sources@^3.2.3")
          ];
        "webpack@>=4.43.0 <6.0.0" = s."webpack@5.74.0";
        "webpack@^5" = s."webpack@5.74.0";
        "webpack@^5.64.4" = s."webpack@5.74.0";
        "webpack@^5.73.0" = s."webpack@5.74.0";
        "webpack@^5.74.0" = s."webpack@5.74.0";
        "webpack@^5.9.0" = s."webpack@5.74.0";
        "webpackbar@5.0.2" = f "webpackbar" "5.0.2" y "d3dd466211c73852741dfc842b7556dcbc2b0570" [
          (s."chalk@^4.1.0")
          (s."consola@^2.15.3")
          (s."pretty-time@^1.1.0")
          (s."std-env@^3.0.1")
          ];
        "webpackbar@^5.0.2" = s."webpackbar@5.0.2";
        "websocket-driver@0.7.4" = f "websocket-driver" "0.7.4" y "89ad5295bbf64b480abcba31e4953aca706f5760" [
          (s."http-parser-js@>=0.5.1")
          (s."safe-buffer@>=5.1.0")
          (s."websocket-extensions@>=0.1.1")
          ];
        "websocket-driver@>=0.5.1" = s."websocket-driver@0.7.4";
        "websocket-driver@^0.7.4" = s."websocket-driver@0.7.4";
        "websocket-extensions@0.1.4" = f "websocket-extensions" "0.1.4" y "7f8473bc839dfd87608adb95d7eb075211578a42" [];
        "websocket-extensions@>=0.1.1" = s."websocket-extensions@0.1.4";
        "whatwg-encoding@1.0.5" = f "whatwg-encoding" "1.0.5" y "5abacf777c32166a51d085d6b4f3e7d27113ddb0" [
          (s."iconv-lite@0.4.24")
          ];
        "whatwg-encoding@^1.0.5" = s."whatwg-encoding@1.0.5";
        "whatwg-fetch@3.6.2" = f "whatwg-fetch" "3.6.2" y "dced24f37f2624ed0281725d51d0e2e3fe677f8c" [];
        "whatwg-fetch@^3.6.2" = s."whatwg-fetch@3.6.2";
        "whatwg-mimetype@2.3.0" = f "whatwg-mimetype" "2.3.0" y "3d4b1e0312d2079879f826aff18dbeeca5960fbf" [];
        "whatwg-mimetype@^2.3.0" = s."whatwg-mimetype@2.3.0";
        "whatwg-url@5.0.0" = f "whatwg-url" "5.0.0" y "966454e8765462e37644d3626f6742ce8b70965d" [
          (s."tr46@~0.0.3")
          (s."webidl-conversions@^3.0.0")
          ];
        "whatwg-url@7.1.0" = f "whatwg-url" "7.1.0" y "c2c492f1eca612988efd3d2266be1b9fc6170d06" [
          (s."lodash.sortby@^4.7.0")
          (s."tr46@^1.0.1")
          (s."webidl-conversions@^4.0.2")
          ];
        "whatwg-url@8.7.0" = f "whatwg-url" "8.7.0" y "656a78e510ff8f3937bc0bcbe9f5c0ac35941b77" [
          (s."lodash@^4.7.0")
          (s."tr46@^2.1.0")
          (s."webidl-conversions@^6.1.0")
          ];
        "whatwg-url@^5.0.0" = s."whatwg-url@5.0.0";
        "whatwg-url@^7.0.0" = s."whatwg-url@7.1.0";
        "whatwg-url@^8.0.0" = s."whatwg-url@8.7.0";
        "whatwg-url@^8.5.0" = s."whatwg-url@8.7.0";
        "which-boxed-primitive@1.0.2" = f "which-boxed-primitive" "1.0.2" y "13757bc89b209b049fe5d86430e21cf40a89a8e6" [
          (s."is-bigint@^1.0.1")
          (s."is-boolean-object@^1.1.0")
          (s."is-number-object@^1.0.4")
          (s."is-string@^1.0.5")
          (s."is-symbol@^1.0.3")
          ];
        "which-boxed-primitive@^1.0.2" = s."which-boxed-primitive@1.0.2";
        "which-module@2.0.0" = f "which-module" "2.0.0" y "d9ef07dce77b9902b8a3a8fa4b31c3e3f7e6e87a" [];
        "which-module@^2.0.0" = s."which-module@2.0.0";
        "which@1.3.1" = f "which" "1.3.1" y "a45043d54f5805316da8d62f9f50918d3da70b0a" [
          (s."isexe@^2.0.0")
          ];
        "which@2.0.2" = f "which" "2.0.2" y "7c6a8dd0a636a0327e10b59c9286eee93f3f51b1" [
          (s."isexe@^2.0.0")
          ];
        "which@^1.2.9" = s."which@1.3.1";
        "which@^1.3.1" = s."which@1.3.1";
        "which@^2.0.1" = s."which@2.0.2";
        "wide-align@1.1.5" = f "wide-align" "1.1.5" y "df1d4c206854369ecf3c9a4898f1b23fbd9d15d3" [
          (s."string-width@^1.0.2 || 2 || 3 || 4")
          ];
        "wide-align@^1.1.2" = s."wide-align@1.1.5";
        "widest-line@3.1.0" = f "widest-line" "3.1.0" y "8292333bbf66cb45ff0de1603b136b7ae1496eca" [
          (s."string-width@^4.0.0")
          ];
        "widest-line@4.0.1" = f "widest-line" "4.0.1" y "a0fc673aaba1ea6f0a0d35b3c2795c9a9cc2ebf2" [
          (s."string-width@^5.0.1")
          ];
        "widest-line@^3.1.0" = s."widest-line@3.1.0";
        "widest-line@^4.0.1" = s."widest-line@4.0.1";
        "wildcard@2.0.0" = f "wildcard" "2.0.0" y "a77d20e5200c6faaac979e4b3aadc7b3dd7f8fec" [];
        "wildcard@^2.0.0" = s."wildcard@2.0.0";
        "word-wrap@1.2.3" = f "word-wrap" "1.2.3" y "610636f6b1f703891bd34771ccb17fb93b47079c" [];
        "word-wrap@^1.2.3" = s."word-wrap@1.2.3";
        "word-wrap@~1.2.3" = s."word-wrap@1.2.3";
        "wordwrap@1.0.0" = f "wordwrap" "1.0.0" y "27584810891456a4171c8d0226441ade90cbcaeb" [];
        "wordwrap@^1.0.0" = s."wordwrap@1.0.0";
        "workbox-background-sync@6.5.3" = f "workbox-background-sync" "6.5.3" y "7c66c1836aeca6f3762dc48d17a1852a33b3168c" [
          (s."idb@^6.1.4")
          (s."workbox-core@6.5.3")
          ];
        "workbox-broadcast-update@6.5.3" = f "workbox-broadcast-update" "6.5.3" y "fc2ad79cf507e22950cda9baf1e9a0ccc43f31bc" [
          (s."workbox-core@6.5.3")
          ];
        "workbox-build@6.5.3" = f "workbox-build" "6.5.3" y "38e3f286d63d2745bff4d1478bb3a6ab5c8b1170" [
          (s."@apideck/better-ajv-errors@^0.3.1")
          (s."@babel/core@^7.11.1")
          (s."@babel/preset-env@^7.11.0")
          (s."@babel/runtime@^7.11.2")
          (s."@rollup/plugin-babel@^5.2.0")
          (s."@rollup/plugin-node-resolve@^11.2.1")
          (s."@rollup/plugin-replace@^2.4.1")
          (s."@surma/rollup-plugin-off-main-thread@^2.2.3")
          (s."ajv@^8.6.0")
          (s."common-tags@^1.8.0")
          (s."fast-json-stable-stringify@^2.1.0")
          (s."fs-extra@^9.0.1")
          (s."glob@^7.1.6")
          (s."lodash@^4.17.20")
          (s."pretty-bytes@^5.3.0")
          (s."rollup@^2.43.1")
          (s."rollup-plugin-terser@^7.0.0")
          (s."source-map@^0.8.0-beta.0")
          (s."stringify-object@^3.3.0")
          (s."strip-comments@^2.0.1")
          (s."tempy@^0.6.0")
          (s."upath@^1.2.0")
          (s."workbox-background-sync@6.5.3")
          (s."workbox-broadcast-update@6.5.3")
          (s."workbox-cacheable-response@6.5.3")
          (s."workbox-core@6.5.3")
          (s."workbox-expiration@6.5.3")
          (s."workbox-google-analytics@6.5.3")
          (s."workbox-navigation-preload@6.5.3")
          (s."workbox-precaching@6.5.3")
          (s."workbox-range-requests@6.5.3")
          (s."workbox-recipes@6.5.3")
          (s."workbox-routing@6.5.3")
          (s."workbox-strategies@6.5.3")
          (s."workbox-streams@6.5.3")
          (s."workbox-sw@6.5.3")
          (s."workbox-window@6.5.3")
          ];
        "workbox-cacheable-response@6.5.3" = f "workbox-cacheable-response" "6.5.3" y "b1f8c2bc599a7be8f7e3c262535629c558738e47" [
          (s."workbox-core@6.5.3")
          ];
        "workbox-core@6.5.3" = f "workbox-core" "6.5.3" y "bca038a9ef0d7a634a6db2a60f45313ed22ac249" [];
        "workbox-expiration@6.5.3" = f "workbox-expiration" "6.5.3" y "efc0811f371a2ede1052b9de1c4f072b71d50503" [
          (s."idb@^6.1.4")
          (s."workbox-core@6.5.3")
          ];
        "workbox-google-analytics@6.5.3" = f "workbox-google-analytics" "6.5.3" y "cc8c3a61f449131660a4ed2f5362d9a3599b18fe" [
          (s."workbox-background-sync@6.5.3")
          (s."workbox-core@6.5.3")
          (s."workbox-routing@6.5.3")
          (s."workbox-strategies@6.5.3")
          ];
        "workbox-navigation-preload@6.5.3" = f "workbox-navigation-preload" "6.5.3" y "81b74f598b11aa07e2cf1c21af7a826a4f0f70b3" [
          (s."workbox-core@6.5.3")
          ];
        "workbox-precaching@6.5.3" = f "workbox-precaching" "6.5.3" y "c870312b2ef901d790ab9e48da084e776c62af47" [
          (s."workbox-core@6.5.3")
          (s."workbox-routing@6.5.3")
          (s."workbox-strategies@6.5.3")
          ];
        "workbox-range-requests@6.5.3" = f "workbox-range-requests" "6.5.3" y "e624ac82ff266a5e4f236d055797def07949d941" [
          (s."workbox-core@6.5.3")
          ];
        "workbox-recipes@6.5.3" = f "workbox-recipes" "6.5.3" y "15beac9d8ae7a3a1c100218094a824b4dd3fd59a" [
          (s."workbox-cacheable-response@6.5.3")
          (s."workbox-core@6.5.3")
          (s."workbox-expiration@6.5.3")
          (s."workbox-precaching@6.5.3")
          (s."workbox-routing@6.5.3")
          (s."workbox-strategies@6.5.3")
          ];
        "workbox-routing@6.5.3" = f "workbox-routing" "6.5.3" y "a0a699d8cc90b5692bd3df24679acbbda3913777" [
          (s."workbox-core@6.5.3")
          ];
        "workbox-strategies@6.5.3" = f "workbox-strategies" "6.5.3" y "4bea9a48fee16cf43766e0d8138296773c8a9783" [
          (s."workbox-core@6.5.3")
          ];
        "workbox-streams@6.5.3" = f "workbox-streams" "6.5.3" y "b6860290031caa7d0e46ad7142315c94359c780b" [
          (s."workbox-core@6.5.3")
          (s."workbox-routing@6.5.3")
          ];
        "workbox-sw@6.5.3" = f "workbox-sw" "6.5.3" y "cd2f0c086f4496acd25774ed02c48504189bebdd" [];
        "workbox-webpack-plugin@6.5.3" = f "workbox-webpack-plugin" "6.5.3" y "c37bb323be4952311565c07db51054fe59c87d73" [
          (s."fast-json-stable-stringify@^2.1.0")
          (s."pretty-bytes@^5.4.1")
          (s."upath@^1.2.0")
          (s."webpack-sources@^1.4.3")
          (s."workbox-build@6.5.3")
          ];
        "workbox-webpack-plugin@^6.4.1" = s."workbox-webpack-plugin@6.5.3";
        "workbox-window@6.5.3" = f "workbox-window" "6.5.3" y "4ade70056cb73477ef1cd8fea7cfd0ecbd825c7f" [
          (s."@types/trusted-types@^2.0.2")
          (s."workbox-core@6.5.3")
          ];
        "worker-farm@1.7.0" = f "worker-farm" "1.7.0" y "26a94c5391bbca926152002f69b84a4bf772e5a8" [
          (s."errno@~0.1.7")
          ];
        "worker-farm@^1.7.0" = s."worker-farm@1.7.0";
        "worker-rpc@0.1.1" = f "worker-rpc" "0.1.1" y "cb565bd6d7071a8f16660686051e969ad32f54d5" [
          (s."microevent.ts@~0.1.1")
          ];
        "worker-rpc@^0.1.0" = s."worker-rpc@0.1.1";
        "wrap-ansi@6.2.0" = f "wrap-ansi" "6.2.0" y "e9393ba07102e6c91a3b221478f0257cd2856e53" [
          (s."ansi-styles@^4.0.0")
          (s."string-width@^4.1.0")
          (s."strip-ansi@^6.0.0")
          ];
        "wrap-ansi@7.0.0" = f "wrap-ansi" "7.0.0" y "67e145cff510a6a6984bdf1152911d69d2eb9e43" [
          (s."ansi-styles@^4.0.0")
          (s."string-width@^4.1.0")
          (s."strip-ansi@^6.0.0")
          ];
        "wrap-ansi@8.0.1" = f "wrap-ansi" "8.0.1" y "2101e861777fec527d0ea90c57c6b03aac56a5b3" [
          (s."ansi-styles@^6.1.0")
          (s."string-width@^5.0.1")
          (s."strip-ansi@^7.0.1")
          ];
        "wrap-ansi@^6.2.0" = s."wrap-ansi@6.2.0";
        "wrap-ansi@^7.0.0" = s."wrap-ansi@7.0.0";
        "wrap-ansi@^8.0.1" = s."wrap-ansi@8.0.1";
        "wrappy@1" = s."wrappy@1.0.2";
        "wrappy@1.0.2" = f "wrappy" "1.0.2" y "b5243d8f3ec1aa35f1364605bc0d1036e30ab69f" [];
        "write-file-atomic@3.0.3" = f "write-file-atomic" "3.0.3" y "56bd5c5a5c70481cd19c571bd39ab965a5de56e8" [
          (s."imurmurhash@^0.1.4")
          (s."is-typedarray@^1.0.0")
          (s."signal-exit@^3.0.2")
          (s."typedarray-to-buffer@^3.1.5")
          ];
        "write-file-atomic@^3.0.0" = s."write-file-atomic@3.0.3";
        "ws@7.5.8" = f "ws" "7.5.8" y "ac2729881ab9e7cbaf8787fe3469a48c5c7f636a" [];
        "ws@8.8.0" = f "ws" "8.8.0" y "8e71c75e2f6348dbf8d78005107297056cb77769" [];
        "ws@^7.3.1" = s."ws@7.5.8";
        "ws@^7.4.6" = s."ws@7.5.8";
        "ws@^8.2.3" = s."ws@8.8.0";
        "ws@^8.4.2" = s."ws@8.8.0";
        "x-default-browser@0.4.0" = f "x-default-browser" "0.4.0" y "70cf0da85da7c0ab5cb0f15a897f2322a6bdd481" [
          (s."default-browser-id@^1.0.4")
          ];
        "x-default-browser@^0.4.0" = s."x-default-browser@0.4.0";
        "xdg-basedir@4.0.0" = f "xdg-basedir" "4.0.0" y "4bc8d9984403696225ef83a1573cbbcb4e79db13" [];
        "xdg-basedir@^4.0.0" = s."xdg-basedir@4.0.0";
        "xml-js@1.6.11" = f "xml-js" "1.6.11" y "927d2f6947f7f1c19a316dd8eea3614e8b18f8e9" [
          (s."sax@^1.2.4")
          ];
        "xml-js@^1.6.11" = s."xml-js@1.6.11";
        "xml-name-validator@3.0.0" = f "xml-name-validator" "3.0.0" y "6ae73e06de4d8c6e47f9fb181f78d648ad457c6a" [];
        "xml-name-validator@^3.0.0" = s."xml-name-validator@3.0.0";
        "xmlchars@2.2.0" = f "xmlchars" "2.2.0" y "060fe1bcb7f9c76fe2a17db86a9bc3ab894210cb" [];
        "xmlchars@^2.2.0" = s."xmlchars@2.2.0";
        "xtend@4.0.2" = f "xtend" "4.0.2" y "bb72779f5fa465186b1f438f674fa347fdb5db54" [];
        "xtend@^4.0.0" = s."xtend@4.0.2";
        "xtend@^4.0.1" = s."xtend@4.0.2";
        "xtend@^4.0.2" = s."xtend@4.0.2";
        "xtend@~4.0.1" = s."xtend@4.0.2";
        "y18n@4.0.3" = f "y18n" "4.0.3" y "b5f259c82cd6e336921efd7bfd8bf560de9eeedf" [];
        "y18n@5.0.8" = f "y18n" "5.0.8" y "7f4934d0f7ca8c56f95314939ddcd2dd91ce1d55" [];
        "y18n@^4.0.0" = s."y18n@4.0.3";
        "y18n@^5.0.5" = s."y18n@5.0.8";
        "yallist@3.1.1" = f "yallist" "3.1.1" y "dbb7daf9bfd8bac9ab45ebf602b8cbad0d5d08fd" [];
        "yallist@4.0.0" = f "yallist" "4.0.0" y "9bb92790d9c0effec63be73519e11a35019a3a72" [];
        "yallist@^3.0.2" = s."yallist@3.1.1";
        "yallist@^4.0.0" = s."yallist@4.0.0";
        "yaml@1.10.2" = f "yaml" "1.10.2" y "2301c5ffbf12b467de8da2333a459e29e7920e4b" [];
        "yaml@2.1.1" = f "yaml" "2.1.1" y "1e06fb4ca46e60d9da07e4f786ea370ed3c3cfec" [];
        "yaml@^1.10.0" = s."yaml@1.10.2";
        "yaml@^1.10.2" = s."yaml@1.10.2";
        "yaml@^1.7.2" = s."yaml@1.10.2";
        "yaml@^2.1.1" = s."yaml@2.1.1";
        "yargs-parser@18.1.3" = f "yargs-parser" "18.1.3" y "be68c4975c6b2abf469236b0c870362fab09a7b0" [
          (s."camelcase@^5.0.0")
          (s."decamelize@^1.2.0")
          ];
        "yargs-parser@20.2.9" = f "yargs-parser" "20.2.9" y "2eb7dc3b0289718fc295f362753845c41a0c94ee" [];
        "yargs-parser@20.x" = s."yargs-parser@20.2.9";
        "yargs-parser@21.0.1" = f "yargs-parser" "21.0.1" y "0267f286c877a4f0f728fceb6f8a3e4cb95c6e35" [];
        "yargs-parser@^18.1.2" = s."yargs-parser@18.1.3";
        "yargs-parser@^20.2.2" = s."yargs-parser@20.2.9";
        "yargs-parser@^20.2.9" = s."yargs-parser@20.2.9";
        "yargs-parser@^21.0.0" = s."yargs-parser@21.0.1";
        "yargs@15.4.1" = f "yargs" "15.4.1" y "0d87a16de01aee9d8bec2bfbf74f67851730f4f8" [
          (s."cliui@^6.0.0")
          (s."decamelize@^1.2.0")
          (s."find-up@^4.1.0")
          (s."get-caller-file@^2.0.1")
          (s."require-directory@^2.1.1")
          (s."require-main-filename@^2.0.0")
          (s."set-blocking@^2.0.0")
          (s."string-width@^4.2.0")
          (s."which-module@^2.0.0")
          (s."y18n@^4.0.0")
          (s."yargs-parser@^18.1.2")
          ];
        "yargs@16.2.0" = f "yargs" "16.2.0" y "1c82bf0f6b6a66eafce7ef30e376f49a12477f66" [
          (s."cliui@^7.0.2")
          (s."escalade@^3.1.1")
          (s."get-caller-file@^2.0.5")
          (s."require-directory@^2.1.1")
          (s."string-width@^4.2.0")
          (s."y18n@^5.0.5")
          (s."yargs-parser@^20.2.2")
          ];
        "yargs@17.5.1" = f "yargs" "17.5.1" y "e109900cab6fcb7fd44b1d8249166feb0b36e58e" [
          (s."cliui@^7.0.2")
          (s."escalade@^3.1.1")
          (s."get-caller-file@^2.0.5")
          (s."require-directory@^2.1.1")
          (s."string-width@^4.2.3")
          (s."y18n@^5.0.5")
          (s."yargs-parser@^21.0.0")
          ];
        "yargs@^15.0.2" = s."yargs@15.4.1";
        "yargs@^16.2.0" = s."yargs@16.2.0";
        "yargs@^17.0.0" = s."yargs@17.5.1";
        "yargs@~17.5.1" = s."yargs@17.5.1";
        "yauzl@2.10.0" = f "yauzl" "2.10.0" y "c7eb17c93e112cb1086fa6d8e51fb0667b79a5f9" [
          (s."buffer-crc32@~0.2.3")
          (s."fd-slicer@~1.1.0")
          ];
        "yauzl@^2.3.1" = s."yauzl@2.10.0";
        "yazl@2.5.1" = f "yazl" "2.5.1" y "a3d65d3dd659a5b0937850e8609f22fffa2b5c35" [
          (s."buffer-crc32@~0.2.3")
          ];
        "yazl@^2.2.2" = s."yazl@2.5.1";
        "yn@3.1.1" = f "yn" "3.1.1" y "1e87401a09d767c1d5eab26a6e4c185182d2eb50" [];
        "yocto-queue@0.1.0" = f "yocto-queue" "0.1.0" y "0294eb3dee05028d31ee1a5fa2c556a6aaf10a1b" [];
        "yocto-queue@^0.1.0" = s."yocto-queue@0.1.0";
        "yup@0.32.11" = f "yup" "0.32.11" y "d67fb83eefa4698607982e63f7ca4c5ed3cf18c5" [
          (s."@babel/runtime@^7.15.4")
          (s."@types/lodash@^4.14.175")
          (s."lodash@^4.17.21")
          (s."lodash-es@^4.17.21")
          (s."nanoclone@^0.2.1")
          (s."property-expr@^2.0.4")
          (s."toposort@^2.0.2")
          ];
        "yup@^0.32.11" = s."yup@0.32.11";
        "zwitch@1.0.5" = f "zwitch" "1.0.5" y "d11d7381ffed16b742f6af7b3f223d5cd9fe9920" [];
        "zwitch@^1.0.0" = s."zwitch@1.0.5";
        }