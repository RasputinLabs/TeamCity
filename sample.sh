#!/bin/bash
echo "Starting Build"
export DOCKERCLOUD_NAMESPACE=%env.dockerNamespace%
docker login -u %env.serviceUser% -p %env.servicePass%
export TAG=`cat VERSION`
echo "BUILDING VERSION ${TAG}"
docker build --no-cache -t rasputinlabs/base-php:$TAG -t rasputinlabs/base-php:latest .
docker push rasputinlabs/base-php:$TAG
docker push rasputinlabs/base-php:latest
