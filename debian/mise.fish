#!/usr/bin/fish
set fish_trace 1

sudo apt update -y && sudo apt install -y gpg sudo wget curl
sudo install -dm 755 /etc/apt/keyrings
wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
sudo apt update
sudo apt install -y mise

ln -s ~/code/mateuszwieloch/dotfiles/.config/mise/settings.toml ~/.config/mise/settings.toml
ln -s ~/code/mateuszwieloch/dotfiles/.default-python-packages ~/.default-python-packages

# Install Fish shell completions
mise use -g usage
mise completion fish > ~/.config/fish/completions/mise.fish
