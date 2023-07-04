#!/usr/bin/env bash

packages=("@fsouza/prettierd")

for package in ${packages[@]}; do
  echo $package
  yarn add global $package
done
