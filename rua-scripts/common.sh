#!/bin/env bash

# Oha request
oha_url() {
    if [[ -z $1 ]]; then
        echo "usage: oha_url <url>"
        return
    fi
    oha -z 10sec -c 50 --latency-correction --disable-keepalive --insecure $1
}

mac-update() {
    brew update && brew upgrade && brew cleanup &&
        rustup update && rustup self update && vim-update
}

arch-update() {
    yay --noconfirm &&
        rustup update && rustup self update && vim-update
}
