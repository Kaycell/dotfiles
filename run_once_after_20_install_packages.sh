#!/bin/bash
set -euo pipefail

# Detect Homebrew
if ! command -v brew >/dev/null 2>&1; then
    echo "Error: Homebrew is not installed." >&2
    exit 1
fi

BREWFILE="$XDG_CONFIG_HOME/homebrew/Brewfile"

if [ ! -f "$BREWFILE" ]; then
    echo "Brewfile not found at $BREWFILE" >&2
    exit 1
fi

echo "Installing packages from Brewfile..."
brew bundle --file="$BREWFILE"

echo "Package installation complete."
