#!/bin/bash

echo -n 'Attempting to detect an operating system... '

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo 'Linux'
  echo -n 'Attempting to detect a package manager... '
  if command -v apt-get &> /dev/null ; then
    echo 'apt-get'
    echo 'Installing fish using apt-get... '
    sudo apt-get install fish
    echo 'Changing the default shell to fish...'
    set -x
    chsh -s /usr/bin/fish
  else
    echo 'Error: unknown Linux package manager'
    exit 1
  fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo 'macOS'
  if command -v brew &> /dev/null ; then
   echo 'Installing fish using brew...'
   brew install fish
   echo 'Changing the default shell to fish...'
   set -x
   sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'
   chsh -s /usr/local/bin/fish
  else
    echo 'Error: brew is required'
    exit 1
  fi
else
  echo 'Error: unknown operating system'
  exit 1
fi

echo 'Symlinking fish config files...'
set -x

# Note: macOS only supports -s and -f (not the variants with `--`)
ln -s -f ~/code/mateuszwieloch/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish

rm -ri ~/.config/fish/functions
ln -s ~/code/mateuszwieloch/dotfiles/.config/fish/functions/ ~/.config/fish/functions

rm -ri ~/.config/fish/completions
ln -s ~/code/mateuszwieloch/dotfiles/.config/fish/completions/ ~/.config/fish/completions

mkdir -p ~/.config/fish/local
echo "# This is just a placeholder to prevent the 'No matches for wildcard ~/.config/fish/local/*.fish' error" > ~/.config/fish/local/placeholder.fish
