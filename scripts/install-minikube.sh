#!/bin/bash

# Download the latest version of Minikube
curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64

# Install Minikube and remove the downloaded file
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64

# Verify Minikube installation
echo "Verifying minikube installation..."
minikube version

# Start minikube with vagrant user to ensure correct permission and set drivers to use docker
sudo -u vagrant minikube start --driver=docker
