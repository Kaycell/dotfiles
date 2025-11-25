#!/bin/bash
set -e

# Detect Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew already installed."
    exit 0
fi

# Detect OS and install
OS="$(uname -s)"

case "$OS" in
    Darwin*|Linux*)
        echo "Installing Homebrew for $OS"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        ;;
    *)
        echo "Unsupported operating system: $OS"
        exit 1
        ;;
esac

echo "Homebrew installation complete."
