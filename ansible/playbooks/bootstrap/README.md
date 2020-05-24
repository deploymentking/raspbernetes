# Bootstrap Playbook

## Table of Contents

<!-- toc -->

- [Run playbook](#run-playbook)
- [Useful scripts](#useful-scripts)
  * [Disk mount information etc](#disk-mount-information-etc)
- [References](#references)
  * [fstab settings](#fstab-settings)
  * [Swap settings](#swap-settings)

<!-- tocstop -->

## Run playbook

To install the playbook dependencies, run the following command

`ansible-galaxy install -r requirements.yml`

Then run the full playbook, like this:

`ansible-playbook -i inventories/raspberry_pi/hosts site.yml`

## Useful scripts

### Disk mount information etc

```bash
# View contents of fstab
cat /etc/fstab

# List block devices
sudo lsblk -d -fs /dev/sda1

# Command-line utility to locate/print block device attributes
sudo blkid -o list

# Partition table manipulator for Linux
sudo fdisk -l

# Unmount a device
umount -l /dev/sda1
```

## References

### fstab settings
[How fstab works](https://linuxconfig.org/how-fstab-works-introduction-to-the-etc-fstab-file-on-linux)
[Ansible file module](https://docs.ansible.com/ansible/latest/modules/file_module.html)
[Ansible mount module](https://docs.ansible.com/ansible/latest/modules/mount_module.html#mount-module)

### Swap settings
[Jeff Geerling](https://github.com/geerlingguy/ansible-role-swap/blob/master/tasks/enable.yml)
[Roberto Rojas](https://github.com/robertojrojas/kubernetes-the-hard-way-raspberry-pi/blob/master/docs/01-infrastructure.md#swap-optional)
[Enable swap on Ubuntu](https://tecadmin.net/enable-swap-on-ubuntu/)
