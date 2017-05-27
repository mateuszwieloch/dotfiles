echo "# Installing xcode (command line tools)"
sudo xcode-select --install

echo "# Installing rbenv and ruby-build"
brew install rbenv ruby-build

echo "# Symlink .rspec"
ln -s ~/code/dotfiles/.rspec ~/.rspec

echo "# Symlink .irbrc"
ln -s ~/code/dotfiles/.irbrc ~/.irbrc

echo "# Symlink .gemrc"
ln -s ~/code/dotfiles/.gemrc ~/.gemrc

echo "# Symlink .pryrc"
ln -s ~/code/dotfiles/.pryrc ~/.pryrc

echo "# IMPORTANT: To install a particular version of ruby run $ rbenv install <version>"
