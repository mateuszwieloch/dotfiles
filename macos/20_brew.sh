set -x

# Install, update brew and formulas {{{
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew update
brew upgrade
brew cleanup
# }}}

# Command line tools {{{
brew install asdf
# for .nvmrc and .terraform-version support
echo 'legacy_version_file = yes' > ~/.asdfrc
asdf plugin add packer https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin add terraform-ls https://github.com/shihanng/asdf-terraform-ls

brew install bat  # cat replacement
brew install exa  # ls replacement
brew install fd   # find replacemnt
brew install fzf
brew install httpie
brew install p7zip

brew install rg   # grep replacement
ln -s ~/code/mateuszwieloch/dotfiles/.ripgreprc  ~/.ripgreprc

brew install sd
brew install tree
# }}}


# fonts {{{
brew tap homebrew/cask-fonts
brew install font-fira-mono-nerd-font
# }}}


# Graphical tools (private){{{
brew install --cask calibre

brew install --cask eloston-chromium

# Etcher is an open source app cross-platform app to burn disk images to USB drives.
brew install --cask balenaetcher

brew install --cask karabiner-elements
mkdir -p ~/.config/karabiner
ln -sf ~/code/mateuszwieloch/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

brew install --cask keepingyouawake

brew install --cask kitty
ln -sf ~/code/mateuszwieloch/dotfiles/.config/kitty/ ~/.config

brew install --cask libreoffice

# adjust brigtness and volume of external display using Apple Keyboard keys
# brew install --cask monitorcontrol

brew install --cask obsidian

brew install --cask qbittorrent

brew install --cask signal

brew install --cask visual-studio-code

brew install --cask vlc
ln -sf ~/code/mateuszwieloch/dotfiles/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc

# }}}
