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
echo "# Install ag"
brew install ag
echo "# Install tree"
brew install tree
echo "# Install p7zip"
brew install p7zip
echo "# Install httpie"
brew install httpie
# }}}

# Graphical tools {{{
brew install caskroom/cask/brew-cask

echo "# Install Chrome"
brew cask install google-chrome
echo "# Install KeepingYouAwake"
brew cask install keepingyouawake
echo "# Install iTerm2"
brew cask install iterm2
# }}}
