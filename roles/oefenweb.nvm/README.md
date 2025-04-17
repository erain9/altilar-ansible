## nvm

[![CI](https://github.com/Oefenweb/ansible-nvm/workflows/CI/badge.svg)](https://github.com/Oefenweb/ansible-nvm/actions?query=workflow%3ACI)
[![Ansible Galaxy](http://img.shields.io/badge/ansible--galaxy-nvm-blue.svg)](https://galaxy.ansible.com/Oefenweb/nvm)

Set up Node Version Manager ([nvm](https://github.com/nvm-sh/nvm)) in Debian-like systems

#### Requirements

* `curl` (will be installed)
* `git` (will be installed)

#### Variables

* `nvm_version` [default: `v0.40.2`]: Version to install
* `nvm_install` [default: `[]`]: (Additional) packages to install (e.g. `build-essential`, `libssl-dev`)
* `nvm_user` [default: `root`]: The user to install nvm for (you want this to be something different than `root`)
* `nvm_shell` [default: `/bin/bash`]: The shell to use to install nvm (changing this to something different is not tested (yet))

## Dependencies

None

## Recommended

* `ansible-bash` ([see](https://github.com/Oefenweb/ansible-bash))

#### Example

```yaml
---
- hosts: all
  roles:
    - oefenweb.nvm
```

#### License

MIT

#### Author Information

Mischa ter Smitten

#### Feedback, bug-reports, requests, ...

Are [welcome](https://github.com/Oefenweb/ansible-nvm/issues)!
