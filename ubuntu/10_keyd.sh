#!/bin/bash

git clone https://github.com/rvaiya/keyd ~/code/tmp/keyd
pushd ~/code/tmp/keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
popd

sudo ln -sf ~/code/mateuszwieloch/dotfiles/ubuntu/keyd/default.conf /etc/keyd/default.conf
