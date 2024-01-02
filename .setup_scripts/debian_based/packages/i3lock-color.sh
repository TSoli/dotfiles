#!/usr/bin/env bash

# A nice lock screen

# dependencies
sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev
git clone git@github.com:Raymo111/i3lock-color.git && cd i3lock-color && ./install-i3lock-color.sh && cd .. && rm -rf i3lock-color/

