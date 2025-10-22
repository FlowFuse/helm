{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "forge.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "forge.labels" -}}
helm.sh/chart: {{ include "forge.chart" . }}
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/* 
Common Selector Labels
*/}}
{{- define "forge.commonSelectorLabels" -}}
app.kubernetes.io/name: "flowforge"
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Forge Selector labels
*/}}
{{- define "forge.forgeSelectorLabels" -}}
{{/*
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "forge"
*/}}
app: flowforge
{{- end }}

{{/*
Broker Selector labels
*/}}

{{- define "forge.brokerSelectorLabels" -}}
{{/* 
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "broker"
*/}}
{{- if and ( eq .Values.forge.broker.enabled true) ( eq .Values.forge.broker.teamBroker.enabled false ) -}}
app: flowforge-broker
{{- else -}}
apps.emqx.io/db-role: core
apps.emqx.io/instance: emqx
apps.emqx.io/managed-by: emqx-operator
{{- end -}}
{{- end }}

{{/*
FileStore Selector labels
*/}}
{{- define "forge.fileStoreSelectorLabels" -}}
{{/*
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "file-server"
*/}}
app: flowforge-file
{{- end }}

{{/*
emqx-exporter Selector labels
*/}}
{{- define "forge.emqxExporterSelectorLabels" -}}
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "emqx-exporter"
{{- end -}}

{{/*
Get the postgresql secret object name.
*/}}
{{- define "forge.secretName" -}}
{{- if .Values.postgresql.auth.existingSecret -}}
    {{- tpl .Values.postgresql.auth.existingSecret $ -}}
{{- else -}}
    {{- printf "%s-%s" (tpl .Release.Name .) "postgresql" -}}
{{- end -}}
{{- end -}}

{{/*
Get the flowfuse secret object name.
*/}}
{{- define "forge.applicationSecretName" -}}
{{- if .Values.postgresql.auth.existingSecret -}}
    {{- tpl .Values.postgresql.auth.existingSecret $ -}}
{{- else -}}
    {{- printf "flowfuse-secrets" -}}
{{- end -}}
{{- end -}}

{{/*
Get the database host name.
*/}}
{{- define "forge.databaseHost" -}}
{{- if not .Values.postgresql.host -}}
    {{- printf "%s-%s" .Release.Name "postgresql" }}
{{- else -}}
    {{- .Values.postgresql.host }}
{{- end -}}
{{- end -}}

{{/*
Get the secret object name with smtp password.
*/}}
{{- define "forge.smtpSecretName" -}}
{{- if and .Values.forge.email .Values.forge.email.smtp .Values.forge.email.smtp.existingSecret -}}
    {{- tpl .Values.forge.email.smtp.existingSecret $ -}}
{{- else -}}
    {{- printf "flowfuse-secrets" -}}
{{- end -}}
{{- end -}}

{{/*
Define if secret object should be created

Note: The value for key .Values.postgresql.auth.existingSecret is inherited from sub-chart.
*/}}

{{- define "forge.createSecret" -}}
{{- if not (and .Values.postgresql.auth.existingSecret 
    (not (and .Values.forge.email ((and .Values.forge.email.smtp (not .Values.forge.email.smtp.existingSecret)))))) -}}
true
{{- else -}}
false
{{- end -}}
{{- end -}}

{{/*
Get the secret object name with assistant token.
*/}}
{{- define "forge.assistantSecretName" -}}
{{- if (.Values.forge.assistant).enabled -}}
    {{- printf "flowfuse-secrets" -}}
{{- end -}}
{{- end -}}

{{/*
Create SMTP password 
*/}}
{{- define "forge.smtpPassword" -}}
{{- if and ( hasKey .Values.forge "email" ) (hasKey .Values.forge.email "smtp") .Values.forge.email.smtp.password -}}
smtp-password: {{ .Values.forge.email.smtp.password | b64enc | quote}}
{{- end -}}
{{- end -}}

{{/*
Create PostgreSQL passwords
*/}}
{{- define "forge.postgresqlPasswords" -}}
{{- if not .Values.postgresql.auth.existingSecret -}}
password: {{ .Values.postgresql.auth.password | b64enc | quote }}
postgres-password: {{ .Values.postgresql.auth.postgresPassword | b64enc | quote }}
{{- end -}}
{{- end -}}

{{/*
Create assistant token
*/}}
{{/*
{{- define "forge.assistantToken" -}}
{{- if ((.Values.forge.assistant).service).token -}}
token: {{ .Values.forge.assistant.service.token | b64enc | quote }}
{{- end -}}
{{- end -}}
*/}}
{{- define "forge.assistantToken" -}}
{{- if (.Values.forge.assistant).enabled -}}
{{- $token := required "A valid .Values.forge.assistant.service.token is required!" ((.Values.forge.assistant).service).token -}}
token: {{ $token | b64enc | quote }}
{{- end -}}
{{- end -}}


