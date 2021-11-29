set -x

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo 'Detected Linux'
  echo 'Installing fish using apt and changing default shell...'
  sudo apt install fish

  chsh -s /usr/bin/fish
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo 'Detected macOS'
  echo 'Installing fish using brew and changing default shell...'
  brew install fish

  sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
  chsh -s /usr/local/bin/fish
else
  echo 'Error: unknown operating system'
  exit 1
fi


echo 'Symlinking fish config files...'
ln -s ~/code/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
mkdir -p ~/.config/fish/functions
ln -fs ~/code/dotfiles/.config/fish/functions ~/.config/fish
ln -s ~/code/dotfiles/.config/fish/completions ~/.config/fish/completions
