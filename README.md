# 🛠️ Bootstrap Mac Dev Environment

A highly opinionated, modular, and repeatable way to bootstrap a macOS machine for development.
This setup includes CLI tools, apps, language environments, and dotfiles — with sensible defaults and a modular structure for easy customization.

This repository provides a personal set of scripts and configuration files to automate and standardize how I set up my macOS development environment.

Feel free to adapt it to your own needs.

If you spot a bug, have a suggestion, or want to contribute improvements, please open an issue

---

## ⚠️ Warning

As this bootstrap is tailored to my personal development workflow. It assumes:

- You're comfortable using the terminal and command-line tools
- You understand what each step does, or you're willing to read the source scripts
- You accept responsibility for the changes it will make to your system

**Do not use this on a production machine or a shared device unless you know exactly what you're doing.**

---

## 📦 What's Included?

- ✅ Software Updates
- 📁 Directory Structure: `~/code/{learn,personal,work,playground}`
- 🍺 Homebrew (package manager)
- 🔧 CLI Tools (e.g., `git`, `bat`, `fzf`, `zoxide`, `tldr`, `neovim`, etc.)
- 🧠 Shell Setup (`oh-my-zsh`, Powerlevel10k, plugins)
- 🐍 Python via `pyenv`, `poetry`, `pipenv`, `uv`
- 🧑‍💻 Node.js via `nvm`
- ☕ Java SDKs via `sdkman`
- 🐳 Docker & Kubernetes (`kind`, `kubectl`, `helm`)
- ☁️ Cloud CLIs: AWS, Azure, GCP, Terraform
- 💻 GUI Apps (e.g., Chrome, Firefox Dev, VSCode, iTerm2, JetBrains Toolbox, Slack, Obsidian)
- 🎵 Optional personal apps: Discord, Signal, Zoom, Spotify, WhatsApp, NordVPN
- 🧼 Dotfiles setup for `.zshrc`, `.p10k.zsh`, `.editorconfig`, and `gitconfig` with per-folder overrides

---

## ⚙️ Prerequisites

Before beginning, `Xcode Command Line Tools` must be installed. These are required for `git`, `make`,`Homebrew`, and many essential development utilities.

1. ✅ Install **Xcode Command Line Tools**:

  ```bash
  xcode-select --install
  ```

1. ✅ Install **macOS software updates** (via System Settings or run manually):

   ```bash
   sudo softwareupdate -ia --verbose
   ```

2. ✅ On Apple Silicon (M1/M2/M3) Macs, install **Rosetta** (for x86 CLI support):

   ```bash
   sudo softwareupdate --install-rosetta --agree-to-license
   ```

Once installed proceed to clone this repo and begin the bootstrap:

---

## 🚀 Usage

### 1. Clone or Fork the Repository

> 💡 **Tip: Clone or Fork?**  
> If you're comfortable with how the scripts work and want to use this setup as-is, you can **clone** the repository:
>
> ```bash
> git clone https://github.com/<your-username>/bootstrap-mac-dev.git
> ```
>
> However, if you plan to **customize the setup**, or want to maintain your own version, it's better to **fork** the repo first and then clone _your fork_:
>
> ```bash
> git clone https://github.com/<your-github-username>/bootstrap-mac-dev.git
> ```
>
> ⚠️ **Important:**  
> Please take a moment to **review the scripts** before running them. This setup script makes system-level changes, and blindly cloning and executing scripts you don’t understand can lead to unintended consequences.

### 2. Run the Bootstrap

```bash
cd bootstrap-mac-dev
make
```

This will run all scripts in order via the `Makefile`.

---

## 📂 File Structure

```text
.
├── Makefile
├── dotfiles/
├── scripts/
│   ├── 00-create-code-folders.sh
│   ├── 01-homebrew.sh
│   ├── 02-core-tools.sh
│   ├── 03-apps.sh
│   ├── 04-macos-defaults.sh
│   ├── 05-ohmyzsh.sh
│   ├── 08-containers.sh
│   ├── 09-python.sh
│   ├── 10-cloud-providers.sh
│   ├── 11-fonts.sh
│   ├── 11-personal-casks.sh
│   ├── 97-dotfiles.sh
│   └── 99-post-setup.sh
```

---

## 🧼 Not Included (Yet)

- SSH key setup (planned for a future script)
- CLI to walk through installation

---

## 📣 Contributing

Suggestions, improvements, and pull requests are welcome!
