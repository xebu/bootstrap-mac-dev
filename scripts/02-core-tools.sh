#!/usr/bin/env zsh
set -e

echo "📦 Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"

echo "🔧 Installing Node.js..."
nvm install --lts
nvm use --lts

echo "📦 Installing SDKMAN..."
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

echo "🔧 Installing core CLI tools and languages..."

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
  envsubst \
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
  openssl@1.1 \
  openssl@3

echo "🆙 Upgrading Git..."
brew upgrade git

echo "✅ Core tools, Node.js, Go, and SDKMAN installed."
