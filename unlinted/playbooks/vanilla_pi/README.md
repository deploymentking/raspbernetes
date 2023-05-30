# Vanilla Pi Playbook

The only purpose of this playbook is to install a helper script onto the Raspbian OS. It is not needed in the Ubuntu OS.

## Table of Contents

<!-- toc -->

- [Run playbook](#run-playbook)
- [Useful Scripts](#useful-scripts)
  * [Check USB system messages](#check-usb-system-messages)

<!-- tocstop -->

## Run playbook

Then run the full playbook (assuming you are in the root of the project), like this:

```shell
make vanilla
```

## Useful Scripts

### Check USB system messages

```shell
dmesg -w -T
```
