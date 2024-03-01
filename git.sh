#!/bin/bash

echo 'Symlinking .gitconfig and .gitconfig-bp'
set -x
ln -s ~/code/mateuszwieloch/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/code/mateuszwieloch/dotfiles/.gitconfig-bp ~/.gitconfig-bp
