# FlowForge Kubernetes

## Containers

There are 2 container images that will need to be built and pushed to a suitable container registry.

These can be built with the `./build-containers.sh` script that takes the registry name as a single argument

### FlowForge Container

This container holds the FlowForge App and the Kubernetes Driver

### Node-RED container

This is a basic Node-RED image with the FlowForge Lanucher and the required Node-RED plugins to talk to the FlowForge Platform

## Helm Chart

More details can be found in the [README.md](helm/flowforge/README.md) file.

