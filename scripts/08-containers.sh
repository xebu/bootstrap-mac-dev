#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs Docker Desktop and essential Kubernetes CLI tools:
# - Docker (via Homebrew Cask)
# - kind, helm, lazydocker, k9s, stern
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🐳 Installing Docker Desktop..."

if brew list --cask docker &>/dev/null; then
  echo "✅ Docker already installed"
else
  brew install --cask docker
fi

echo "🔧 Installing Kubernetes CLI tools..."

cli_tools=(
  kind
  helm
  lazydocker
  k9s
  stern
)

for tool in "${cli_tools[@]}"; do
  if brew list "$tool" &>/dev/null; then
    echo "✅ $tool already installed"
  else
    echo "📦 Installing $tool..."
    brew install "$tool"
  fi
done

echo "✅ Docker and Kubernetes CLI tools installed."
