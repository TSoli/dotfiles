#!/usr/bin/env bash
# For viewing images in terminal

# Extract executable to cwd
wget -O chafa.tar.xz \
  https://hpjansson.org/chafa/releases/static/chafa-1.12.5-1-x86_64-linux-gnu.tar.gz \
  && tar xf chafa.tar.xz --wildcards **/chafa --xform='s|.*/||' \
  && rm chafa.tar.xz \
  && sudo mv -i chafa /usr/bin/
