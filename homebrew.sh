#!/bin/bash

set -x

# Prerequisites {{{
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo 'Linux'
  echo -n 'Attempting to detect a package manager... '
  if command -v apt-get &> /dev/null ; then
    echo 'apt-get'
    echo 'Installing prerequisites using apt-get... '
    sudo apt-get install build-essential procps curl file git
  else
    echo 'Error: unknown Linux package manager'
    exit 1
  fi
fi
# }}}


# The Homebrew itself {{{
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# }}}


# Command line tools {{{
  brew install asdf
  # for .nvmrc and .terraform-version support
  ln -sf ~/code/mateuszwieloch/dotfiles/.asdfrc ~/.asdfrc

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
