#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# Symlinks dotfiles from ./dotfiles/ to $HOME.
# Git files are linked from ./dotfiles/git/
# Also copies `.gitconfig-client-a.template` to ~/.gitconfig-client-a if missing.
# ------------------------------------------------------------------------------

set -euo pipefail

echo "🔗 Linking dotfiles..."

DOTFILES_DIR="$PWD/dotfiles"

# Zsh, Editor, Powerlevel10k
FILES=(
  .zshrc
  .zprofile
  .editorconfig
  .p10k.zsh
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

# Git-related files
GITFILES=(
  .gitconfig
  .gitignore_global
  .gitconfig-client-a.example
  .gitconfig-client-b.example
)

for file in "${GITFILES[@]}"; do
  src="$DOTFILES_DIR/git/$file"
  dest="$HOME/$file"

  if [ -e "$src" ]; then
    ln -sf "$src" "$dest"
    echo "✅ Linked $file"
  else
    echo "⚠️  Skipped $file — not found in $DOTFILES_DIR/git"
  fi
done

# iTerm2 Preferences
echo "🖥  Linking iTerm2 preferences..."

ITERM_SRC="$DOTFILES_DIR/iterm2/com.googlecode.iterm2.plist"
ITERM_DEST="$HOME/Library/Preferences/com.googlecode.iterm2.plist"

if [ -e "$ITERM_SRC" ]; then
  ln -sf "$ITERM_SRC" "$ITERM_DEST"
  echo "✅ Linked iTerm2 preferences"
else
  echo "⚠️  Skipped iTerm2 — no plist found at $ITERM_SRC"
fi

echo "🏁 Dotfiles linking complete."
