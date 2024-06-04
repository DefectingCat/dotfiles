#!/bin/bash

## 16 3.0 root
build-v3-editor() {
	nvm use && yarn && yarn build-v3 && scp -rp build/* root@192.168.1.16:/home/wwwroot/exhibitor/editormeta || exit 1
	echo "Upload build-v3-editor done"
}
build-v3-viewer() {
	nvm use && yarn && yarn build-v3-viewer && scp -rp build/* root@192.168.1.16:/home/wwwroot/design_meta || exit 1
	echo "Upload build-v3-viewer done"
}

## 16 2.0 root
build-v2-editor() {
	nvm use && yarn && yarn build-v3 && scp -rp build/* root@192.168.1.16:/home/wwwroot/exhibitor/editor || exit 1
	echo "Upload build-v2-editor done"
}
build-v2-viewer() {
	nvm use && yarn && yarn build-v3-viewer && scp -rp build/* root@192.168.1.16:/home/wwwroot/design || exit 1
	echo "Upload build-v2-viewer done"
}

## 13 2.0
build-13-v2-editor() {
	nvm use && yarn && yarn build && sshpass -f ~/passwd/13.txt scp -r build/* exhibitor@192.168.1.13:/editor || exit 1
	echo "Upload build-13-v2-editor done"
}
build-13-v2-viewer() {
	nvm use && yarn && yarn buildviewer && sshpass -f ~/passwd/13.txt scp -r build/* design@192.168.1.13:/ || exit 1
	echo "Upload build-13-v2-viewer done"
}

## 羚羊 2.0
build-ly-v2-editor() {
	nvm use && yarn && yarn buildlingyang && sshpass -f ~/passwd/lingyang.txt scp -P 106 -r build/* exhibitor@124.70.207.176:/editor || exit 1
	echo "Upload build-ly-v2-editor done"
}

build-ly-v2-viewer() {
	nvm use && yarn && yarn generate-lingyang && sshpass -f ~/passwd/lingyang.txt scp -P 106 -r build/* design@124.70.207.176:/ || exit 1
	echo "Upload build-ly-v2-viewer done"
}

## 正式服务器
build-pub-v3-viewer() {
	nvm use && yarn && yarn buildviewerpub-rel && scp -r build/* root@129.211.172.57:/home/wwwroot/design_meta/ || exit 1
	echo "Upload build-pub-v3-viewer done"
}
build-pub-v3-editor() {
	nvm use && yarn && yarn buildpub && sshpass -f ~/passwd/lingyang.txt scp -r build/* exhibitor@129.211.172.57:/editormeta || exit 1
	echo "Upload build-pub-v3-editor done"
}
