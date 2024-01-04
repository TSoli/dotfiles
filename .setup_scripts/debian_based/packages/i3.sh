#!/usr/bin/env bash

# Note to install the latest version see https://i3wm.org/docs/repositories.html
# And you may need to change /etc/apt/sources.list.d/sur5r-i3.list contents
# to jammy (I think for Ubuntu 22.04 based) as per https://forums.linuxmint.com/viewtopic.php?t=388673 
# This may be necessary to get gaps
sudo apt-get install -y i3 feh picom polybar rofi flameshot
pip install autotiling

# install a clipboard history menu
sudo apt-get install -y libxfixes-dev rofi-dev qalc libtool

git clone git@github.com:cdown/clipnotify.git && cd clipnotify &&
  sudo make install && cd .. && rm -rf clipnotify

git clone git@github.com:cdown/clipmenu.git &&
  sudo cp clipmenu/init/clipmenud.service /usr/lib/systemd/user/ &&
  rm -rf clipmenu

git clone git@github.com:svenstaro/rofi-calc.git && cd rofi-calc && mkdir m4 &&
  autoreconf -i && mkdir build && cd build && ../configure && sudo make install &&
  cd ../.. && sudo rm -rf rofi-calc

# emoji menu
python3 -m pip install rofimoji
