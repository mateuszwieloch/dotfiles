#!/usr/bin/fish

brew install --cask calibre

# Etcher is an open source app cross-platform app to burn disk images to USB drives.
brew install --cask balenaetcher

brew install --cask karabiner-elements
mkdir -p ~/.config/karabiner
ln -sf ~/code/mateuszwieloch/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

brew install --cask keepingyouawake

brew install --cask kitty
ln -sf ~/code/mateuszwieloch/dotfiles/.config/kitty/ ~/.config

# adjust brigtness and volume of external display using Apple Keyboard keys
# brew install --cask monitorcontrol

brew install --cask obsidian

brew install --cask qbittorrent

brew install --cask signal

brew install --cask visual-studio-code

brew install --cask vlc
ln -sf ~/code/mateuszwieloch/dotfiles/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc
