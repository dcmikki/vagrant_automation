#!/usr/bin/env bash

sed -i 's/-H fd:\/\/*/-H fd:\/\/ -H tcp:\/\/192.168.56.101:2375/' /usr/lib/systemd/system/docker.service | grep ExecStart
systemctl daemon-reload
systemctl restart docker
systemctl status docker

# Initialite Docker Swarm
docker swarm init --advertise-addr 192.168.56.101
docker node ls

