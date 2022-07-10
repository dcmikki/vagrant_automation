# Minikube CentOS 7
This Vagrant stack deploys minikube, kubectl and helm on the CentOS7 (guest) using docker as driver.





Quick Vagrant deployment for provisioner KVM (libvirt) and Virtualbox

## Using Linux KVM (Kernel-based Virtual Machine) driver
It's quicker to deploy minikube using the KVM driver instead to spin up and provision a centos7 machine. To work with KVM, minikube uses the libvirt virtualization API.


### Requirements
* libvirt v1.3.1 or higher
* qemu-kvm v2.0 or higher

### Installing Prerequisites
* Proper installation of KVM and libvirt
* https://github.com/dcmikki/vagrant_automation#install-qemu-kvm-and-libvirt


    ArchLinux
    Debian
    Fedora
    Gentoo
    OpenSUSE
    RedHat
    Ubuntu

Once configured, validate that libvirt reports no errors:

virt-host-validate

Usage

Start a cluster using the kvm2 driver:

minikube start --driver=kvm2

To make kvm2 the default driver:






