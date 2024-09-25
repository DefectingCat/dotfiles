#!/bin/env bash

docker build --progress=plain \
	--build-arg USER=$(whoami) \
	-t ubuntu-dev .
