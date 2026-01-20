#!/bin/env bash

set -xe

echo $(whoami)

# --build-arg UID=$(id -u) \
# --build-arg GID=$(id -g) \

docker build --progress=plain \
    --build-arg USER=$(whoami) \
    -t ubuntu-dev .
