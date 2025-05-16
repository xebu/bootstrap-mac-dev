#!/usr/bin/env bash
set -e

echo "🔗 Linking dotfiles..."

DOTFILES_DIR="$PWD/dotfiles"

ln -sf "$DOTFILES_DIR/.zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/.zprofile" ~/.zprofile
ln -sf "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/.gitconfig-client-a" ~/.gitconfig-client-a
ln -sf "$DOTFILES_DIR/.gitignore_global" ~/.gitignore_global
ln -sf "$DOTFILES_DIR/.editorconfig" ~/.editorconfig

echo "✅ Dotfiles linked"
