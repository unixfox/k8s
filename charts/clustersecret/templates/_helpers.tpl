{{/*
Expand the name of the chart.
*/}}
{{- define "clustersecret.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "clustersecret.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "clustersecret.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Default labels
*/}}
{{- define "clustersecret.defaultLabels" -}}
{{- $labelChart := include "clustersecret.chart" $ -}}
{{- $labelApp := include "clustersecret.name" $ -}}
{{- $labels := dict "app.kubernetes.io/name" $labelApp "helm.sh/chart" $labelChart "app.kubernetes.io/instance" .Release.Name "app.kubernetes.io/managed-by" .Release.Service -}}
{{ $labels | toYaml | indent 4 }}
{{- end -}}

{{/*
Default pod labels
*/}}
{{- define "clustersecret.defaultPodLabels" -}}
{{- $labelApp := include "clustersecret.name" $ -}}
{{- $labels := dict "app.kubernetes.io/name" $labelApp "app.kubernetes.io/instance" .Release.Name -}}
{{ $labels | toYaml }}
{{- end -}}

{{/*
Verification pod labels
*/}}
{{- define "clustersecret.verificationPodLabels" -}}
{{- $labelApp := include "clustersecret.name" $ -}}
{{- printf "app.kubernetes.io/name=%s,app.kubernetes.io/instance=%s" $labelApp .Release.Name -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "clustersecret.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "clustersecret.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
