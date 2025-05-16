#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Final post-bootstrap step:
# - Cleans up unused Homebrew packages and caches
# - Optionally prints system summary or timestamp
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🧼 Cleaning up Homebrew cache and outdated packages..."
brew cleanup

# Optionally, show disk space recovered or basic system info
echo ""
echo "🧾 Final system info:"
brew --version
echo "📦 Total installed packages: $(brew list | wc -l)"
echo "🗂️  Total installed casks:   $(brew list --cask | wc -l)"

echo ""
echo "💻 Setup complete! ✅"
