#!/usr/bin/fish

set fish_trace 1

asdf plugin add lua-language-server
asdf install lua-language-server latest
asdf global lua-language-server latest
