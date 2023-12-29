#!/usr/bin/env bash

# Note to install the latest version see https://i3wm.org/docs/repositories.html
# And you may need to change /etc/apt/sources.list.d/sur5r-i3.list contents
# to jammy (I think for Ubuntu 22.04 based) as per https://forums.linuxmint.com/viewtopic.php?t=388673 
# This may be necessary to get gaps
sudo apt-get install -y i3 feh picom polybar rofi flameshot
pip install autotiling
