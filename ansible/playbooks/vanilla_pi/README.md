# Vanilla Pi Playbook

## Table of Contents

<!-- toc -->

- [Run playbook](#run-playbook)
- [Useful Scripts](#useful-scripts)
  * [Check USB system messages](#check-usb-system-messages)
- [References](#references)
  * [Setting up USB as a bootable operating system](#setting-up-usb-as-a-bootable-operating-system)
  * [Raspberry Pi Settings](#raspberry-pi-settings)

<!-- tocstop -->

## Run playbook

To install the playbook dependencies, run the following command

`ansible-galaxy install -r requirements.yml`

Then run the full playbook, like this:

`ansible-playbook -i inventories/hosts site.yml`

## Useful Scripts

### Check USB system messages

```shell
dmesg -w -T
```

## References

### Setting up USB as a bootable operating system
* [New Raspberry Pi 4 Bootloader USB Boot Guide](https://jamesachambers.com/new-raspberry-pi-4-bootloader-usb-network-boot-guide/)
* [Raspberry Pi 4 Ubuntu 20.10 USB Mass Storage Boot Guide](https://jamesachambers.com/raspberry-pi-4-ubuntu-20-04-usb-mass-storage-boot-guide/)

### Raspberry Pi Settings
* [Bootloader](https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2711_bootloader_config.md)
* [booteeprom](https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md)
* [config.txt (memory)](https://www.raspberrypi.org/documentation/configuration/config-txt/memory.md)
