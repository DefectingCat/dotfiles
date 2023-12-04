#!/bin/bash

# $1 source $2 target $3 remove old
function backup_folder() {
	if [ "$3" ]; then
		rm -rf "$3"
	fi

	cp -aR "$1" "$2"
}
