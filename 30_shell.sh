set -x

# FISH
brew install fish

sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

# docker completion for fish
mkdir -p ~/.config/fish/completions
wget https://raw.github.com/barnybug/docker-fish-completion/master/docker.fish -O ~/.config/fish/completions/docker.fish

# Symlink config files
mkdir -p ~/.config/fish/functions
ln -s ~/code/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -s ~/code/dotfiles/.config/fish/functions ~/.config/fish/functions
