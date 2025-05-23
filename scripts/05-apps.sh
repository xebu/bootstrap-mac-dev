#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs work-related GUI applications via Homebrew Cask:
# - Terminals, IDEs, productivity, dev tools, utilities
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🧩 Installing work-related GUI apps via Homebrew Cask..."

apps=(
  google-chrome
  github
  slack
  visual-studio-code
  iterm2
  rectangle
  obsidian
  alfred
  insomnia
  firefox
  firefox@developer-edition
  ghostty
  caffeine
  jetbrains-toolbox
  # logi-options-plus
  # gpg-suite
)

for app in "${apps[@]}"; do
  if brew list --cask "$app" &>/dev/null; then
    echo "✅ $app already installed"
  else
    echo "📦 Installing $app..."
    brew install --cask "$app"
  fi
done

echo "✅ Work applications installed."
