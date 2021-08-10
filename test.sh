#!/bin/bash
SOURCE="hongquan95/lara_docker"
COMMIT_ID=`git rev-list HEAD | tail -1`
VERSION="${COMMIT_ID:0:8}"
echo "Start build!"
docker build docker build -t "$SOURCE:v-$VERSION" .

echo "Test"
docker run -it --rm "$SOURCE:v-$VERSION" php artisan test

echo "Push"
docker push "$SOURCE:v-$VERSION"
