SHELL := /usr/bin/env bash
POETRY_OK := $(shell type -P poetry)
PYTHON_OK := $(shell type -P python)
PYTHON_VERSION := $(shell python -V | cut -d' ' -f2)
PYTHON_REQUIRED := $(shell cat .python-version)
ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

help: ## The help text you are reading
	@grep --no-filename -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

check_poetry: check_python ## Check Poetry installation
    ifeq ('$(POETRY_OK)','')
	    $(error package 'poetry' not found!)
    else
	    @echo Found poetry!
    endif

check_python: ## Check Python installation
    ifeq ('$(PYTHON_OK)','')
	    $(error python interpreter: 'python' not found!)
    else
	    @echo Found Python
    endif
    ifneq ('$(PYTHON_REQUIRED)','$(PYTHON_VERSION)')
	    $(error incorrect version of python found: '${PYTHON_VERSION}'. Expected '${PYTHON_REQUIRED}'!)
    else
	    @echo Found Python ${PYTHON_REQUIRED}
    endif

reset: ## Teardown tooling
	rm -rfv ./.venv poetry.lock
.PHONY: reset

setup: check_poetry ## Setup virtualenv & dependencies using Poetry
	export POETRY_VIRTUALENVS_IN_PROJECT=true && poetry run pip install --upgrade pip
	poetry update
	poetry install --no-root
	python --version
.PHONY: setup

bootstrap: setup ## Run Ansible against inventory in bootstrap folder
	cd ./ansible/playbooks/bootstrap/ && ansible-playbook site.yml
.PHONY: bootstrap

security: ## Run Ansible against inventory in security folder
	cd ./ansible/playbooks/security/ && ansible-playbook site.yml
.PHONY: security

healthcheck: ## Check host health
	ansible all --module-name ping --inventory ./ansible/playbooks/bootstrap/inventories/hosts --private-key ~/.ssh/raspbernetes_rsa
	ansible all --args "df -h" --inventory ./ansible/playbooks/bootstrap/inventories/hosts --private-key ~/.ssh/raspbernetes_rsa
	ansible all --args "free -m" --inventory ./ansible/playbooks/bootstrap/inventories/hosts --private-key ~/.ssh/raspbernetes_rsa
.PHONY: healthcheck

reboot: ## Check host health
	ansible all --module-name shell -a "sleep 1s; shutdown -r now" --become --background 60 --poll 0 --inventory ./ansible/playbooks/bootstrap/inventories/hosts --private-key ~/.ssh/raspbernetes_rsa
.PHONY: healthcheck

shutdown: ## Check host health
	ansible all --module-name shell -a "sleep 1s; shutdown -h now" --become --background 60 --poll 0 --inventory ./ansible/playbooks/bootstrap/inventories/hosts --private-key ~/.ssh/raspbernetes_rsa
.PHONY: healthcheck
