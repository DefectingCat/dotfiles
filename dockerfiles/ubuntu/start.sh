#!/bin/env bash

docker run --rm -it --name=ubuntu-dev \
	--user $UID:$GID \
	--workdir="/home/$USER" \
	--volume="/etc/group:/etc/group:ro" \
	--volume="/etc/passwd:/etc/passwd:ro" \
	--volume="/etc/shadow:/etc/shadow:ro" \
	--volume="/etc/sudoers.d/:/etc/sudoers.d/" \
	-v $SSH_AUTH_SOCK:/ssh-agent -e SSH_AUTH_SOCK=/ssh-agent \
	ubuntu-dev
