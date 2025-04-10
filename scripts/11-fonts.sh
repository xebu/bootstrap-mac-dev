#!/usr/bin/env zsh
set -e

echo "🔤 Installing fonts..."

# Install JetBrains Mono and Nerd Font version
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono font-jetbrains-mono-nerd-font

# Install Geist Mono via Homebrew (if available)
brew tap felixrieseberg/tap
brew install --cask font-geist-mono

echo "✅ Fonts installed."
