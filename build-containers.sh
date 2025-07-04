#!/bin/bash

TAG=`cat VERSION`

REGISTRY=$1

if [ ! -z "$REGISTRY" ]; then

  docker build flowfuse-container -t $REGISTRY/flowforge/forge-k8s:$TAG
  docker build node-red-container -t $REGISTRY/flowforge/node-red:$TAG
  docker build file-server -t %REGISTRY/flowforge/file-server:$TAG

else
  echo "Usage: $0 [container registry]"
  echo "e.g. $0 localhost:32000"
fi
