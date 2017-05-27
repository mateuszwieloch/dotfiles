# FISH
echo "# Install fish-shell"
brew install fish

echo "# Append fish to /etc/shells"
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'

echo "# Change to the new shell"
chsh -s /usr/local/bin/fish

# docker completion for fish
mkdir -p ~/.config/fish/completions
wget https://raw.github.com/barnybug/docker-fish-completion/master/docker.fish -O ~/.config/fish/completions/docker.fish

echo "# Symlink ~/.config/fish/config.fish"
ln -s ~/code/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
