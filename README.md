# raspbernetes

Management for bare metal Raspberry Pi cluster running k8s

![Ansible Lint](https://github.com/deploymentking/raspbernetes/workflows/Lint/badge.svg)
![Repo Healthcheck](https://github.com/deploymentking/raspbernetes/workflows/Healthcheck/badge.svg)

## Table of Contents

<!-- toc -->

- [Construct the cluster](#construct-the-cluster)
- [Bootstrap a cluster](#bootstrap-a-cluster)
- [Setup cluster security](#setup-cluster-security)

<!-- tocstop -->

## Construct the cluster

The following bill of materials shows all the different components I used to put the cluster together.

* [Bill of Materials](./docs/BOM.md)

## Bootstrap a cluster

Follow the instructions below to bootstrap a cluster using Ansible. This will setup a cluster via SSH port `22` and using
the default `ubuntu` user with the password configured during the initial install.

* [Bootstrap instructions](./ansible/playbooks/bootstrap/README.md)

## Setup cluster security

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
