#!/usr/bin/env zsh
set -e

echo "⚙️ Applying macOS system defaults..."

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0
defaults write com.apple.dock tilesize -int 36
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write -g AppleShowScrollBars -string "Always"

killall Dock
killall Finder
killall SystemUIServer

echo "✅ macOS defaults applied"
