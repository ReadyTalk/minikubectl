#!/bin/bash

set -e
#Use latest for each release version
KVERSIONS=("v1.15.3" "v1.14.6" "v1.13.10" "v1.12.10" "v1.11.10" "v1.10.13" "v1.9.11" "v1.8.15" "v1.7.16")


for VERSION in ${KVERSIONS[@]}
do
  docker build --build-arg VERSION=${VERSION} -t readytalk/minikubectl:${VERSION} .
  V_A=(${VERSION//./ })
  MM_V="${V_A[0]}.${V_A[1]}"
  docker tag readytalk/minikubectl:${VERSION} readytalk/minikubectl:${MM_V}
  if [[ ${TRAVIS} && "${TRAVIS_BRANCH}" == "master" && -n $DOCKER_USERNAME && -n $DOCKER_PASSWORD ]]; then
    docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
    docker push readytalk/minikubectl:${VERSION}
    docker push readytalk/minikubectl:${MM_V}
  fi
done
