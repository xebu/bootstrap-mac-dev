#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs Homebrew and initializes it for the current shell session (Apple Silicon compatible)
# ------------------------------------------------------------------------------

set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "🍺 Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "✅ Homebrew already installed"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"
