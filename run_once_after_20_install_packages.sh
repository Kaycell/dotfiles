#!/bin/bash
set -euo pipefail

{{ if (and (eq .chezmoi.os "darwin") (eq .chezmoi.arch "arm64")) }}
HOMEBREW_PREFIX="/opt/homebrew"
{{ else if eq .chezmoi.os "linux" }}
HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
{{ else }}
echo "Unsupported operating system" >&2
exit 1
{{ end }}

BREWFILE="$HOME/.config/homebrew/Brewfile"

if [ ! -f "$BREWFILE" ]; then
    echo "Brewfile not found at $BREWFILE" >&2
    exit 1
fi

echo "Installing packages from Brewfile..."
$HOMEBREW_PREFIX/bin/brew bundle --file="$BREWFILE"

echo "Package installation complete."
