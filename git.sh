#!/bin/bash

set -x

# INSTALL GIT
# ===========
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install git
fi


# GITCONFIG
# =========
cp -i ../.gitconfig ~
echo "# IMPORTANT: user name and email are set to private GitHub!"


# SSH for GitHub
# ==============

# Generate SSH key
ssh-keygen -t rsa -b 4096 -C "github@mateuszwieloch.com"

# Equivalent of `eval "$(ssh-agent -s)"` already handled in config.fish

# Not sure if this is a run once or run every time
ssh-add ~/.ssh/id_rsa

cat ~/.ssh/id_rsa.pub
echo "ADD THE DISPLAYED KEY TO GITHUB"
echo "Go to GitHub -> Settings -> SSG and GPG keys -> New SSH Key"
