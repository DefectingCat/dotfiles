#!/bin/env bash

docker build --progress=plain \
	--build-arg USER=$(whoami) \
	-t ubuntu-dev -f dockerfiles/ubuntu/Dockerfile .
