#!/bin/env bash

# scp ~/.vimrc root@192.168.1.16:/home/root/.vimrc
scp_vim() {
    if [ -z "$1" ]; then
        echo "Usage: scp_vim <host>"
        return 1
    fi

    HOST=$1

    scp ~/.vimrc $HOST:~/.vimrc
    scp -r -O ~/.vim $HOST:~/.vim
}
