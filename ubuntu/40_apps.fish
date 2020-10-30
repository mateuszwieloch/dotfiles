# Command line tools {{{
apt install ripgrep
ln -s ~/code/dotfiles/.ripgreprc ~/.ripgreprc
apt install bat
apt install tree
apt install httpie
# }}}

# AppImageLauncher (integration of AppImage into Ubuntu desktop)
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher

# Ungoogled Chrome
echo 'deb http://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/ /' | sudo tee /etc/apt/sources.list.d/home-ungoogled_chromium.list > /dev/null
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/Release.key' | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home-ungoogled_chromium.gpg > /dev/null
sudo apt update
sudo apt install -y ungoogled-chromium

# Graphical tools (apt){{{

# calibre
sudo -v && wget --no-check-certificate -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# kitty
apt install kitty
mkdir -p ~/.config/kitty
ln -sf ~/code/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install signal-desktop

# }}}

# flatpak
sudo flatpak install flathub md.obsidian.Obsidian
