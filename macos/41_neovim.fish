brew install neovim
ln -sf /usr/local/bin/nvim /usr/local/bin/vi
ln -sf /usr/local/bin/nvim /usr/local/bin/vim

# install vim-plug for plugins management
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim

ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/ftdetect ~/.config/nvim/ftdetect
