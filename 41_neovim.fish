brew install neovim
ln -sf /usr/local/bin/nvim /usr/local/bin/vi

# install vim-plug for plugins management
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/code/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
