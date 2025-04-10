# 📜 Script Overview

This folder contains modular setup scripts to bootstrap a macOS development environment.

---

## 🧱 Core Setup

- **00-xcode.sh**  
  Installs Xcode Command Line Tools (required for many developer utilities).

- **01-homebrew.sh**  
  Installs Homebrew, the package manager for macOS.

- **02-core-tools.sh**  
  Installs CLI tools like Git, `nvm`, `node`, `tree`, `curl`, `jq`, and configures `nvm`.

- **03-apps.sh**  
  Installs essential developer applications via Homebrew Cask (e.g. VS Code, iTerm2, Rectangle, Firefox).

- **04-macos-defaults.sh**  
  Applies common macOS preference tweaks to improve the developer experience.

---

## ⚙️ Dotfiles & Cleanup

- **97-dotfiles.sh**  
  Symlinks your dotfiles (Zsh, Git, EditorConfig) into `~`.

- **99-post-setup.sh**  
  Final cleanup and confirmation message.

---

## 💡 Usage

Each script is designed to be idempotent and modular. You can run:

```bash
make all
```

Or call individual scripts as needed:

```bash
zsh scripts/02-core-tools.sh
```
