#!/usr/bin/env zsh
# ------------------------------------------------------------------------------
# Installs core CLI tools and language environments:
# - NVM (Node.js LTS)
# - SDKMAN (for Java/Scala SDKs)
# - Homebrew CLI utilities (excluding Git install; upgrade only if active)
# ------------------------------------------------------------------------------

set -euo pipefail

init_nvm() {
  export NVM_DIR="$HOME/.nvm"
  if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
    declare -f nvm >/dev/null && return 0
  fi
  return 1
}

init_sdkman() {
  if [ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
    export ZSH_VERSION=""
    set +u
    source "$HOME/.sdkman/bin/sdkman-init.sh"
    set -u
    declare -f sdk >/dev/null && return 0
  fi
  return 1
}

if ! init_nvm; then
  echo "📦 Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  init_nvm || { echo "❌ Failed to initialize NVM"; exit 1; }
else
  echo "✅ NVM already installed"
fi

echo "🔧 Installing Node.js (LTS)..."
set +u
nvm install --lts
nvm use --lts
set -u

if ! init_sdkman; then
  echo "📦 Installing SDKMAN..."
  curl -s "https://get.sdkman.io" | bash
  init_sdkman || { echo "❌ Failed to initialize SDKMAN"; exit 1; }
else
  echo "✅ SDKMAN already installed"
fi

echo "🔧 Verifying SDKMAN via login shell..."
zsh -lic "sdk version"

echo "🔍 Checking current Git version and path..."
git_path=$(command -v git || echo "")
git_version=$(git --version || echo "unknown")

echo "Current git path: $git_path"
echo "Git version: $git_version"

if [[ "$git_path" == "/opt/homebrew/bin/git" || "$git_path" == "/usr/local/bin/git" ]]; then
  echo "✅ Active git is Homebrew version."
  if brew list git &>/dev/null; then
    echo "🆙 Upgrading Homebrew Git..."
    brew upgrade git
  fi
else
  echo "⚠️ Active git is NOT the Homebrew version, skipping upgrade."
fi

packages=(
  bat
  curl
  delta
  diff-so-fancy  # updated from diff-so-easy
  direnv
  duf
  eza
  fzf
  gh
  git-filter-repo
  git-lfs
  gnupg
  go
  httpie
  jq
  neovim
  pnpm
  openssl@3
  shfmt
  thefuck
  tldr
  tree
  vim
  wget
  zoxide
)

echo "🔧 Installing core CLI tools with Homebrew..."

for pkg in "${packages[@]}"; do
  if brew list "$pkg" &>/dev/null; then
    echo "✅ $pkg already installed"
  else
    echo "📦 Installing $pkg..."
    if ! brew install "$pkg"; then
      echo "⚠️  Failed to install $pkg — skipping"
    fi
  fi
done

# Optional post-install: setup fzf bindings
if [[ " ${packages[*]} " == *" fzf "* ]]; then
  echo "⚙️  Running fzf install script to enable key bindings and completion..."
  yes | "$(brew --prefix)"/opt/fzf/install
fi

echo ""
echo "🎉 Bootstrap complete!"
echo "✅ Node: $(node -v)"
echo "✅ npm:  $(npm -v)"
echo "✅ Git:  $(git --version)"
echo "✅ Go:   $(go version | awk '{print $3}')"

echo "ℹ️ Please restart your terminal or run: source ~/.zshrc"
