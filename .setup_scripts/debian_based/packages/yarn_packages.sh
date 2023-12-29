#!/usr/bin/env bash

packages=("@fsouza/prettierd" "tree-sitter-cli")

for package in ${packages[@]}; do
  echo $package
  yarn add global $package
done
