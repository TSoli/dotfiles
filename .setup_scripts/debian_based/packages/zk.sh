#!/usr/bin/env bash

# Zettelkasten note taking
git clone https://github.com/zk-org/zk.git && cd zk && make && sudo mv zk /usr/local/bin
cd ..
rm -rf zk/
