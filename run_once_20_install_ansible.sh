#!/bin/bash
set -e

# Detect ansible
if command -v ansible >/dev/null 2>&1; then
    echo "Ansible already installed."
    exit 0
fi

# Detect OS and install
OS="$(uname -s)"

case "$OS" in
    Darwin*)
        if ! command -v brew >/dev/null 2>&1; then
            echo "Error: Homebrew is not installed, cannot install Ansible on macOS." >&2
            exit 1
        fi
        echo "Installing Ansible via Homebrew on macOS"
        brew install ansible
        ;;
    Linux*)
        # Basic Debian/Ubuntu support; extend if you use other distros
        if command -v apt >/dev/null 2>&1; then
            echo "Installing Ansible via apt on Linux"
            sudo apt-get update
            sudo apt-get install -y ansible
        else
            echo "Error: Unsupported Linux distribution (no apt found) for automatic Ansible install." >&2
            exit 1
        fi
        ;;
    *)
        echo "Unsupported operating system: $OS" >&2
        exit 1
        ;;
esac

echo "Ansible installation complete."
