# FlowForge Helm Chart

Access to FlowForge Management App via the host `forge` on what ever domain is passed. e.g. if `example.com` then `http://forge.exmaple.com`

## Database

This chart uses the Bitnami PostgreSQL Chart to provide an instance of a PostgreSQL Database to store state.

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
 - `forge.localPostrgresql` Deploy a PostgreSQL Database into Kubernetes(default `true`)
 - `forge.postgres.host` the hostname of an external PostgreSQL database (default not set)
 - `forge.postgres.port` the port of an external PostgreSQL database (default `5432`)
 - `forge.cloudProvider` currently only accepts `aws` but will include more as needed (default not set)
 - `forge.projectSelector` a collection of labels and values to filter nodes that Project Pods will run on (default `role: projects`)
 - `forge.managementSelector` a collection of labels and values to filter nodes the Forge App will run on (default `role: management`)
 - `forge.projectNamespace` namespace Project Pods will run in (default `flowforge`)
 - `forge.license` FlowForge EE license string (optional, default not set)


note: `forge.projectSelector` and `forge.managementSelector` defaults mean that you must have at least 2 nodes in your cluster and they need to be labeled before installing.

### AWS

If `forge.cloudProvider` is set to `aws` then the following should be set

 - `forge.aws.IAMRole` The ARN of the IAM Role which the forge app will run with

### Email

 - `forge.email.from` the email address FlowForge will use to send email

To use STMP to send email

 - `forge.email.from` email address to send mail as can include name e.g. "\"FlowForge\" <flowforge@example.com>"
 - `forge.email.smtp.host` if not set email is disabled
 - `forge.email.smtp.port` (default `25`)
 - `forge.email.smtp.tls` (default `false`)
 - `forge.email.smtp.user`
 - `forge.email.smtp.password`

 To use AWS SES to send email

 - `forge.email.ses.region` the AWS region the SES service is enabled

 ### MQTT Broker

  - `forge.broker.enabled` (default `false`)
  - `forge.broker.url` URL to access the broker from inside the cluster (default `mqtt://flowforge-broker.[namespace]:1883`)
  - `forge.broker.public_url` URL to access the broker from outside the cluster (default `ws://mqtt.[forge.domain]`, uses `wss://` if `forge.https` is `true`)

### Telemetry

Enables FlowForge Telemetry

 - `forge.telemetry.enabled` enables anonymized usage reporting (defaults `true`)
 - `forge.telemetry.posthog.apikey` enables posthog logging if set (no default)
 - `forge.telemetry.posthog.capture_pageview` (default `true`)

 ### Billing

 Enables FlowForge billing features using Stripe

 - `forge.ee.billing.stripe.key` Stripe API Key
 - `forge.ee.billing.stripe.wh_secret` Stripe Web Hook callback secret
 - `forge.ee.billing.stripe.team_price` Stripe price id for default Team
 - `forge.ee.billing.stripe.team_product` Stripe product id for default Team
 - `forge.ee.billing.stripe.project_price` Stripe price id for default Project Type
 - `forge.ee.billing.stripe.project_product` Stripe product id for default Project Type
 - `forge.ee.billing.stripe.teams` a map containing Stripe Product & Price ids for named Team Types

### File Storage

- `forge.fileStore.enabled` (default `false`)
- `forge.fileStore.type` Choice of backends to store files `localfs` or `s3` (default `localfs`)
- `forge.fileStore.options` Options to pass to the backend storage driver 
- `forge.fileStore.quota` Sets the maximum number of bytes that a project can store as files (default `104857600`)
- `forge.fileStore.context.type` Choice of backends for Persistent Context `sequelize`
- `forge.fileStore.context.options` Options to pass to Persistent Context Driver
- `forge.fileStore.context.quota` Sets the maximum number of bytes that a project can store in Persistent Context (default `1048576`)