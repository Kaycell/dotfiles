#!/bin/bash
set -e

PLAYBOOK="$HOME/.config/ansible/local.yml"
ANSIBLE_CFG="$HOME/.config/ansible/ansible.cfg"

if ! command -v ansible-playbook >/dev/null 2>&1; then
    echo "Ansible is not installed, skipping Ansible playbook." >&2
    exit 0
fi

if [ ! -f "$PLAYBOOK" ]; then
    echo "Ansible playbook $PLAYBOOK not found, skipping." >&2
    exit 0
fi

if [ -f "$ANSIBLE_CFG" ]; then
    export ANSIBLE_CONFIG="$ANSIBLE_CFG"
fi

OS="$(uname -s)"

case "$OS" in
    Darwin*)
        echo "Running Ansible local playbook (macOS): $PLAYBOOK"
        ansible-playbook "$PLAYBOOK"
        ;;
    Linux*)
        echo "Running Ansible local playbook (Linux) with sudo: $PLAYBOOK"
        ansible-playbook "$PLAYBOOK" --ask-become-pass
        ;;
    *)
        echo "Unsupported OS for Ansible playbook: $OS" >&2
        exit 0
        ;;
esac
