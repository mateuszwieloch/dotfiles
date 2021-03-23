set -x

# Install, update brew and formulas {{{
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update
brew upgrade
brew cleanup
# }}}

# Command line tools {{{
brew install rg
ln -s ~/code/dotfiles/.ripgreprc  ~/.ripgreprc
brew install bat
brew install tree
brew install p7zip
brew install httpie
# }}}


# Graphical tools (private){{{
brew cask install calibre

brew cask install eloston-chromium

brew cask install karabiner-elements
mkdir -p ~/.config/karabiner
ln -sf ~/code/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

brew cask install keepingyouawake

brew cask install kitty
mkdir -p ~/.config/kitty
ln -sf ~/code/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

brew cask install libreoffice

# adjust brigtness and volume of external display using Apple Keyboard keys
brew cask install monitorcontrol

brew cask install obsidian

brew cask install qbittorrent

brew cask install signal

brew cask install skype

brew cask install vlc
ln -sf ~/code/dotfiles/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc

brew cask install zoom
# }}}

# Graphical tools (Tanium) {{{
brew cask install google-chrome
brew cask install slack
brew cask install virtualbox
brew cask install visual-studio-code
# }}}