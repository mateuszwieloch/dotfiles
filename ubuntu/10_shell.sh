sudo apt install fish

chsh -s /usr/bin/fish

# Symlink config files
mkdir -p ~/.config/fish/functions
ln -s ~/code/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -fs ~/code/dotfiles/.config/fish/functions ~/.config/fish
ln -s ~/code/dotfiles/.config/fish/completions ~/.config/fish/completions
