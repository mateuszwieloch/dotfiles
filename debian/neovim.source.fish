#!/usr/bin/fish

set fish_trace 1

# Build prerequisites
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

pushd ~/code
git clone https://github.com/neovim/neovim

pushd ~/code/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

set NVIM_PATH /usr/local/bin/nvim

sudo ln -sf $NVIM_PATH /usr/local/bin/vi
sudo ln -sf $NVIM_PATH /usr/local/bin/vim

mkdir -p ~/.config/nvim
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/after ~/.config/nvim/after

sudo apt-get install tree-sitter-cli

popd
popd
