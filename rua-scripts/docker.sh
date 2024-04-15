#!/bin/bash

# alias docker_build="docker build -t ${IMAGE_NAME} --progress=plain ."
# alias docker_up="docker build -t ${IMAGE_NAME} --build-arg COMMAND=${BUILD_COMMAND} --progress=plain . && docker tag $IMAGE_NAME 192.168.1.57:8004/$IMAGE_NAME && docker push 192.168.1.57:8004/$IMAGE_NAME"
# alias docker_up="docker build -t ${IMAGE_NAME} --progress=plain . && docker tag $IMAGE_NAME 192.168.1.57:8004/$IMAGE_NAME && docker push 192.168.1.57:8004/$IMAGE_NAME"

docker_build() {
	docker build -t ${IMAGE_NAME} --progress=plain .
}

docker_up() {
	docker build -t ${IMAGE_NAME} --progress=plain . && docker tag $IMAGE_NAME 192.168.1.57:8004/$IMAGE_NAME && docker push 192.168.1.57:8004/$IMAGE_NAME
}
