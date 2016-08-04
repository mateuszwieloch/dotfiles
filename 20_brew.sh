# Install, update brew and formulas {{{
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "# Update Homebrew and formulas"
brew update

echo "# Upgrade all installed formulas"
brew upgrade

echo "# Cleanup old Homebrew packages"
brew cleanup
# }}}

# Command line tools {{{
echo "# Install ack"
brew install ack
echo "# Install ag"
brew install ag
echo "# Install tree"
brew install tree
echo "# Install p7zip"
brew install p7zip
# }}}

# Graphical tools {{{
brew install caskroom/cask/brew-cask

echo "# Install atom"
brew cask install atom
echo "# Install Chrome"
brew cask install google-chrome
echo "# Install flux"
brew cask install flux
echo "# Install iTerm2"
brew cask install iterm2
echo "# Install Spectacle (keyboard shortcuts for arranging windows)"
brew cask install spectacle
# }}}
