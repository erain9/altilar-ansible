# Altilar Ansible

Ansible scripts for setting up Altilar Linux workstation environments.

## Directory Structure

- `inventory/`: Contains inventory files defining the hosts
- `group_vars/`: Group variables
- `host_vars/`: Host-specific variables
- `playbooks/`: Playbooks for different tasks
- `roles/`: Reusable role definitions
- `requirements.yml`: External dependencies from Ansible Galaxy

## Usage

Test connectivity to your workstations:

```bash
ansible-playbook playbooks/test_connectivity.yml
```

Install developer tools on your workstations:

```bash
ansible-playbook playbooks/install_dev_tools.yml
```

Install diagnostic and hardware tools:

```bash
ansible-playbook playbooks/install_diagnostic_tools.yml
```

Set up a complete workstation:

```bash
ansible-playbook playbooks/setup_workstation.yml
```

## Using Ansible Galaxy

This project uses Ansible Galaxy for external dependencies. Install dependencies with:

```bash
ansible-galaxy install -r requirements.yml
```

Or use the convenience playbook:

```bash
ansible-playbook playbooks/install_galaxy_dependencies.yml
```

View installed roles and collections:

```bash
ansible-playbook playbooks/use_galaxy_roles.yml
```

## Requirements

- Ansible 2.10+
- SSH access to target hosts 