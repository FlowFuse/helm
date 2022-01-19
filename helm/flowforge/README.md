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

 - `forge.smtp.host` if not set email is disabled
 - `forge.smtp.port` (default 25)
 - `forge.smtp.tls` (default false)
 - `forge.smtp.user` 
 - `forge.smtp.password`