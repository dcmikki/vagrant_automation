# Minikube CentOS 7
This Vagrant stack deploys minikube, kubectl and helm on the CentOS7 (guest) using docker as driver.

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
😄  minikube v1.26.0 on Linuxmint 20.3
✨  Using the kvm2 driver based on user configuration
👍  Starting control plane node minikube in cluster minikube
🔥  Creating kvm2 VM (CPUs=4, Memory=4400MB, Disk=10000MB) ...
🐳  Preparing Kubernetes v1.24.1 on Docker 20.10.16 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

```
