# Searx Helm chart

Easily deploy Searx to Kubernetes.

## Installing and Upgrading Helm chart

```sh
helm upgrade --install searx . --set-file searxSettings=./settings.yml --set-file filtronRules=./rules.json --set morty.key=xx
```

## Uninstall

```sh
# Get rid of everything
$ helm delete searx

```

## TODO
- Automatically generate secret_key using Helm and insert it inside the settings.yml
- Manage secret_key from values.yml