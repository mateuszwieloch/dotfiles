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

# Fonts {{{
# brew tap caskroom/fonts
# brew cask install font-iosevka
# }}}

# Graphical tools {{{
brew cask install eloston-chromium

brew cask install keepingyouawake

brew cask install kitty
ln -sf ~/code/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# adjust brigtness and volume of external display using Apple Keyboard keys
brew cask install monitorcontrol

brew cask install visual-studio-code
ln -s /usr/local/bin/code /usr/local/bin/vscode
# }}}
