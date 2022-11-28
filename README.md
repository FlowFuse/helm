# FlowForge Kubernetes

## Containers

There are 3 container images that will need to be built and pushed to a suitable container registry.

These can be built with the `./build-containers.sh [docker.registry]` script that takes the registry name as a single argument

Stable release versions are already published on the Docker hub repository so there is no need to build your own.

### FlowForge Container

This container holds the FlowForge App and the Kubernetes Driver

### Node-RED container

This is a basic Node-RED image with the FlowForge Lanucher and the required Node-RED plugins to talk to the FlowForge Platform

### File Server container

This provides a custom Object Store to back the FlowForge File System nodes

## Helm Chart

More details can be found in the [README.md](helm/flowforge/README.md) file.

