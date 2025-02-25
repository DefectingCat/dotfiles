#!/bin/env bash

oha_url() {
    if [[ -z $1 ]]; then
        echo "usage: oha_url <url>"
        return
    fi
    oha -z 10sec -c 50 --latency-correction --disable-keepalive --insecure $1
}
