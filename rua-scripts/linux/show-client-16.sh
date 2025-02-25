#!/bin/env bash

# 16 staging
build_client_v3() {
    fnm use && yarn && yarn build-showyun && scp -r -O build/* root@16:/home/wwwroot/editor_meta_showyun/ &&
        fnm use && yarn && yarn build-showyun-viewer-rel && scp -r -O build/* root@16:/home/wwwroot/design_meta_showyun/
}

build_client_v2() {
    fnm use && yarn && yarn build-showyun && scp -r -O build/* root@16:/home/wwwroot/editor_showyun &&
        fnm use && yarn && yarn build-showyun-viewer-rel && scp -r -O build/* root@16:/home/wwwroot/design_showyun
}
