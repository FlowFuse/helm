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
