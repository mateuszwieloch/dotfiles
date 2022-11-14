#!/usr/bin/fish

set -x

brew install neovim
sudo ln -sf $HOMEBREW_PREFIX/bin/nvim /usr/bin/vi

mkdir -p ~/.config/nvim
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if command -sq npm
  # Install VSCode language servers for Neovim LSP
  npm install --location=global vscode-langservers-extracted
else
  echo 'Error: npm required to install VSCode language servers for Neovim LSP'
end
