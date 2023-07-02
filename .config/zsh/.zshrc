# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Use extended globs
setopt autocd extendedglob nomatch interactive_comments
stty stop undef   # Disable ctrl-s to freeze terminal
zle_highlight=("paste:none")

# No beeps!
unsetopt beep notify

# Vim mode
bindkey -v

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit
