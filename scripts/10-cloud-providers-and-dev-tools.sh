#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs cloud provider CLIs and developer deployment tools:
# - Cloud CLIs: AWS, Azure, GCP
# - Infrastructure tools: Terraform
# - Deployment CLIs: Vercel (npm), Cloudflare Wrangler (brew)
# - Optional (commented): doctl, pulumi, terragrunt, bicep
# ------------------------------------------------------------------------------

set -euo pipefail

echo "☁️ Installing cloud provider CLIs..."

# -------------------------------
# AWS CLI
# -------------------------------
if brew list awscli &>/dev/null; then
  echo "✅ AWS CLI already installed"
else
  brew install awscli
fi

# -------------------------------
# Azure CLI
# -------------------------------
if brew list azure-cli &>/dev/null; then
  echo "✅ Azure CLI already installed"
else
  brew install azure-cli
fi

# -------------------------------
# Google Cloud SDK
# -------------------------------
if brew list --cask google-cloud-sdk &>/dev/null; then
  echo "✅ Google Cloud SDK already installed"
else
  brew install --cask google-cloud-sdk
fi

# -------------------------------
# Terraform
# -------------------------------
if brew list terraform &>/dev/null; then
  echo "✅ Terraform already installed"
else
  brew install terraform
fi

# -------------------------------
# Vercel CLI (via npm)
# -------------------------------
if command -v vercel >/dev/null; then
  echo "✅ Vercel CLI already installed"
else
  echo "📦 Installing Vercel CLI via npm..."
  npm install -g vercel
fi

# -------------------------------
# Cloudflare Wrangler
# -------------------------------
if brew list wrangler &>/dev/null; then
  echo "✅ Cloudflare Wrangler already installed"
else
  brew install wrangler
fi

# -------------------------------
# Optional tools (commented out)
# -------------------------------

# DigitalOcean CLI
# brew install doctl

# Pulumi
# brew install pulumi

# Terragrunt
# brew install terragrunt

# Azure Bicep CLI
# brew install bicep

echo "✅ Cloud provider CLIs and deployment tools installed."
