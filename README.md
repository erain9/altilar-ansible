# Altilar Ansible

Ansible scripts for setting up Altilar Linux workstation environments.

## Directory Structure

- `inventory/`: Contains inventory files defining the hosts
- `group_vars/`: Group variables
- `host_vars/`: Host-specific variables
- `playbooks/`: Playbooks for different tasks
- `roles/`: Reusable role definitions

## Usage

Test connectivity to your workstations:

```bash
ansible-playbook playbooks/test_connectivity.yml
```

Install developer tools on your workstations:

```bash
ansible-playbook playbooks/install_dev_tools.yml
```

Set up a complete workstation:

```bash
ansible-playbook playbooks/setup_workstation.yml
```

## Requirements

- Ansible 2.10+
- SSH access to target hosts 