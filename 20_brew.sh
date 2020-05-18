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
brew tap caskroom/fonts
brew cask install font-iosevka
# }}}

# Graphical tools {{{
brew install caskroom/cask/brew-cask
brew cask install keepingyouawake
brew cask install visual-studio-code
# }}}
