#!/usr/bin/env bash

# A script used to setup my config in bash
cd $HOME
# Hide untracked files from the bare git repo
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no 

printf "Installing packages...\n"
sudo apt-get update && sudo apt install -y curl

# yarn is necessary for a plugin in neovim
printf "Installing package managers...\n"
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
# npm/yarn
nvm install --lts && npm install -g yarn

printf "Installing neovim...\n"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
  chmod u+x nvim.appimage && sudo mv -i nvim.appimage /usr/bin/nvim

# TODO: Check if the appimage will run and extract if necessary
# (see https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package)

printf "Installing Hack Nerd Font...\n"
base_font_url="https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/"
font_url_exts=("Regular/HackNerdFont-Regular.ttf" "Bold/HackNerdFont-Bold.ttf" \
  "Italic/HackNerdFont-Italic.ttf" "BoldItalic/HackNerdFontMono-BoldItalic.ttf")

for ext in ${font_url_exts[@]}; do
  curl -O "${base_font_url}${ext}"
done

mv -i *.ttf .local/share/fonts/
