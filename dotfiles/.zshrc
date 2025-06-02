# ------------------------------------------------------------------------------
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# ------------------------------------------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable plugins
plugins=(
  brew
  extract
  eza
  git
  httpie
  kubectl
  kubectx
  terraform
  tldr
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Homebrew path for Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

# Enable fzf key bindings and completion (installed via Homebrew)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enhance fzf with fd if available
if command -v fd &>/dev/null; then
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

# Optional: Use ripgrep + fzf for quick file search
if command -v rg &>/dev/null; then
  alias rgf="rg --files | fzf"
fi

# Optional: zoxide (smarter cd)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

# Optional: add ~/.local/bin to PATH (Python/Poetry, etc.)
export PATH="$HOME/.local/bin:$PATH"

# Optional: start SSH agent and add key
if command -v ssh-add &>/dev/null && [ -f ~/.ssh/id_ed25519 ]; then
  eval "$(ssh-agent -s)" > /dev/null
  ssh-add -q ~/.ssh/id_ed25519 2>/dev/null || true
fi

# Enable 'thefuck' alias as 'pls' if available
if command -v thefuck &>/dev/null; then
  eval "$(thefuck --alias pls)"
fi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# SDKMan setup
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Custom aliases
alias ll="ls -lah"
alias code.="code ."
alias ss="source ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
