# ClusterSecret Helm Chart

[ClusterSecret](https://github.com/zakkg3/ClusterSecret) is an operator providing inter-namespace (or cluster-wide) secrets.

## Introduction

This chart introduces ClusterSecret custom resource, creates a deployment to run the ClusterSecret operator and optionally creates a number of ClusterSecret-s.

## Prerequisites

* Kubernetes 1.16+

## Required Configuration

No configuration is required, the defaults are sufficient to run the operator.

## Customization

The following options are supported:

| Key                                 | Type   | Default                 | Description                                                                                                            |
|-------------------------------------|--------|-------------------------|------------------------------------------------------------------------------------------------------------------------|
| nameOverride                        | string | `""`                    | Set to override the chart name part of the release name                                                                |
| fullnameOverride                    | string | `""`                    | Set to override the release name                                                                                       |
| serviceAccount.create               | bool   | `true`                  | If true create a ServiceAccount                                                                                        |
| serviceAccount.name                 | string | `""`                    | The name of the ServiceAccount to use. If not set and create is true, a name is generated using the fullname template. |
| serviceAccount.imagePullSecretNames | list   | `[]`                    | List of imagePullSecret names to use with the service account. Ignored if serviceAccount.create is false.              |
| serviceAccount.annotations          | object | `{}`                    | Service account annotations. Ignored if serviceAccount.create is false.                                                |
| rbac.create                         | bool   | `true`                  | If true create and use RBAC resources                                                                                  |
| image.repository                    | string | `"flag5/clustersecret"` | Image repository to use                                                                                                |
| image.tag                           | string | `"0.0.6"`               | Image tag to use                                                                                                       |
| image.pullPolicy                    | string | `"IfNotPresent"`        | Image pullPolicy to use                                                                                                |
| extraArgs                           | list   | `[]`                    | Additional clustersecret container arguments                                                                           |
| extraVars                           | object | `{}`                    | Optional environment variables as key-value pairs                                                                      |
| affinity                            | object | `{}`                    | affinity spec for clustersecret deployment                                                                             |
| nodeSelector                        | object | `{}`                    | nodeSelector spec for clustersecret deployment                                                                         |
| podExtraLabels                      | object | `{}`                    | Additional labels for clustersecret deployment                                                                         |
| podAnnotations                      | object | `{}`                    | Annotations for clustersecret deployment                                                                               |
| priorityClassName                   | string | `""`                    | priorityClassName for clustersecret deployment                                                                         |
| replicaCount                        | int    | `1`                     | Number of pod replicas in clustersecret deployment                                                                     |
| resources                           | object | `{}`                    | Pod resources for clustersecret deployment                                                                             |
| securityContext                     | object | `{}`                    | Pod security context for clustersecret deployment                                                                      |
| strategy                            | object | `{"type":"Recreate"}`   | strategy spec for clustersecret deployment                                                                             |
| tolerations                         | list   | `[]`                    | tolerations spec for clustersecret deployment                                                                          |
| clusterSecrets                      | list   | `[]`                    | Optional clustersecret entities to be managed as part of release                                                       |


Please refer to [values.yaml](./values.yaml) for detailed examples.

### Specifying environment

Using command line:

```helm
helm -f values.yaml install --name test patrungel/clustersecret
```
