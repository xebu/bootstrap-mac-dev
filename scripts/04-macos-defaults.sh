#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Applies personal macOS system defaults:
# - Finder preferences
# - Dock behavior and layout
# - Menu bar items
# - Clock and battery display
# ------------------------------------------------------------------------------

set -euo pipefail

echo "⚙️ Applying macOS system defaults..."

# -------------------------------
# Finder settings
# -------------------------------
echo "🪟 Configuring Finder..."
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder QuitMenuItem -bool true

# -------------------------------
# Dock settings
# -------------------------------
echo "🧭 Configuring Dock..."
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true

# -------------------------------
# Menu bar: icons and indicators
# -------------------------------
echo "📶 Showing common menu bar items..."
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/Displays.menu" \
  "/System/Library/CoreServices/Menu Extras/Volume.menu"

# -------------------------------
# Battery and clock display
# -------------------------------
echo "🔋 Configuring battery and clock..."
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H.mm"

# -------------------------------
# System scrollbars
# -------------------------------
echo "🖱️ Setting scrollbars to always show..."
defaults write -g AppleShowScrollBars -string "Always"

# -------------------------------
# Restart affected services
# -------------------------------
echo "♻️ Restarting UI services to apply changes..."
killall Dock
killall Finder
killall SystemUIServer

echo "✅ macOS defaults applied successfully"
