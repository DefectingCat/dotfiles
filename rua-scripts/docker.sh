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

# Function to tag and push a Docker image
# Example usage
# tag_and_push gitlab/gitlab-runner
tag_and_push() {
    if [ -z "$1" ]; then
        echo "Usage: tag_and_push <image-name>"
        return 1
    fi

    # Set variables
    local IMAGE_NAME=$1
    local TARGET_IMAGE="192.168.1.57:8004/$IMAGE_NAME"

    # Tag the Docker image
    echo "Tagging image: $IMAGE_NAME as $TARGET_IMAGE"
    docker tag "$IMAGE_NAME" "$TARGET_IMAGE"

    # Push the Docker image
    echo "Pushing image: $TARGET_IMAGE"
    docker push "$TARGET_IMAGE"

    if [ $? -eq 0 ]; then
        echo "Image successfully tagged and pushed: $TARGET_IMAGE"
    else
        echo "Failed to push the image: $TARGET_IMAGE"
        return 2
    fi
}

check_client() {
    if [ -d "$FOLDER_PATH" ]; then
        return 0
    else
        return 1
    fi
}

build_lib() {
    if [ -z "$1" ]; then
        echo "Usage: build_lib <version [v2/v3]> <method [nocopy/debug]>"
        return 1
    fi

    VERSION=$1
    METHOD=$2

    case $VERSION in
    v2)
        echo "Building lib v2"
        FOLDER_PATH="../show-client-v2/src/show/lib/"
        check_client
        if [ $? -ne 0 ]; then
            echo "Show-client v2 not found"
            return -1
        fi
        setopt rm_star_silent
        npx gulp $METHOD
        rm -rf "$FOLDER_PATH/*"
        cp -aR lib/* $FOLDER_PATH
        echo 'Copy done'
        ;;
    v3)
        echo "Building lib v3"
        FOLDER_PATH="../show-client/src/show/lib/"
        check_client
        if [ $? -ne 0 ]; then
            echo "Show-client v3 not found"
            return -1
        fi
        setopt rm_star_silent
        npx gulp $METHOD
        rm -rf "$FOLDER_PATH/*"
        cp -aR lib/* $FOLDER_PATH
        echo 'Copy done'
        ;;
    *)
        echo "Invalid version: $1"
        return 2
        ;;
    esac
}
