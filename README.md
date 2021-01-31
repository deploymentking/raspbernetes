# raspbernetes

Management for bare metal Raspberry Pi cluster running k8s.

![Ansible Lint](https://github.com/deploymentking/raspbernetes/workflows/Lint/badge.svg)
![Repo Healthcheck](https://github.com/deploymentking/raspbernetes/workflows/Healthcheck/badge.svg)

## Table of Contents

<!-- toc -->

- [Order of play](#order-of-play)
- [Construct the cluster](#construct-the-cluster)
- [Have you Pi and eat it](#have-you-pi-and-eat-it)
- [Bootstrap the cluster](#bootstrap-the-cluster)
- [Secure the cluster](#secure-the-cluster)

<!-- tocstop -->

## Order of play

There is a combination of manual setup and automated setup as the entire process cannot be automated completely. This is
because once we have secured the cluster the SSH port and user change, which means you cannot run the bootstrap once the
cluster has been secured.

The running order is as follows:
* Construct the cluster using Raspbian OS installed onto SD cards, ensure all the nodes are networked and accessible
* Flash a copy of Ubuntu onto a set of USB disks and plug the disks into the nodes
* Use the Raspbian OS to prepare the USB disks appropriately
* Once the USB disks are prepped, remove the SD cards and reboot
* Bootstrap the new cluster using the first Ansible playbook, this also sets up the security of the cluster
* Test the cluster security using the second Ansible playbook
* At this point you have an empty set of nodes, ready to have kubernetes installed onto them.

## Construct the cluster

The following bill of materials shows all the different components I used to put the cluster together.

* [Bill of Materials](./docs/BOM.md)

## Have you Pi and eat it

Now it is possible to boot a Raspberry Pi from a USB drive, follow the instructions below to install the Ubuntu
operating system onto the USB disks and prepare the Pi to boot onto that USB.

* [Preparation instructions](./ansible/playbooks/vanilla_pi/README.md)

## Bootstrap the cluster

Follow the instructions below to bootstrap a cluster using Ansible. The high level order

* [Bootstrap instructions](./ansible/playbooks/bootstrap/README.md)

## Secure the cluster

This playbook requires a "double-tap" in which the SSH port is changed from the default value of `22`. It will be
necessary to amend the SSH port in the playbook vars file to 22 and then reset back to the custom value `2288`. To make
connecting to the cluster easier, consider adding some SSH settings like below to your config file. The vars files are
used to make this process easier. When creating a new cluster without any entries in the `~/.ssh/config` file

```
Host RASPBERNETES_GROUP
  Host 192.168.0.*
    User raspbernetes
    Port 2288
    IdentityFile /Users/username/.ssh/raspbernetes_rsa
```

* [Security instructions](./ansible/playbooks/security/README.md)
