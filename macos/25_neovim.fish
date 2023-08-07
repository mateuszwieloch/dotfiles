set fish_trace 1

brew install neovim
ln -sf /usr/local/bin/nvim /usr/local/bin/vi

mkdir -p ~/.config/nvim
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install VSCode language servers for Neovim LSP
npm install --location=global vscode-langservers-extracted
