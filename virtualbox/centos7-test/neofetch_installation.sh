#!/usr/bin/env bash

yum -y install dnf
dnf -y install dnf-plugins-core
dnf -y copr enable konimex/neofetch
dnf -y install neofetch