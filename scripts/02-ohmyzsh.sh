#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs Oh My Zsh, Powerlevel10k theme, and common Zsh plugins:
# - zsh-autosuggestions
# - zsh-syntax-highlighting
# Also updates .zshrc unless dotfile management is detected
# ------------------------------------------------------------------------------

set -euo pipefail

echo "💡 Installing Oh My Zsh..."

if [ -d "$HOME/.oh-my-zsh" ]; then
  echo "✅ Oh My Zsh already installed."
else
  RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "✅ Oh My Zsh installation complete."
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

echo "🔌 Installing Zsh plugins..."

# zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "📦 Installing zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "✅ zsh-autosuggestions already installed."
fi

# zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "📦 Installing zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "✅ zsh-syntax-highlighting already installed."
fi

echo "🎨 Installing Powerlevel10k theme..."

# powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "📦 Installing Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "✅ Powerlevel10k already installed."
fi

# Update .zshrc unless dotfile manager or symlink detected
ZSHRC="$HOME/.zshrc"

if [ -L "$ZSHRC" ] || command -v yadm >/dev/null || command -v chezmoi >/dev/null; then
  echo "⚠️  Skipping .zshrc changes — dotfile management or symlink detected"
else
  if ! grep -q '^ZSH_THEME="powerlevel10k/powerlevel10k"' "$ZSHRC"; then
    echo '🎨 Setting Powerlevel10k as default theme...'
    sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\\/powerlevel10k"/' "$ZSHRC"
  fi

  if ! grep -q 'zsh-autosuggestions' "$ZSHRC"; then
    echo '🔌 Enabling recommended plugins...'
    sed -i '' 's/^plugins=.*/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' "$ZSHRC"
  fi
fi

echo "✅ Oh My Zsh setup complete: plugins and theme installed."
