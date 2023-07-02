# Configure history
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# Use extended globs
setopt autocd extendedglob nomatch

# No beeps!
unsetopt beep notify

# Vim mode
bindkey -v

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tariq/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
