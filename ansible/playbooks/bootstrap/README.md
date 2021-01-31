# Bootstrap Playbook

## Table of Contents

<!-- toc -->

- [Run playbook](#run-playbook)
- [Useful scripts](#useful-scripts)
  * [Disk mount information etc](#disk-mount-information-etc)
- [References](#references)
  * [fstab settings](#fstab-settings)
  * [Swap settings](#swap-settings)
  * [Setting up USB as a bootable operating system](#setting-up-usb-as-a-bootable-operating-system)
  * [Raspberry Pi Settings](#raspberry-pi-settings)

<!-- tocstop -->

## Run playbook

Assuming you are in the root of the project, install the playbook dependencies and run the playbook by running the
following command:

```shell
make bootstrap
```

## Useful scripts

### Disk mount information etc

```shell
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
* [How fstab works](https://linuxconfig.org/how-fstab-works-introduction-to-the-etc-fstab-file-on-linux)
* [Ansible file module](https://docs.ansible.com/ansible/latest/modules/file_module.html)
* [Ansible mount module](https://docs.ansible.com/ansible/latest/modules/mount_module.html#mount-module)

### Swap settings
* [Jeff Geerling](https://github.com/geerlingguy/ansible-role-swap/blob/master/tasks/enable.yml)
* [Roberto Rojas](https://github.com/robertojrojas/kubernetes-the-hard-way-raspberry-pi/blob/master/docs/01-infrastructure.md#swap-optional)
* [Enable swap on Ubuntu](https://tecadmin.net/enable-swap-on-ubuntu/)

### Setting up USB as a bootable operating system
* [New Raspberry Pi 4 Bootloader USB Boot Guide](https://jamesachambers.com/new-raspberry-pi-4-bootloader-usb-network-boot-guide/)
* [Raspberry Pi 4 Ubuntu 20.10 USB Mass Storage Boot Guide](https://jamesachambers.com/raspberry-pi-4-ubuntu-20-04-usb-mass-storage-boot-guide/)
* [Official documentation](https://www.raspberrypi.org/documentation/hardware/raspberrypi/bootmodes/msd.md)
* [Another great article](https://www.zdnet.com/article/booting-my-raspberry-pi-4-from-a-usb-device/)
* [Raspberry Pi USB support documentation](https://www.raspberrypi.org/documentation/hardware/raspberrypi/usb/README.md#support)

### Raspberry Pi Settings
* [Bootloader](https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md)
* [booteeprom](https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md)
* [config.txt (memory)](https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md)
* [Fan control](https://jjj.blog/2020/02/raspberry-pi-poe-hat-fan-control/)
* [Fan control GitHub Issue](https://github.com/raspberrypi/linux/issues/2715)
* [Firmware Overlays](https://github.com/raspberrypi/firmware/blob/master/boot/overlays/README)
