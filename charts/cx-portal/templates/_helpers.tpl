{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 61 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper cx-web image name
*/}}
{{- define "cx-uaa.image" -}}
{{- $registryName := default "" .Values.uaa.image.registry -}}
{{- $repositoryName := .Values.uaa.image.repository -}}
{{- $tag := default "latest" .Values.uaa.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- $registryName := default "" .Values.global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if $registryName -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
    {{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper cx-comm image name
*/}}
{{- define "cx-comm.image" -}}
{{- $registryName := default "" .Values.comm.image.registry -}}
{{- $repositoryName := .Values.comm.image.repository -}}
{{- $tag := default "latest" .Values.comm.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- $registryName := default "" .Values.global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if $registryName -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
    {{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper cx-iaas image name
*/}}
{{- define "cx-iaas.image" -}}
{{- $registryName := default "" .Values.iaas.image.registry -}}
{{- $repositoryName := .Values.iaas.image.repository -}}
{{- $tag := default "latest" .Values.iaas.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- $registryName := default "" .Values.global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if $registryName -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
    {{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}

{{/*
Return the proper cx-web image name
*/}}
{{- define "cx-web.image" -}}
{{- $registryName := default "" .Values.web.image.registry -}}
{{- $repositoryName := .Values.web.image.repository -}}
{{- $tag := default "latest" .Values.web.image.tag | toString -}}
{{/*
Helm 2.11 supports the assignment of a value to a variable defined in a different scope,
but Helm 2.9 and 2.10 doesn't support it, so we need to implement this if-else logic.
Also, we can't use a single if because lazy evaluation is not an option
*/}}
{{- if .Values.global }}
    {{- if .Values.global.imageRegistry }}
        {{- $registryName := default "" .Values.global.imageRegistry -}}
    {{- end -}}
{{- end -}}
{{- if $registryName -}}
    {{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- else -}}
    {{- printf "%s:%s" $repositoryName $tag -}}
{{- end -}}
{{- end -}}
