set -x

# Install, update brew and formulas {{{
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update
brew upgrade
brew cleanup
# }}}

# Command line tools {{{
brew install exa  # ls replacement
brew install rg   # grep replacement
ln -s ~/code/dotfiles/.ripgreprc  ~/.ripgreprc
brew install bat  # cat replacement
brew install fzf
brew install asdf
# for .nvmrc and .terraform-version support
echo 'legacy_version_file = yes' > ~/.asdfrc
asdf plugin add packer https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform-ls https://github.com/shihanng/asdf-terraform-ls
brew install tree
brew install p7zip
brew install httpie
# }}}


# fonts {{{
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font
# }}}


# Graphical tools (private){{{
brew install --cask calibre

brew install --cask eloston-chromium

brew install --cask karabiner-elements
mkdir -p ~/.config/karabiner
ln -sf ~/code/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

brew install --cask keepingyouawake

brew install --cask kitty
mkdir -p ~/.config/kitty
ln -sf ~/code/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

brew install --cask libreoffice

# adjust brigtness and volume of external display using Apple Keyboard keys
# brew install --cask monitorcontrol

brew install --cask obsidian

brew install --cask qbittorrent

brew install --cask signal

brew install --cask vlc

ln -sf ~/code/dotfiles/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc

# }}}

# Graphical tools (Tanium) {{{
brew install --cask google-chrome
brew install --cask slack
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask zoom
# }}}
