# BASH
echo "# Install latest bash (4.x)"
brew install bash

echo "# Append the new shell to /etc/shells"
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

echo "# Change to the new shell"
chsh -s /usr/local/bin/bash

echo "# Overrite .bashrc and .profile"
cp -i .bashrc .profile ~

echo "# Move .git-completion.bash"
cp -i .git-completion.bash ~

# GIT
echo "# Install git"
brew install git

echo "# Move .gitconfig"
cp -i .gitconfig ~
