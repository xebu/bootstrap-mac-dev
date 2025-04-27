#!/usr/bin/env zsh
set -e

echo "🛠️  Step 1: Running macOS software updates (this may take a while)..."
sudo softwareupdate -ia --verbose

echo "📦 Step 2: Installing Rosetta for Apple Silicon (if not already installed)..."
sudo softwareupdate --install-rosetta --agree-to-license || true

echo "🧰 Step 3: Installing Xcode Command Line Tools (if not already installed)..."
xcode-select --install 2>/dev/null || echo "✅ Xcode Command Line Tools already installed"
