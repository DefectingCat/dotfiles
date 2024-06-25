#!/bin/env bash

docker run --rm -it --name=ubuntu-dev \
	-v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent \
	ubuntu-dev
