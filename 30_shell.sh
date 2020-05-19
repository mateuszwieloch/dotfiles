set -x

# FISH
brew install fish

sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

ln -s ~/code/dotfiles/.config/fish/completions ~/.config/fish/completions

# Symlink config files
mkdir -p ~/.config/fish/functions
ln -s ~/code/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
rm -rf ~/.config/fish/functions
ln -sf ~/code/dotfiles/.config/fish/functions ~/.config/fish/functions
