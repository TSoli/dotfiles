#!/usr/bin/env bash

wget -O delta.tar.gz https://github.com/dandavison/delta/releases/latest/download/delta-0.16.5-x86_64-unknown-linux-gnu.tar.gz \
  # Extract executable to cwd as delta
  && tar xf delta.tar.gz --wildcards **/delta --xform='s|.*/||' \
  && sudo mv -i delta /usr/bin/ && rm -r delta.tar.gz
