#!/usr/bin/env fish

echo "Using brew, because ASDF does not support crystal with icr or crystalline LSP yet"
brew install crystal
brew install crystal-icr

echo "See this file if you see the 'error while loading shared libraries libgc.so.1'"
# sudo apt-get install libgc-dev

echo "Installing crystalline language server..."
wget https://github.com/elbywan/crystalline/releases/latest/download/crystalline_x86_64-unknown-linux-musl.gz -O crystalline.gz
gzip -d crystalline.gz
chmod u+x crystalline
mv crystalline ~/bin/
