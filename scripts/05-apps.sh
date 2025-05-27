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
  app_path="/Applications/$(echo "$app" | sed 's/-/ /g; s/\b\(.\)/\u\1/g').app"

  if brew list --cask "$app" &>/dev/null; then
    echo "✅ $app already installed via Homebrew"
  elif [ -d "$app_path" ]; then
    echo "✅ $app_path already exists — skipping Homebrew install"
  else
    echo "📦 Installing $app..."
    brew install --cask "$app"
  fi
done

echo "✅ Work applications installed."
