#!/bin/bash

echo "post-start start" >> ~/status

ln -s /workspaces/.codespaces/.persistedshare/.kube /home/vscode/.kube
ln -s /workspaces/.codespaces/.persistedshare/.gnupg /home/vscode/.gnupg
mkdir /home/vscode/.local
mkdir /home/vscode/.local/share
ln -s /workspaces/.codespaces/.persistedshare/.helm /home/vscode/.local/share/helm
ln -s /workspaces/.codespaces/.persistedshare/.k9s /home/vscode/.config/k9s
echo "export GPG_TTY=\$(tty)" >> /home/vscode/.bashrc

echo "post-start complete" >> ~/status