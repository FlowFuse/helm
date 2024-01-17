# FlowForge Helm Chart

Access to FlowForge Management App via the host `forge` on what ever domain is passed. e.g. if `example.com` then `http://forge.exmaple.com`

## Database

This chart can use the Bitnami PostgreSQL Chart to provide an instance of a PostgreSQL Database to store state (`forge.localPostgresql: true`).

The chart is currently pinned at the Bitanmi PostgreSQL v14 release, which only supports x86_64 deployments when 
using a local database

If using an external PostgreSQL Database you will need to create the database and user to pass to the helm chart using the following values:

- `forge.dbName`
- `forge.dbUsername`
- `forge.dbPassword`
- `forge.postgres.host`
- `forge.postgres.port`
- `forge.postgres.ssl`

## Configuration Values

### Core

 - `forge.image` supply a fully qualified container image for the forge app (default `forge.registry`/flowforge/forge-k8s:<App Version>)
 - `forge.domain` the domain instances will be hosted on
 - `forge.entryPoint` if the admin app is hosted on a different domain
 - `forge.https` is the Forge App accessed via HTTPS (default `true`)
 - `forge.registry` the container registry to find Project templates (default Docker Hub)
 - `forge.dbUsername` (default `forge`)
 - `forge.dbPassword` (default `Zai1Wied`)
 - `forge.dbName` (default `flowforge`)
 - `forge.localPostrgresql` Deploy a PostgreSQL v14 Database into Kubernetes cluster (default `true`)
 - `forge.postgres.host` the hostname of an external PostgreSQL database (default not set)
 - `forge.postgres.port` the port of an external PostgreSQL database (default `5432`)
 - `forge.postgres.ssl` sets the connection to the database to use SSL/TLS (default `false`)
 - `forge.cloudProvider` currently only accepts `aws` but will include more as needed (default not set)
 - `forge.projectSelector` a collection of labels and values to filter nodes that Project Pods will run on (default `role: projects`)
 - `forge.managementSelector` a collection of labels and values to filter nodes the Forge App will run on (default `role: management`)
 - `forge.affinity` allows to configure [affinity or anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) for the core application pod
 - `forge.projectNamespace` namespace Project Pods will run in (default `flowforge`)
 - `forge.license` FlowForge EE license string (optional, default not set)
 - `forge.branding` Object holding branding inserts (default not set)
 - `forge.projectDeploymentTolerations` tolerations settings for Project instances. Default is `[]`.
 - `forge.clusterRole.name` custom name for the ClusterRole (default `create-pod`)
 - `forge.resources` allows to configure [resources](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) for the core application container
 - `forge.podSecurityContext` allows to configure [securityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for the core application pod

 
note: `forge.projectSelector` and `forge.managementSelector` defaults mean that you must have at least 2 nodes in your cluster and they need to be labeled before installing.
  
### AWS

If `forge.cloudProvider` is set to `aws` then the following should be set

 - `forge.aws.IAMRole` The ARN of the IAM Role which the forge app will run with

### Email

 - `forge.email.from` the email address FlowForge will use to send email

To use STMP to send email

 - `forge.email.from` email address to send mail as can include name e.g. "\"FlowForge\" <flowforge@example.com>"
 - `forge.email.smtp.host` if not set email is disabled
 - `forge.email.smtp.port` (default `587`)
 - `forge.email.smtp.tls` (default `false`)
 - `forge.email.smtp.user` If no set no credentials passed (required if password set)
 - `forge.email.smtp.password` (required if user set)

 To use AWS SES to send email

 - `forge.email.ses.region` the AWS region the SES service is enabled

 ### MQTT Broker

  - `forge.broker.enabled` (default `false`)
  - `forge.broker.url` URL to access the broker from inside the cluster (default `mqtt://flowforge-broker.[namespace]:1883`)
  - `forge.broker.public_url` URL to access the broker from outside the cluster (default `ws://mqtt.[forge.domain]`, uses `wss://` if `forge.https` is `true`)
  - `forge.broker.affinity` allows to configure [affinity or anti-affinity](https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#affinity-and-anti-affinity) for the broker pod
  - `forge.broker.resources` allows to configure [resources](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) for the broker container
  - `forge.broker.podSecurityContext` allows to configure [securityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for the broker pod

### Telemetry

Enables FlowForge Telemetry

 - `forge.telemetry.enabled` enables anonymized usage reporting (default `true`)
 - `forge.telemetry.posthog.apikey` enables posthog logging if set (not default)
 - `forge.telemetry.posthog.apiurl` sets posthog target host (default `https://app.posthog.com`)
 - `forge.telemetry.posthog.capture_pageview` (default `true`)
 - `forge.telemetry.sentry.frontend_dsn` enables sentry reporting if set (default unset)
 - `forge.telemetry.sentry.backend_dsn` enables sentry reporting if set (default unset)
 - `forge.telemetry.sentry.production_mode` rate limit reporting (default `true`)
 - `forge.telemetry.sentry.environment` set SENTRY_ENV environment variable, which overrides NODE_ENV for the reported environment (default unset)
 - `forge.telemetry.backend.prometheus.enabled` enables the `/metrics` endpoint on the forge app for scraping by Prometheus

 ### Support

 Enables HubSpot support widget in the FlowForge app

 - `forge.support.enabled` enables support widget (default `false`)
 - `forge.support.hubspot` HubSpot tracking code

 ### Billing

 Enables FlowForge billing features using Stripe

 - `forge.ee.billing.stripe.key` Stripe API Key
 - `forge.ee.billing.stripe.wh_secret` Stripe Web Hook callback secret
 - `forge.ee.billing.stripe.team_price` Stripe price id for default Team
 - `forge.ee.billing.stripe.team_product` Stripe product id for default Team
 - `forge.ee.billing.stripe.project_price` Stripe price id for default Project Type
 - `forge.ee.billing.stripe.project_product` Stripe product id for default Project Type
 - `forge.ee.billing.stripe.device_price` Stripe price id for Device (optional)
 - `forge.ee.billing.stripe.device_product` Stripe product id for Device (optional)
 - `forge.ee.billing.stripe.deviceCost` Set the displayed price for a Device (optional)
 - `forge.ee.billing.stripe.new_customer_free_credit` Value in cents to be awarded as credit to new users
 - `forge.ee.billing.stripe.teams` a map containing Stripe Product & Price ids for named Team Types

### File Storage

- `forge.fileStore.enabled` (default `false`)
- `forge.fileStore.type` Choice of backends to store files `localfs` or `s3` (default `localfs`)
- `forge.fileStore.options` Options to pass to the backend storage driver (See [file-server](https://github.com/flowforge/flowforge-file-server) for details)
- `forge.fileStore.quota` Sets the maximum number of bytes that a project can store as files (default `104857600`)
- `forge.fileStore.context.type` Choice of backends for Persistent Context `sequelize`
- `forge.fileStore.context.options` Options to pass to Persistent Context Driver (See [file-server](https://github.com/flowforge/flowforge-file-server) for details)
- `forge.fileStore.context.quota` Sets the maximum number of bytes that a project can store in Persistent Context (default `1048576`)
- `forge.fileStore.resources` allows to configure [resources](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/) for the file-server container
- `forge.fileStore.podSecurityContext` allows to configure [securityContext](https://kubernetes.io/docs/tasks/configure-pod-container/security-context/) for the flowforge-file pod

### Private Certificate Authority

 - `forge.privateCA.configMapName` name of ConfigMap to store the CA Cert bundle (default `ff-ca-certs`)
 - `forge.privateCA.certs` base64 encoded CA certificate PEM bundle of trusted certificates. This needs to be generated without line breaks e.g. `base64 -w 0 certs.pem` (default not set)
 
 ### Rate Limiting

 - `forge.rate_limits.enabled` (default `false`)
 - `forge.rate_limits.global` (default `true`)
 - `forge.rate_limits.timeWindow` Time in milliseconds to evaluate requests over (default 60000)
 - `forge.rate_limits.max` Max requests per timeWindow (default 1000)
 - `forge.rate_limits.maxAnonymous` Max anonymous requests per timeWindow (default `forge.rate_limits.max`)

 ### Content Security Policy

 - `forge.contentSecurityPolicy.enabled` Enabled HTTP header from Forge app (default `false`)
 - `forge.contentSecurityPolicy.reportOnly` Disables enforcing and only reports in browser console (default `false`)
 - `forge.contentSecurityPolicy.reportUri` if `reportOnly` enabled causes browser to POST report to URI (default not set)
 - `forge.contentSecurityPolicy.directives` a JSON object that overrides the platform defaults. Uses format defined by HelmetJS [here](https://helmetjs.github.io/#content-security-policy)

Everything under `forge.rate_limits` is used as input to Fastify Rate Limit plugin, further options can be found [here](https://github.com/fastify/fastify-rate-limit#options) and can be included.

 ### Ingress
 - `ingress.annotations` ingress annotations (default is `{}`). This value is also applied to Editor instances created by FlowForge.
 - `ingress.className` ingress class name (default is `"""`). This value is also applied to Editor instances created by FlowForge. 
 - `ingress.certManagerIssuer` the name of the CertManager Issuer to use to create HTTPS certificates. (default is not set)

 `ingress.annotations` values can contain the following tokens that will be replaced as follows:

  - `{{ instanceHost }}` replaced by the hostname of the instance
  - `{{ instanceURL }}` replaced by the URL for the instance
  - `{{ instanceProtocol }}` replaced by either `http` or `https`
  - `{{ serviceName }}` replaced by the service name of the instance

### Editors IAM
   Provision default service account for Editors if `editors.serviceAccount.create` is `true`.

- `editors.serviceAccount.create` flag, indicates whether default Editors service account is going to be provisioned.
- `editors.serviceAccount.annotations` k8s service account annotations.
- `editors.serviceAccount.name` name of the service account for Editors.

Example for <i>AWS</i>:
```yaml
editors:
  serviceAccount:
    annotations:
      eks.amazonaws.com/role-arn: arn:aws:iam::${ACCOUNT_ID}:role/${ROLE_NAME}
    create: true
    name: editors
```
