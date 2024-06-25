#!/bin/env bash

docker build --progress=plain \
	--build-arg USER_ID=$(id -u $USER) \
	--build-arg GROUP_ID=$(id -g $USER) \
	-t ubuntu-dev -f dockerfiles/ubuntu/Dockerfile .
