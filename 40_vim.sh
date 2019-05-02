brew install vim
ln -s /usr/local/bin/vim /usr/local/bin/vi

ln -s ~/code/dotfiles/.vimrc ~/.vimrc
ln -s ~/code/dotfiles/.gvimrc ~/.gvimrc

# Installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/code/dotfiles/.vim/ftplugin ~/.vim/ftplugin
ln -s ~/code/dotfiles/.vim/after ~/.vim/after
ln -s ~/code/dotfiles/.vim/snippets ~/.vim/snippets

# directory to store command history enabled by undofile
mkdir -p ~/.vim/undodir
