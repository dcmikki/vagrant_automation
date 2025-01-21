#!/usr/bin/env bash

# Initiate minikube as vagrant using docker provider
#  minikube start --driver=kvm2 --cpus=4 --memory=4400mb --disk-size=10000mb
minikube start --driver=docker --cpus=4 --memory=6500mb

sleep 10

# Kubernetes Service Cluster
kubectl get po -A

# autocompletion minikube, kubectl

echo "source <(minikube completion bash)" >> /home/vagrant/.bashrc
echo "source <(kubectl completion bash)" >> /home/vagrant/.bashrc