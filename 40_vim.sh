echo "# Install vim"
brew install macvim

echo "# Symlink .vimrc"
ln -s ~/code/dotfiles/.vimrc ~/.vimrc

echo "# Symlink .gvimrc"
ln -s ~/code/dotfiles/.gvimrc ~/.gvimrc

echo "# Installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "# Symlink ~/.vim/ftplugin"
ln -s ~/code/dotfiles/.vim/ftplugin ~/.vim/ftplugin

echo "# Symlink ~/.vim/after"
ln -s ~/code/dotfiles/.vim/after ~/.vim/after

echo "# Symplink ~/.vim/snippets"
ln -s ~/code/dotfiles/.vim/snippets ~/.vim/snippets
