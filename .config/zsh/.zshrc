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
# Enable backspace
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
# Go to normal mode
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

# Set curosr to be beam in insert
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # block no blink
        viins|main) echo -ne '\e[6 q';; # beam no blink
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Load aliases
emulate sh -c '. ~/.bash_aliases'
