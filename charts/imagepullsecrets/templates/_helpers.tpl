{{- define "dockerregistry" }}
{{- printf "{\"auths\": {\"%s\": {\"auth\": \"%s\"}}}" .Values.dockerregistry.registry (printf "%s:%s" .Values.dockerregistry.username .Values.dockerregistry.password | b64enc) | b64enc }}
{{- end }}