#!/usr/bin/env bash
set -e

echo "🍺 Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || echo "✅ Homebrew already installed"

echo "🔁 Setting up Homebrew in shell environment..."
eval "$(/opt/homebrew/bin/brew shellenv)"
