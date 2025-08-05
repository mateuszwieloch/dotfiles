#!/bin/bash

echo 'Symlinking .gitconfig, .gitconfig-bp, .gitignore_global'
set -x
ln -s ~/code/mateuszwieloch/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/code/mateuszwieloch/dotfiles/.gitconfig-bp ~/.gitconfig-bp
ln -s ~/code/mateuszwieloch/dotfiles/.gitignore_global ~/.gitignore_global
