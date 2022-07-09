#!/usr/bin/env bash

# Install required packages
yum install -y vim jq htop glances git curl wget tree nano bash-completion conntrack-tools

# Install minikube on Centos7
echo "Downloading minikube...."
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-latest.x86_64.rpm
rpm -ivh minikube-latest.x86_64.rpm
rm -vf minikube-latest.x86_64.rpm

# Install Kubectl
echo "Downloading kubectl...."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
mv ./kubectl /usr/local/bin/kubectl

# Install helm
yum install -y epel-release snapd
systemctl enable --now snapd.socket
ln -s /var/lib/snapd/snap /snap
