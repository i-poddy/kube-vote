#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" &> /dev/null
}

# Check Docker installation
echo "Checking Docker installation..."
if command_exists docker; then
  echo "Docker is installed: $(docker --version)"
else
  echo "Docker is not installed!"
  exit 1
fi

# Check kubectl installation
echo "Checking kubectl installation..."
if command_exists kubectl; then
  echo "kubectl is installed: $(kubectl version --client)"
else
  echo "kubectl is not installed!"
  exit 1
fi

# Check Minikube installation
echo "Checking Minikube installation..."
if command_exists minikube; then
  echo "Minikube is installed: $(minikube version)"
else
  echo "Minikube is not installed!"
  exit 1
fi

# Check if Minikube is running as vagrant user
echo "Checking if Minikube is running as the vagrant user..."

minikube_status=$(sudo -u vagrant "minikube status" | grep -i 'host: running')

if [[ "$minikube_status" == *"host: running"* ]]; then
  echo "Minikube is running as the vagrant user!"
else
  echo "Minikube is not running as the vagrant user. Please start it using 'minikube start' as vagrant."
  exit 1
fi

echo "All checks passed!"