{{/*
Configure broker domain
*/}}
{{- define "forge.brokerDomain" -}}
{{- if (((.Values.forge).broker).hostname) -}}
    {{ .Values.forge.broker.hostname }}
{{- else -}}
    {{ printf "%s.%s" "mqtt" .Values.forge.domain }}
{{- end -}}
{{- end -}}

{{/*
Team Broker default Hostname
*/}}
{{- define "forge.teamBrokerHost" -}}
{{- if (.Values.broker).hostname  -}}
    {{ .Values.broker.hostname }}
{{- else -}}
    {{ printf "%s.%s" "broker" .Values.forge.domain }}
{{- end -}}
{{- end -}}

{{/*
Configure emqx bootstrap api secret
*/}}
{{- define "emqx.bootstrapApiKeySecret" -}}
{{- $secretName := "emqx-config-secrets" }}
{{- $existingSecret := (lookup "v1" "Secret" .Release.Namespace $secretName) | default dict }}
{{- if and $existingSecret.data (hasKey $existingSecret.data "api_key_secret") }}
{{- printf $existingSecret.data.api_key_secret | b64dec }}
{{- else }}
{{- randAlphaNum 32 -}}
{{- end }}
{{- end }}

{{/*
Generate NPM registry admin password if not provided
*/}}
{{- define "forge.npmRegistryAdminPassword" -}}
{{- if and (hasKey .Values.forge "npmRegistry") (hasKey .Values.forge.npmRegistry "admin") (hasKey .Values.forge.npmRegistry.admin "password") }}
{{- .Values.forge.npmRegistry.admin.password }}
{{- else }}
{{- $seed := printf "%s-%s-%s" .Release.Name .Release.Namespace "npm-registry-secret" }}
{{- sha256sum $seed | trunc 25 }}
{{- end }}
{{- end -}}

{{/*
Check if cert-manager is enabled by detecting cert-manager annotations in ingress.annotations
Usage: {{ if include "forge.certManagerEnabled" . }}
*/}}
{{- define "forge.certManagerEnabled" -}}
{{- $certManagerDetected := false -}}
{{- if .Values.ingress.certManagerIssuer -}}
  {{- $certManagerDetected = true -}}
{{- else if .Values.ingress.annotations -}}
  {{- range $key, $value := .Values.ingress.annotations -}}
    {{- if hasPrefix "cert-manager.io/" $key -}}
      {{- $certManagerDetected = true -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if $certManagerDetected -}}
true
{{- end -}}
{{- end -}}

{{/*
Check if cert-manager is enabled by detecting cert-manager annotations in broker ingress annotations
Usage: {{ if include "forge.brokerCertManagerEnabled" . }}
*/}}
{{- define "forge.brokerCertManagerEnabled" -}}
{{- $certManagerDetected := false -}}
{{- if and .Values.forge.broker.enabled .Values.ingress.certManagerIssuer -}}
  {{- $certManagerDetected = true -}}
{{- else if and .Values.forge.broker.enabled ((.Values.forge.broker).ingress).annotations -}}
  {{- range $key, $value := .Values.forge.broker.ingress.annotations -}}
    {{- if hasPrefix "cert-manager.io/" $key -}}
      {{- $certManagerDetected = true -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if $certManagerDetected -}}
true
{{- end -}}
{{- end -}}

{{/*
Filter ingress annotations to remove cert-manager.io annotations when certManagerIssuer is set
Usage: {{ include "forge.filteredIngressAnnotations" . }}
*/}}
{{- define "forge.filteredIngressAnnotations" -}}
{{- $filtered := dict -}}
{{- if .Values.ingress.annotations -}}
  {{- range $key, $value := .Values.ingress.annotations -}}
    {{- if not (and $.Values.ingress.certManagerIssuer (hasPrefix "cert-manager.io/" $key)) -}}
      {{- $_ := set $filtered $key $value -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if $filtered -}}
{{- toYaml $filtered -}}
{{- end -}}
{{- end -}}

{{/*
Filter broker ingress annotations to remove cert-manager.io annotations when certManagerIssuer is set
Usage: {{ include "forge.filteredBrokerIngressAnnotations" . }}
*/}}
{{- define "forge.filteredBrokerIngressAnnotations" -}}
{{- $filtered := dict -}}
{{- if and .Values.forge.broker.enabled ((.Values.forge.broker).ingress).annotations -}}
  {{- range $key, $value := (.Values.forge.broker).ingress.annotations -}}
    {{- if not (and $.Values.ingress.certManagerIssuer (hasPrefix "cert-manager.io/" $key)) -}}
      {{- $_ := set $filtered $key $value -}}
    {{- end -}}
  {{- end -}}
{{- end -}}
{{- if $filtered -}}
{{- toYaml $filtered -}}
{{- end -}}
{{- end -}}