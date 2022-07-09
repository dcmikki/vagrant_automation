#!/usr/bin/env bash

yum install -y epel-release vim tree htop net-tools bash-completion wget zip unzip jq

rm -rf /usr/local/bin/terraform

wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
sleep 3

unzip -d /usr/local/bin/ terraform_0.12.24_linux_amd64.zip
rm terraform_0.12.24_linux_amd64.zip

/usr/local/bin/terraform version

