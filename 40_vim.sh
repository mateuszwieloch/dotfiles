echo "# Install vim"
brew install vim --with-override-system-vi

echo "# Symlink .vimrc"
ln -s ~/code/dotfiles/.vimrc .vimrc

echo "# Setup .vim/ (snippets)"
cp -i -R ~/code/dotfiles/.vim ~

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
