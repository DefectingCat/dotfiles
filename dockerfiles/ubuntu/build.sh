#!/bin/env bash

set -xe

echo $(whoami)

docker build --progress=plain \
    --build-arg UID=$(id -u) \
    --build-arg GID=$(id -g) \
    --build-arg USER=$(whoami) \
    -t ubuntu-dev .
