# Ask for sudo password upfront
sudo -v

# Update Homebrew and formulas
brew update

# Upgrade all installed formulas
brew upgrade

# Upgrade shell to Bash 4.x
brew install bash
# Add the new shell to the list of allowed shells
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell
chsh -s /usr/local/bin/bash 

# Install tools
brew install vim --override-system-vi 
brew install git
brew install tree

brew install caskroom/cask/brew-cask
brew cask install atom
brew cask install google-chrome
brew cask install iterm2


brew cleanup
