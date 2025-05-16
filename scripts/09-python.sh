#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Installs Python environment tooling:
# - pyenv to manage Python versions
# - poetry, pipenv, uv for project-level dependency management
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🐍 Installing Python tooling..."

# Install pyenv
if ! command -v pyenv >/dev/null; then
  brew install pyenv
else
  echo "✅ pyenv already installed"
fi

# Initialize pyenv in this shell
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# Install latest stable Python 3.x version
LATEST_PYTHON=$(pyenv install --list | grep -E '^  3\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')

if ! pyenv versions --bare | grep -q "^${LATEST_PYTHON}$"; then
  echo "📦 Installing Python $LATEST_PYTHON..."
  pyenv install "$LATEST_PYTHON"
else
  echo "✅ Python $LATEST_PYTHON already installed"
fi

pyenv global "$LATEST_PYTHON"
echo "🐍 Python $LATEST_PYTHON set globally"

# Install project dependency tools
for tool in poetry pipenv uv; do
  if brew list "$tool" &>/dev/null; then
    echo "✅ $tool already installed"
  else
    echo "📦 Installing $tool..."
    brew install "$tool"
  fi
done

echo "✅ Python tooling setup complete."
