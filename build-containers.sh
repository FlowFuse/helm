#!/bin/bash

TAG=0.8.0

REGISTRY=$1

if [ ! -z "$REGISTRY" ]; then

  docker build flowforge-container -t $REGISTRY/flowforge/forge-k8s:$TAG
  docker build node-red-container -t $REGISTRY/flowforge/node-red:$TAG

else
  echo "Usage: $0 [container registry]"
  echo "e.g. $0 localhost:32000"
fi
