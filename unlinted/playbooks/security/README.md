# Security Playbook

## Table of Contents

<!-- toc -->

- [Run playbook](#run-playbook)
- [Useful scripts](#useful-scripts)
  * [User and SSH information](#user-and-ssh-information)
- [References](#references)
  * [Ansible settings](#ansible-settings)
  * [Security information](#security-information)

<!-- tocstop -->

## Run playbook

To install the playbook dependencies, run the following command

`ansible-galaxy install -r requirements.yml`

Then run the full playbook, like this:

```bash
cd ansible/playbooks/security
ansible-playbook -i inventories/hosts site.yml
```

## Useful scripts

### User and SSH information

```bash
# List configuration files for APT
ls -la /etc/apt/apt.conf.d/

# Show the SSH configuration
cat /etc/ssh/sshd_config

# Show the users that can sudo
cat /etc/sudoers
```

## References

### Ansible settings
* [Ansible user module](https://docs.ansible.com/ansible/latest/modules/user_module.html)

### Security information
* [Jeff Geerling Security Role](https://github.com/geerlingguy/ansible-role-security)
* [Ubuntu Unattended Upgrades](https://help.ubuntu.com/community/AutomaticSecurityUpdates)
* [Helpful Ansible SSH Article](https://medium.com/@khandelwal12nidhi/setup-ssh-key-and-initial-user-using-ansible-playbook-61eabbb0dba4)
