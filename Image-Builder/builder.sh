#!/bin/bash

PLATFORMS="linux/amd64,linux/arm64"

echo "Where does the Dockerfile is located:"
read path

echo "Which tag do you want to use (e.g. user/repository:tag):"
read tag

echo "Additional docker build arguments (e.g. --build-arg ARG=VALUE):"
read build_args

echo "Do you want to push the image to Docker Hub? (y/n)"
read push

if [ "$push" == "y" ]; then
    build_args="$build_args --push"
fi

echo "Building image..."
docker buildx build --platform $PLATFORMS $build_args -t $tag $path

echo "Done!"
