#!/usr/bin/env zsh
set -e

echo "🐍 Installing Python tooling..."

# Install pyenv
brew install pyenv

# Initialize pyenv in this shell
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Install latest Python 3
LATEST_PYTHON=$(pyenv install --list | grep -E '^  3\.[0-9]+\.[0-9]+$' | tail -1 | tr -d ' ')
pyenv install -s "$LATEST_PYTHON"
pyenv global "$LATEST_PYTHON"

echo "🐍 Python $LATEST_PYTHON installed and set globally."

# Install additional Python tools
brew install poetry pipenv uv

echo "✅ Python tooling installed."
