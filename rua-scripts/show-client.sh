#!/bin/bash

set -xe

## 16 3.0 root
build-v3-editor() {
	nvm use && yarn && yarn build-v3 && scp -rp build/* root@192.168.1.16:/home/wwwroot/exhibitor/editormeta
}

build-v3-viewer() {
	nvm use && yarn && yarn build-v3-viewer && scp -rp build/* root@192.168.1.16:/home/wwwroot/design_meta
}

## 16 2.0 root
build-v2-editor() {
	nvm use && yarn && yarn build && scp -rp build/* root@192.168.1.16:/home/wwwroot/exhibitor/editor
}

build-v2-viewer() {
	nvm use && yarn && yarn buildviewer && scp -rp build/* root@192.168.1.16:/home/wwwroot/design
}

## 13 2.0
build-13-v2-editor() {
	nvm use && yarn && yarn build && sshpass -f ~/passwd/13.txt scp -r build/* exhibitor@192.168.1.13:/editor || exit 1
	echo "Upload done"
}

build-13-v2-viewer() {
	nvm use && yarn && yarn buildviewer && sshpass -f ~/passwd/13.txt scp -r build/* design@192.168.1.13:/ || exit 1
	echo "Upload done"
}
