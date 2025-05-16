#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs client- or project-specific CLI tools, SDKs, and supporting apps.
# Create copies of this per client if needed (e.g. 06-client-tools-made-tech.sh)
# ------------------------------------------------------------------------------

set -euo pipefail

echo "👥 Installing client-specific tools..."

# Example: Client-specific CLI tools
# brew install aws-sam-cli
# brew install azure-functions-core-tools
# brew install terraform-docs

# Example: VPN software (for secure access to environments)
# brew install --cask tunnelblick
# brew install --cask openvpn

# Example: Internal Git repos
# git clone git@github.com:client-org/internal-tools.git ~/code/work/internal-tools

# Example: JQ filters, shared scripts, or shell completions

echo "✅ Client-specific tools installed."
