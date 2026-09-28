alias nv=nvim
alias lg=lazygit

# bat vs batcat (Ubuntu/Debian apt package installs it as batcat)
if command -v batcat >/dev/null 2>&1; then
    alias cat=batcat
elif command -v bat >/dev/null 2>&1; then
    alias cat=bat
fi
