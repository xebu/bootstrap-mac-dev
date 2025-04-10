#!/usr/bin/env zsh
set -e

echo "🐳 Installing Docker and Kubernetes CLI tools..."
brew install --cask docker
brew install kind helm lazydocker k9s stern

echo "✅ Docker and Kubernetes tools installed."
