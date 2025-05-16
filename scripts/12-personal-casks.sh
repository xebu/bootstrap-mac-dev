#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs personal-use macOS applications via Homebrew Cask:
# - Messaging: WhatsApp, Discord, Signal
# - Media & Meetings: Zoom, Spotify, VLC
# - VPN: NordVPN
# ------------------------------------------------------------------------------

set -euo pipefail

# Prompt for admin password early
sudo -v

echo "🎵 Installing personal-use applications..."

apps=(
  whatsapp
  discord
  signal
  zoom
  spotify
  nordvpn
  vlc
)

for app in "${apps[@]}"; do
  if brew list --cask "$app" &>/dev/null; then
    echo "✅ $app already installed"
  else
    echo "📦 Installing $app..."
    brew install --cask "$app"
  fi
done

echo "✅ Personal applications installed."
