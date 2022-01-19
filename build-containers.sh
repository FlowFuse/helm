#!/bin/bash

REGISTRY=$1

if [ ! -z "$REGISTRY" ]; then

  docker build flowforge-container -t $REGISTRY/flowforge/forge-k8s
  docker build node-red-container -t $REGISTRY/flowforge/node-red

else
  echo "Usage: $0 [container registry]"
  echo "e.g. $0 localhost:32000"
fi
