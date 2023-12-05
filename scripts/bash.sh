#!/bin/bash

# $1 source $2 target $3 remove old
function backup_folder() {
	if [ -r "$1" ]; then
		if [ "$3" ]; then
			rm -rf "$3"
		fi

		echo "straing copy $1 to $2"
		cp -aR "$1" "$2"
	else
		echo "$1 not exist, skip"
	fi
}
