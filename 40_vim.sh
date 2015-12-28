echo "# Install vim"
brew install vim --override-system-vi 

echo "# Move .vimrc"
cp -i .vimrc ~

echo "# Move .vim/ (with color themes)"
cp -i -R .vim ~

echo "# Install vundle (package manager for vim)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "# Install fonts for airline"
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts
