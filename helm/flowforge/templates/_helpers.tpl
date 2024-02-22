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
app: flowforge-broker
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
    (not (and .Values.forge.email (not .Values.forge.email.smtp.existingSecret)))) -}}
true
{{- else -}}
false
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
