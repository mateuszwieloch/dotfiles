#!/usr/bin/fish
set fish_trace 1

curl https://mise.jdx.dev/install.sh | sh

ln -s ~/code/mateuszwieloch/dotfiles/.config/mise/settings.toml ~/.config/mise/settings.toml
ln -s ~/code/mateuszwieloch/dotfiles/.default-python-packages ~/.default-python-packages
