set -x

# Install, update brew and formulas {{{
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

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


# Graphical tools {{{
brew cask install alfred

brew cask install calibre

brew cask install dashlane

brew cask install eloston-chromium

# for Fastmail
brew cask install flotato

brew cask install itsycal

brew cask install karabiner-elements
ln -sf ~/code/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

brew cask install keepingyouawake

brew cask install kitty
ln -sf ~/code/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

brew cask install libreoffice

# adjust brigtness and volume of external display using Apple Keyboard keys
brew cask install monitorcontrol

brew cask install obsidian

brew cask install pandora

brew cask install qbittorrent

brew cask install signal

brew cask install skype

brew cask install visual-studio-code
ln -s /usr/local/bin/code /usr/local/bin/vscode

brew cask install vlc
ln -sf ~/code/dotfiles/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc

brew cask install zoom
# }}}
