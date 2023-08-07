#!/usr/bin/env fish

# dependencies
echo "Installing dependencies..."
set fish_trace 1
sudo add-apt-repository universe
sudo apt install libfuse2

set_color black --background=yellow
echo "Manually download (cannot figure out how to auto-download): https://www.pcloud.com/how-to-install-pcloud-drive-linux.html?download=electron-64#"
echo "Put it in ~/bin folder"

