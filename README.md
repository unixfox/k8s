<h1 align="center">unixfox Kubernetes infra code</h1>

## Installation
1. Install helm
2. Install helmfile: https://github.com/roboll/helmfile#installation
3. Install helmfile diff: `helm plugin install https://github.com/databus23/helm-diff`
4. Install helm-secrets: `helm plugin install https://github.com/futuresimple/helm-secrets`

## Deploy
```
helmfile lint
helmfile apply
```