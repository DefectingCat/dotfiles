#!/bin/env bash

set -xe

if [ $# -lt 1 ]; then
    echo "Usage: $0 <home folder> <project folder>"
    exit 1
fi

# HOME_FOLDER=$1
PROJECT_FOLDER=$1

# if [ -z "$(ls -A "$HOME_FOLDER")" ]; then
#     docker run --rm -itd --name=ubuntu-dev ubuntu-dev || exit 1
#     docker cp ubuntu-dev:/home/xfy/. $HOME_FOLDER || docker stop ubuntu-dev
#     docker stop ubuntu-dev
# fi

# -v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent
# -v $HOME_FOLDER:/home/xfy \
# --user xfy:xfy \
# --entrypoint=/bin/bash \

docker run --rm -it --name=ubuntu-dev \
    -v $PROJECT_FOLDER:/app \
    ubuntu-dev
