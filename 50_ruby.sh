echo "# Installing rbenv and ruby-build"
brew install rbenv ruby-build

# This line has to be run each time - running here and addint to .bashrc
eval "$(rbenv init -)"

echo "# To install a particular version of ruby run $ rbenv install <version>"
