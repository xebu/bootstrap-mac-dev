#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs developer-friendly fonts using Homebrew:
# - Includes JetBrains Mono, Geist Mono, Nerd Fonts, and other popular dev fonts
# - Commented options allow toggling based on personal preference
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🔤 Installing fonts..."

fonts=(
  font-jetbrains-mono
  font-jetbrains-mono-nerd-font
  font-geist-mono
  font-fira-code                    # Popular ligature-rich dev font
  font-hack-nerd-font               # Clean and compact, great for terminals
  font-cascadia-code-pl             # Microsoft’s dev font with Powerline support
  font-meslo-lg-nerd-font           # Recommended by Powerlevel10k
)

# Optional / Commented suggestions:
# font-source-code-pro             # Adobe’s well-balanced dev font
# font-iosevka                     # Highly customizable; great for long lines
# font-victor-mono                 # Aesthetic, italic-heavy dev font
# font-ibm-plex-mono               # Elegant and accessible

for font in "${fonts[@]}"; do
  if brew list --cask "$font" &>/dev/null; then
    echo "✅ $font already installed"
  else
    echo "📦 Installing $font..."
    brew install --cask "$font"
  fi
done

echo "✅ Fonts installed."
