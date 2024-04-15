#!/bin/bash

## 3.0 16 root
build-v3-editor() {
	nvm use && yarn && yarn build-v3 && scp -rp build/* root@192.168.1.16:/home/wwwroot/exhibitor/editormeta
}

build-v3-viewer() {
	nvm use && yarn && yarn build-v3-viewer && scp -rp build/* root@192.168.1.16:/home/wwwroot/design_meta
}
