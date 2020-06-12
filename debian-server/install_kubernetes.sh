#!/bin/bash
# Need docker installed first
./install_docker.sh

# Grab keys for repo
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" \
  >> /etc/apt/sources.list.d/kubernetes.list

# Update && upgrade
sudo apt-get update
sudo apt-get upgrade -y

# Install kubernets and tools
apt-get install -y kubelet kubeadm kubectl kubernetes-cni
