# Minikube
This Vagrant stack deploys minikube, kubectl and helm on the Rocky8 (guest) using docker as driver.

## Using Linux KVM (Kernel-based Virtual Machine) driver
It's quicker to deploy minikube using the KVM driver instead to spin up and provision a centos7 machine. To work with KVM, minikube uses the libvirt virtualization API.


### Requirements
* libvirt v1.3.1 or higher
* qemu-kvm v2.0 or higher

### Installing Prerequisites
* Proper installation of KVM and libvirt
* https://github.com/dcmikki/vagrant_automation#install-qemu-kvm-and-libvirt


Once configured, validate that libvirt reports no errors:

`virt-host-validate`

### Usage
Start a cluster using the kvm2 driver:

```
minikube start --driver=kvm2 --cpus=4 --memory=4400mb --disk-size=10000mb
```

```Example
$ minikube start --driver=kvm2 --cpus=4 --memory=4400mb --disk-size=10000mb
😄  minikube v1.35.0 on Rocky 8.9
✨  Using the docker driver based on user configuration
✨  Using Docker driver with root privileges
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🔥  Pulling base image v0.0.46 ...
🔥  Creating docker container (CPUs=4, Memory=6500MB) ...
🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🐳  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```


### Kubernetes Service Cluster
```bash
$ kubectl get po -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS        AGE
kube-system   coredns-668d6bf9bc-mcvcf           1/1     Running   0               5m43s
kube-system   etcd-minikube                      1/1     Running   0               5m49s
kube-system   kube-apiserver-minikube            1/1     Running   0               5m51s
kube-system   kube-controller-manager-minikube   1/1     Running   0               5m49s
kube-system   kube-proxy-n5jjn                   1/1     Running   0               5m44s
kube-system   kube-scheduler-minikube            1/1     Running   0               5m49s
kube-system   storage-provisioner                1/1     Running   1 (5m12s ago)   5m48s
```

### Minikube and Kubectl Ahutocompletion
For bash users add the following lines in `~/.bashrc`:

```autocompletion
source <(minikube completion bash)
source <(kubectl completion bash)
```
