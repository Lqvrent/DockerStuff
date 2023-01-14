#!/bin/bash

PLATFORMS="linux/amd64,linux/arm/v7,linux/arm64/v8,linux/ppc64le"

echo "Where does the Dockerfile is located:"
read path

echo "How do you want to name the image:"
read name

echo "Which tag do you want to use:"
read tag

echo "Additional docker build arguments (e.g. --build-arg ARG=VALUE):"
read build_args

echo "Do you want to push the image to Docker Hub? (y/n)"
read push

if [ "$push" == "y" ]; then
    build_args="$build_args --push"
fi

echo "Building image..."
docker buildx build --platform $PLATFORMS $build_args -t $name:$tag $path

echo "Done!"
