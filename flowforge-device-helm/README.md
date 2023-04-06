# Helm chart for FlowForge device in Kubernetes

This chart deploys FlowForge devices to a Kubernetes cluster. Devices can be assigned to a team or to a project during deployment.

Device instances are deployed as `Pods` in a `StatefulSet`. Every pod has own storage volume to keep variable data.

### Device installation

The procedure has been tested for Azure and AWS Kubernetes services.

1. Get provisioning token. In FlowForge Web-UI go to `Team` -> `Settings` -> `Devices` -> `Add Token` and save a token.
2. Save provisioning token to a file `device.yml` in the current (README.md) directory
3. Install `make` utility.
4. Make sure you have `base64` utility. Should be available on any Linux or MacOSX system.
5. Configure `kubectl` to access target K8S cluster with `default` context.
6. Edit `values-aws.yaml` or `values-azure.yaml` files. Fill with your custom settings.
7. Install the chart with command `make install-aws` or `make install-azure`. To choose namespace and device file name use command `make install-aws NAMESPACE=team-b DEV_FILE=device.yml`
8. Verify if pods are running in `devices` namespace.
9. Verify if devices are visible on FlowForge Web-UI.

### Upgrade after HELM modifications
`make upgrade-{vendor}`

### Uninstall the chart
`make uninstall`

Note that persistent volume claims and volumes will remain existing.

### Token update procedure

In case if device token has been updated, it is not enough just update the Helm.

1. Uninstall Helm chart
2. Manually remove `PersistenVolumeClaims`  `flowforge-data-flowforge-device-*`.
3. Manually remove related `PersistenVolumes`
4. Install the chart with new device token.
