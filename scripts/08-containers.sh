#!/usr/bin/env bash
set -euo pipefail

echo "🐳 Installing Docker Desktop..."

if brew list --cask docker &>/dev/null; then
  echo "✅ Docker already installed via Homebrew"
elif [ -d "/Applications/Docker.app" ]; then
  echo "✅ Docker.app already exists — skipping Homebrew install"
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
