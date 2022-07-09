# vagrant_automation

Quick Vagrant deployment for provisioner KVM (libvirt) and Virtualbox

## KVM / Libvirt
This Vagrant plugin adds a Libvirt provider (KVM) to Vagrant, allowing Vagrant to control and provision machines via Libvirt toolkit.


### Verify processor support for hardware virtualization
```
$ egrep -c ‘(svm|vmx)’ /proc/cpuinfo
4

$ grep --color --perl-regexp 'vmx|svm' /proc/cpuinfo


$ sudo apt install cpu-checker
$ sudo kvm-ok

INFO: /dev/kvm exists
KVM acceleration can be used

```

### Install Vagrant
* https://www.vagrantup.com/docs/installation

```
$ vagrant version
Installed Version: 2.2.19                                             
Latest Version: 2.2.19
                      
You're running an up-to-date version of Vagrant!

```

### Install QEMU-KVM and Libvirt
* Debian / Ubuntu
```
sudo apt install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

# Add user to libvirt and kvm group
$ sudo usermod -aG libvirt $username
$ sudo usermod -aG kvm $username
```

* CentOS / Fedora
```
$ sudo dnf update 
$ sudo dnf groupinstall "Virtualization Host"

$ sudo systemctl status libvirtd
$ sudo dnf install virt-install
```

* Check QEMU / libvirt installation

```
$ sudo virsh --version
4.0.0                                                      

$ virsh list --all                                                                             
 
 Id    Name                         State 
----------------------------------------------------                 
 -     alpine316                    shut off
 -     debian11                     shut off
 -     rockylinux                   shut off
 -     freebsd13.1-RELEASE          shut off
```

Once you have Vagrant and KVM installed, you should be ready to install a libvirt plugin so that you can start managing KVM Virtual machines using Vagrant

### Install vagrant plugins
The minimal plugin required is `vagrant-libvirt`
```
$ vagrant plugin install vagrant-libvirt
$ vagrant plugin install vagrant-reload

$ vagrant plugin list
vagrant-libvirt (0.9.0, global)                                
  - Version Constraint: > 0
vagrant-reload (0.0.1, global)                                                                                    
  - Version Constraint: > 0                                   
```

### Start VM

Default provider is Virtualbox so Vagarnt need to knoe that we want to set `Libvirt` 

```shell
$ vagrant up --provider=libvirt
```

Setup environment variable:
```shell
export VAGRANT_DEFAULT_PROVIDER=libvirt
```

### Links
* https://www.vagrantup.com/docs/installation
* https://github.com/vagrant-libvirt/vagrant-libvirt
* https://phoenixnap.com/kb/ubuntu-install-kvm
* https://linuxhint.com/install_kvm_qemu_centos_8/
* Vagrant boxes --> https://app.vagrantup.com/boxes/search?provider=libvirt

