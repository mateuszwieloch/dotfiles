set -x

sudo xcode-select --install

brew install rbenv ruby-build

ln -s ~/code/dotfiles/.rspec ~/.rspec
ln -s ~/code/dotfiles/.irbrc ~/.irbrc
ln -s ~/code/dotfiles/.gemrc ~/.gemrc
ln -s ~/code/dotfiles/.pryrc ~/.pryrc
ln -s ~/code/dotfiles/.rubocop.yml ~/.rubocop.yml

echo "# IMPORTANT: To install a particular version of ruby run $ rbenv install <version>"
