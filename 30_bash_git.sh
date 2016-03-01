# Bash {{{
echo "# Install latest bash (4.x)"
brew install bash

echo "# Append bash (4.x) to /etc/shells"
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'

echo "# Install fish-shell"
brew install fish

echo "# Append fish to /etc/shells"
sudo bash -c 'echo /usr/local/bin/fish >> /etc/shells'

echo "# Change to the new shell"
chsh -s /usr/local/bin/fish

echo "# Setup .bashrc and .profile"
cp -i .bashrc .profile ~

echo "# Setup .git-completion.bash"
cp -i .git-completion.bash ~
# }}}


# Git {{{
echo "# Install git"
brew install git

echo "# Setup .gitconfig"
cp -i .gitconfig ~

echo "# IMPORTANT: set your user name and email in ~/.gitconfig"
# }}}
