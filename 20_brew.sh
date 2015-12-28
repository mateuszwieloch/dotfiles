# BREW
echo "# Update Homebrew and formulas"
brew update

echo "# Upgrade all installed formulas"
brew upgrade

echo "# Cleanup old Homebrew packages"
brew cleanup

# CMD LINE TOOLS
echo "# Install tree"
brew install tree

# GRAPHICAL TOOLS
brew install caskroom/cask/brew-cask
echo "# Install atom"
brew cask install atom
echo "# Install Chrome"
brew cask install google-chrome
echo "# Install iTerm2"
brew cask install iterm2
