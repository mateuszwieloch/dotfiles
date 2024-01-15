#!/usr/bin/fish

set fish_trace 1

git clone https://github.com/asdf-vm/asdf.git ~/.asdf

# for .nvmrc and .terraform-version support
ln -sf ~/code/mateuszwieloch/dotfiles/.asdfrc ~/.asdfrc
# fish shell completions
ln -sf ~/.asdf/completions/asdf.fish ~/.config/fish/completions/asdf.fish

