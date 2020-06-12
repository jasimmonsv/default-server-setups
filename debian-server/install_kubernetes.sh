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
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni

cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
sudo sysctl --system

# Configure Firewall
echo Is this the master node? (y/n)
read master_node

if [ $master_node == 'y' ] ; then
    sudo ufw allow 6443/tcp
    sudo ufw allow 2379/tcp
    sudo ufw allow 2380/tcp
    sudo ufw allow 10250/tcp
    sudo ufw allow 10251/tcp
    sudo ufw allow 10252/tcp
else
    sudo ufw allow 10250/tcp
    sudo ufw allow 30000-32767/tcp
fi
