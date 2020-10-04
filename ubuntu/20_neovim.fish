set -x
apt install neovim
ln -sf /usr/bin/nvim /usr/bin/vi

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p ~/.config/nvim
ln -s ~/code/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
