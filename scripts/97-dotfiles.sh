#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Symlinks dotfiles from ./dotfiles/ to $HOME.
# Also copies `.gitconfig-client-a.template` to ~/.gitconfig-client-a if missing.
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🔗 Linking dotfiles..."

DOTFILES_DIR="$PWD/dotfiles"

FILES=(
  .zshrc
  .zprofile
  .gitconfig
  .gitignore_global
  .editorconfig
)

for file in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"

  if [ -e "$src" ]; then
    ln -sf "$src" "$dest"
    echo "✅ Linked $file"
  else
    echo "⚠️  Skipped $file — not found in $DOTFILES_DIR"
  fi
done

# Handle gitconfig-client-a.template
TEMPLATE="$DOTFILES_DIR/.gitconfig-client-a.template"
TARGET="$HOME/.gitconfig-client-a"

if [ -f "$TEMPLATE" ]; then
  if [ -f "$TARGET" ]; then
    echo "✅ .gitconfig-client-a already exists — not overwriting"
  else
    cp "$TEMPLATE" "$TARGET"
    echo "📝 Copied .gitconfig-client-a.template to $TARGET"
  fi
else
  echo "⚠️  Template .gitconfig-client-a.template not found — skipping"
fi

echo "🏁 Dotfiles linking complete."
