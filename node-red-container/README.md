# FlowForge Node-RED

A base container to be used for FlowForge Stacks on Kubernetes and Docker Compose based installs.

It builds from the latest Node-RED container and adds following FlowForge packages:

- [FlowForge Storage Plugin](https://github.com/flowforge/flowforge-nr-storage)
- [FlowForge Authentication Plugin](https://github.com/flowforge/flowforge-nr-auth)
- [FlowForge Audit Logger Plugin](https://github.com/flowforge/flowforge-nr-audit-logger)
- [FlowForge Project Nodes](https://github.com/flowforge/flowforge-nr-project-nodes)
- [FlowForge Theme](https://github.com/flowforge/flowforge-nr-theme)