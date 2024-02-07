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
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "forge"
{{- end }}

{{/*
Broker Selector labels
*/}}
{{- define "forge.brokerSelectorLabels" -}}
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "broker"
{{- end }}

{{/*
FileStore Selector labels
*/}}
{{- define "forge.fileStoreSelectorLabels" -}}
{{ include "forge.commonSelectorLabels" . }}
app.kubernetes.io/component: "file-server"
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
