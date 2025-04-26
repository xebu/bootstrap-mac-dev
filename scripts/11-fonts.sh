#!/usr/bin/env zsh
set -e

echo "🔤 Installing fonts..."

# Install JetBrains Mono and Nerd Font version
brew install --cask font-jetbrains-mono font-jetbrains-mono-nerd-font

# Install Geist Mono via Homebrew (if available)
brew install --cask font-geist-mono

echo "✅ Fonts installed."
