# .p10k.zsh - Powerlevel10k config
# Tip: Run `p10k configure` to regenerate this file interactively.

# Use lean, single-line prompt with few icons and high contrast
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=false
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='❯ '
typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
