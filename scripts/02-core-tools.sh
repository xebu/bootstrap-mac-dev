#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs core CLI tools and language environments:
# - NVM (Node.js LTS)
# - SDKMAN (for Java/Scala SDKs)
# - Homebrew CLI utilities (git, fzf, jq, etc.)
# ------------------------------------------------------------------------------

set -euo pipefail

init_nvm() {
  export NVM_DIR="$HOME/.nvm"
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    source "$NVM_DIR/nvm.sh"
    declare -f nvm >/dev/null && return 0
  fi
  return 1
}

init_sdkman() {
  if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    # shellcheck source=/dev/null
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    declare -f sdk >/dev/null && return 0
  fi
  return 1
}

# Install NVM if not available
if ! init_nvm; then
  echo "📦 Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  init_nvm || { echo "❌ Failed to initialize NVM"; exit 1; }
else
  echo "✅ NVM already installed"
fi

echo "🔧 Installing Node.js (LTS)..."
nvm install --lts
nvm use --lts

# Install SDKMAN if not available
if ! init_sdkman; then
  echo "📦 Installing SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
  init_sdkman || { echo "❌ Failed to initialize SDKMAN"; exit 1; }
else
  echo "✅ SDKMAN already installed"
fi

echo "🔧 Verifying SDKMAN..."
sdk version

echo "🔧 Installing core CLI tools and languages with Homebrew..."

brew install \
  git \
  neovim \
  vim \
  bat \
  delta \
  eza \
  tldr \
  tree \
  curl \
  wget \
  jq \
  httpie \
  duf \
  shfmt \
  gnupg \
  go \
  git-lfs \
  thefuck \
  fzf \
  zoxide \
  gh \
  direnv \
  openssl@3

echo "🆙 Upgrading Git..."
brew upgrade git

echo "✅ Core tools, Node.js, Go, and SDKMAN installed."
