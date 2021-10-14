# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.202.3/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version (use bullseye or stretch on local arm64/Apple Silicon): bullseye, buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

# ** [Optional] Uncomment this section to install additional packages. **
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y --no-install-recommends apt-transport-https ca-certificates curl && \
    curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg &&  \
    curl https://baltocdn.com/helm/signing.asc | apt-key add - && \
    echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list && \
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" > /etc/apt/sources.list.d/helm-stable-debian.list && \
    apt-get update && apt-get install -y --no-install-recommends kubectl helm && \
    wget -q https://github.com/roboll/helmfile/releases/latest/download/helmfile_linux_amd64 -O /usr/bin/helmfile && \
    curl -L -s https://github.com/derailed/k9s/releases/latest/download/k9s_Linux_x86_64.tar.gz | tar xvzf - -C /usr/bin k9s && \
    chmod +x /usr/bin/helmfile /usr/bin/k9s && \
    wget -q https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb -O /tmp/sops.deb && \
    dpkg -i /tmp/sops.deb