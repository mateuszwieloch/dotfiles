set -x

sudo xcode-select --install

brew install rbenv ruby-build

ln -s ~/code/mateuszwieloch/dotfiles/.rspec ~/.rspec
ln -s ~/code/mateuszwieloch/dotfiles/.irbrc ~/.irbrc
ln -s ~/code/mateuszwieloch/dotfiles/.gemrc ~/.gemrc
ln -s ~/code/mateuszwieloch/dotfiles/.pryrc ~/.pryrc
ln -s ~/code/mateuszwieloch/dotfiles/.rubocop.yml ~/.rubocop.yml

echo "# IMPORTANT: To install a particular version of ruby run $ rbenv install <version>"
