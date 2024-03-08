#!/usr/bin/env bash

# Initiate minikube as vagrant using docker provider
#  minikube start --driver=kvm2 --cpus=4 --memory=4400mb --disk-size=10000mb
minikube start --driver=docker --cpus=4 --memory=4400mb

sleep 5

# Kubernetes Service Cluster
kubectl get po -A
