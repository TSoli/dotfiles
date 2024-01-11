#!/usr/bin/env bash

# A script used to setup my config in bash and change to zsh
# Assumes git is installed previously
cd $HOME
# Hide untracked files from the bare git repo
/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME config --local status.showUntrackedFiles no

printf "Installing packages...\n"
sudo apt-get update && sudo apt-get install -y zsh zip curl wget ripgrep tar \
	gzip build-essential less xclip xsel cmake tmux exa zathura xdotool python3-pip \
	trash-cli backintime-qt

# tmux package manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# make zsh the default shell
chsh -s $(which zsh)

# install zap plugin manager for zsh
zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1

# yarn is necessary for a plugin in neovim
printf "Installing package managers...\n"
# nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
# npm/yarn
nvm install --lts && npm install -g yarn

printf "Installing neovim...\n"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage &&
	chmod u+x nvim.appimage && sudo mv -i nvim.appimage /usr/bin/nvim

# TODO: Check if the appimage will run and extract if necessary
# (see https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package)

printf "Installing Hack Nerd Font...\n"
base_font_url="https://api.github.com/repos/ryanoasis/nerd-fonts/contents/patched-fonts/Hack/"
font_url_exts=("Regular/HackNerdFont-Regular.ttf" "Bold/HackNerdFont-Bold.ttf"
	"Italic/HackNerdFont-Italic.ttf" "BoldItalic/HackNerdFont-BoldItalic.ttf")

for ext in ${font_url_exts[@]}; do
	curl -H "Accept: application/vnd.github.v3.raw" -LO "${base_font_url}${ext}"
done

mv -i *.ttf .local/share/fonts/

printf "Installing more packages...\n"

for pkg in ~/.setup_scripts/debian_based/packages/*.sh; do
	bash "$pkg"
done

# remove dependencies
sudo apt autoremove --purge
