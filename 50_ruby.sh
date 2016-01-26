echo "# Installing xcode (command line tools)"
sudo xcode-select --install

echo "# Installing rbenv and ruby-build"
brew install rbenv ruby-build

# This line has to be run each time - running here and adding to .bashrc
eval "$(rbenv init -)"

echo "# Setup .rspec"
cp -i .rspec ~

echo "# IMPORTANT: To install a particular version of ruby run $ rbenv install <version>"
