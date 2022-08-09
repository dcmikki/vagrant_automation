# Docker Swarm Alpine images
This Vagrant stack deploys a docker swarm with one manager and one workerusing the libvirt virtualization API.

## Vagrantfile
Minimal deployment in the swarm stack.

* 1 node manager
* 1 node worker

Easy to add more managers and workers on demand if its necessarry, but It depends of the hardware limitation of the host (memory and cpu's)


## Initiate Swarm

Running the follow command in the node manager.

```
manager01:~# docker swarm init --advertise-addr 192.168.122.121

Swarm initialized: current node (psik00b30725ftslno8y73jaz) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-32ivrrcyetune8lk5shm08kj5rlgm036v4yxarh79oyfeucolt-cu7k5pplccq353uwk85drp6s9 192.168.122.121:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.

```

NOTE: If you deploy more managers the first manager will become as the leader.

### Add node worker to swarm
```
worker01:~$ docker swarm join --token 
SWMTKN-1-32ivrrcyetune8lk5shm08kj5rlgm036v4yxarh79oyfeucolt-cu7k5pplccq353uwk85drp6s9 192.168.122.121:2377
This node joined a swarm as a worker.
```

### Check swarm cluster

From one of the node managers:
```
manager01:~$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
kn7tmeeofbpjgbptxidcb052y *   manager01           Ready               Active              Leader              18.06.1-ce
8eo5w0mebsx5b8n75s9sbd41m     worker01            Ready               Active                                  18.06.1-ce
manager01:~$ 

```

### How to add more managers / workers
Get unique tokens from leader manager, using docker commands

* `docker swarm join-token manager`
* `docker swarm join-token worker`
