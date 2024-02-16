#!/usr/bin/env bash

sudo apt-get install texlive-full zathura

# set up the indentconfig file

sed "s@\$HOME@$HOME@" <~/.config/tex/indentconfig-template.yaml >~/.indentconfig.yaml
