# FlowForge Helm Chart


## Database

This chart uses the Bitnami PostgreSQL Chart to provide an instance of a PostgreSQL Database to store state.

## Configuration Values

### Core

 - `forge.domain` the domain instances will be hosted on
 - `forge.registry` the container registry to find Project templates (default Docker Hub)
 - `forge.dbUsername` (default forge)
 - `forge.dbPassword` (default Zai1Wied)

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
