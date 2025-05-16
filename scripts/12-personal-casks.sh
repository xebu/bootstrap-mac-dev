#!/usr/bin/env bash
set -e

# Prompt for admin password upfront
sudo -v

echo "🎵 Installing personal apps..."
brew install --cask \
  whatsapp \
  discord \
  signal \
  zoom \
  spotify \
  nordvpn
