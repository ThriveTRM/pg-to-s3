#!/bin/bash

set -e

image="thrivetrm/pg-to-s3"
tag=$(git rev-parse --short HEAD)

echo "-----> Building $image..."
docker build --no-cache -t "$image" .

if [ "$1" == "--push" ]; then
  echo "-----> Tagging $image..."
  docker tag "$image" "$image:$tag"
  docker tag "$image" "$image:latest"

  echo "-----> Pushing $image..."
  docker push "$image:$tag"
else
  echo "-----> Skipping push..."
  echo "To push the image, run:"
  echo "  $ docker tag $image $image:$tag"
  echo "  $ docker tag $image $image:latest"
  echo "  $ docker push $image:$tag"
fi
