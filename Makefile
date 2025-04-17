.PHONY: all install install-no-pass setup deps deps-ignore check check-no-pass install-basic install-docker install-dev-tools install-nvm install-all help

# Default target
all: help

# Variables
ANSIBLE_PLAYBOOK = ansible-playbook
INVENTORY = inventory/hosts
WORKSTATION_PLAYBOOK = playbooks/setup_workstation.yml
ANSIBLE_OPTS = -K
ANSIBLE_OPTS_NO_PASS = 

# Install everything on workstation (with password prompt)
install: deps
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS)

# Install everything on workstation (no password prompt)
install-no-pass: deps
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS)

# Install with ignoring dependency errors
install-ignore-deps: deps-ignore
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS)

# Install with ignoring dependency errors (no password prompt)
install-ignore-deps-no-pass: deps-ignore
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS)

# Setup only specific roles by tags
setup:
	@echo "Usage: make setup TAGS=tag1,tag2"
	@if [ -n "$(TAGS)" ]; then \
		$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS) --tags $(TAGS); \
	fi

# Setup only specific roles by tags (no password prompt)
setup-no-pass:
	@echo "Usage: make setup-no-pass TAGS=tag1,tag2"
	@if [ -n "$(TAGS)" ]; then \
		$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS) --tags $(TAGS); \
	fi

# Install dependencies
deps:
	ansible-galaxy install -r requirements.yml

# Install dependencies with ignore-errors flag
deps-ignore:
	ansible-galaxy install -r requirements.yml --ignore-errors

# Run a check without making changes
check:
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS) --check

# Run a check without making changes (no password prompt)
check-no-pass:
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS) --check

# Setup only zsh and basic tools (no password prompt)
install-basic:
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS) --tags basic,zsh,shell

# Setup only Docker (no password prompt)
install-docker:
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS) --tags docker,container

# Setup only dev tools (no password prompt)
install-dev-tools:
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS) --tags dev,tools

# Setup only NVM (Node.js) with error handling
install-nvm:
	$(ANSIBLE_PLAYBOOK) $(WORKSTATION_PLAYBOOK) -i $(INVENTORY) $(ANSIBLE_OPTS_NO_PASS) --tags node,javascript,web

# Full installation broken into steps to avoid permission issues
install-all: install-basic install-dev-tools install-docker install-nvm
	@echo "All components installed successfully"

# Display help information
help:
	@echo "Altilar Ansible Workstation Setup"
	@echo ""
	@echo "Usage:"
	@echo "  make install                    Install everything (with password prompt)"
	@echo "  make install-no-pass            Install everything (no password prompt)"
	@echo "  make install-ignore-deps        Install ignoring dependency errors (with password)"
	@echo "  make install-ignore-deps-no-pass Install ignoring dependency errors (no password)"
	@echo "  make setup TAGS=x               Setup specific components (with password)"
	@echo "  make setup-no-pass TAGS=x       Setup specific components (no password)"
	@echo "  make deps                       Install required Ansible dependencies"
	@echo "  make deps-ignore                Install dependencies, ignoring errors"
	@echo "  make check                      Run a check (with password prompt)"
	@echo "  make check-no-pass              Run a check (no password prompt)"
	@echo "  make install-basic              Install zsh and basic tools (no password prompt)"
	@echo "  make install-docker             Install Docker (no password prompt)"
	@echo "  make install-dev-tools          Install dev tools (no password prompt)"
	@echo "  make install-nvm                Install NVM (Node.js)"
	@echo "  make install-all                Install all components"
	@echo "  make help                       Display this help message"
	@echo ""
	@echo "Note: Commands with '-no-pass' don't prompt for sudo password" 