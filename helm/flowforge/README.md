# FlowForge Helm Chart

Access to FlowForge Management App via the host `forge` on what ever domain is passed. e.g. if `example.com` then `http://forge.exmaple.com`

## Database

This chart uses the Bitnami PostgreSQL Chart to provide an instance of a PostgreSQL Database to store state.

## Configuration Values

### Core

 - `forge.domain` the domain instances will be hosted on
 - `forge.registry` the container registry to find Project templates (default Docker Hub)
 - `forge.dbUsername` (default `forge`)
 - `forge.dbPassword` (default `Zai1Wied`)
 - `forge.localPostrgresql` Deploy a PostgreSQL Database into Kubernetes(default true)
 - `forge.postgres.host` the hostname of an external PostgreSQL database (default not set)
 - `forge.postgres.port` the port of an external PostgreSQL dataabse (default `5432`)

### Email

 - `forge.email.from` the email address FlowForge will use to send email

To use STMP to send email

 - `forge.email.smtp.host` if not set email is disabled
 - `forge.email.smtp.port` (default 25)
 - `forge.email.smtp.tls` (default false)
 - `forge.email.smtp.user`
 - `forge.email.smtp.password`

 To use AWS SES to send email

 - `forge.email.ses.region` the AWS region the SES service is enabled
