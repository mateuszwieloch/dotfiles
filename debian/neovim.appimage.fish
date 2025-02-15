#!/usr/bin/fish

set fish_trace 1

set NVIM_PATH /usr/local/bin/nvim
sudo curl -L -o $NVIM_PATH https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
sudo chmod +x $NVIM_PATH

sudo ln -sf $NVIM_PATH /usr/local/bin/vi
sudo ln -sf $NVIM_PATH /usr/local/bin/vim

mkdir -p ~/.config/nvim
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/after ~/.config/nvim/

sudo apt-get install tree-sitter-cli
