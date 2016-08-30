echo "# Install vim"
brew install vim --with-override-system-vi

echo "# Setup .vimrc"
cp -i .vimrc ~

echo "# Setup .vim/ (with color themes)"
cp -i -R .vim ~

echo "# Install vundle (package manager for vim)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "# Install fonts for airline"
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
