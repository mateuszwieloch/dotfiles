#!/bin/bash

git clone https://github.com/rvaiya/keyd ~/code/tmp/keyd
pushd ~/code/tmp/keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
popd

sudo ln -sf ~/code/mateuszwieloch/dotfiles/ubuntu/keyd/default.conf /etc/keyd/default.conf

sudo usermod -aG keyd $(whoami)
mkdir -p ~/.config/keyd
sudo ln -sf ~/code/mateuszwieloch/dotfiles/ubuntu/keyd/app.conf ~/.config/keyd/app.conf
set_color black --background=yellow
echo "The next command should install keyd GNOME extension. Verify that it was added. Enable if needed."
keyd-application-mapper
