# Altilar Ansible

Ansible scripts for setting up Altilar Linux workstation environments.

## Directory Structure

- `inventory/`: Contains inventory files defining the hosts
- `group_vars/`: Group variables
- `host_vars/`: Host-specific variables
- `playbooks/`: Playbooks for different tasks
- `roles/`: Reusable role definitions

## Usage

To set up a workstation:

```bash
ansible-playbook playbooks/setup_workstation.yml
```

## Requirements

- Ansible 2.10+
- SSH access to target hosts 