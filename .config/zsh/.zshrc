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

# Function to source local files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

# load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
# plug "zap-zsh/zap-prompt"
plug "spaceship-prompt/spaceship-prompt"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
zsh_add_file "vim-mode"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Load aliases
emulate sh -c '. ~/.bash_aliases'

# Add any setup specific to the current machine in this file
if [[ -f ~/.local_bashrc && -x ~/.local_bashrc ]]
then
  emulate sh -c '. ~/.local_bashrc'
fi

# Adpated from https://www.markhansen.co.nz/auto-start-tmux/
# Check tmux exists, we are in interactive mode and TMUX is not open
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [ -z "$TMUX" ]; then
  # Adapted from https://unix.stackexchange.com/a/176885/347104
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
fi

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

eval $(ssh-agent) &>/dev/null
