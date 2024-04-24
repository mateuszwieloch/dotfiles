#!/usr/bin/fish

set fish_trace 1

sudo apt update
sudo apt full-upgrade

sudo apt-get install curl \
  # A lot of dev apps require a C compiler
  build-essential \
  wget \
  # sed replacement
  sd \
  tree \
  # For AppImages to work
  fuse libfuse2

# grep replacement
sudo apt-get install ripgrep \
  && sudo ln -sf ~/code/mateuszwieloch/dotfiles/.ripgreprc  ~/.ripgreprc

# find replacement
sudo apt-get install fd-find \
  && sudo ln -sf (which fdfind) /usr/bin/fd

# cat replacement with syntax highlighting and Git integration
# https://github.com/sharkdp/bat
sudo apt-get install bat \
  && sudo ln -sf (which batcat) /usr/bin/bat

# eza - a ls replacement. I use it in ll.fish. It's only available in Debian Unstable or from a custom source.
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza
