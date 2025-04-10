#!/usr/bin/env zsh
set -e

echo "☁️ Installing cloud provider CLIs..."

# AWS CLI
brew install awscli

# Azure CLI
brew install azure-cli

# Google Cloud CLI
brew install --cask google-cloud-sdk

# Terraform
brew install terraform

echo "✅ Cloud provider CLIs and Terraform installed."
