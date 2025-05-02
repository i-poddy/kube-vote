#!/bin/bash

# Update the system
sudo apt-get update

# Install dependencies
sudo apt-get install -y ca-certificates curl

# Download the latest stable version of kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make kubectl executable
chmod +x kubectl

# Move kubectl to /usr/local/bin
sudo mv kubectl /usr/local/bin/

# Verify kubectl installation
echo "Verifying kubectl installation..."
kubectl version --client
