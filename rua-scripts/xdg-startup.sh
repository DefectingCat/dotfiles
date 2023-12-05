#!/bin/bash

export XDG_RUNTIME_DIR=/tmp/$UID
if [ ! -d $XDG_RUNTIME_DIR ]; then
	mkdir /tmp/$UID
fi
