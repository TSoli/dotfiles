#!/usr/bin/env bash

# Zettelkasten note taking
git clone git@github.com:mickael-menu/zk.git && cd zk && make
cd ..
rm -rf zk/
