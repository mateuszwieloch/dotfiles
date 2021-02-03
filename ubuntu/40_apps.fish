set -x

# Command line tools {{{

sudo apt install --yes ripgrep
sudo ln -s ~/code/dotfiles/.ripgreprc ~/.ripgreprc
sudo apt install --yes bat
# on Debian executable is called batcat, because bat is conflicting with another bat executable
sudo ln -s /usr/bin/batcat /usr/bin/bat
sudo apt install --yes tree
sudo apt install --yes httpie

# }}}


# AppImage {{{

# pcloud
# manual download (cannot figure out how to auto-download): https://www.pcloud.com/how-to-install-pcloud-drive-linux.html?download=electron-64#
# put it in ~/Applications folder

# AppImageLauncher (integration of AppImage into Ubuntu desktop)
# sudo add-apt-repository ppa:appimagelauncher-team/stable
# sudo apt update
# sudo apt install --yes appimagelauncher

# }}}


# Graphical tools (apt){{{

# kitty
sudo apt install --yes kitty
mkdir -p ~/.config/kitty
ln -sf ~/code/dotfiles/.config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# qbittorrent
sudo add-apt-repository --yes ppa:qbittorrent-team/qbittorrent-stable
sudo apt-get update && sudo apt install --yes qbittorrent

# signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt install --yes signal-desktop

# vlc
sudo apt install --yes vlc

# }}}


# Flatpak (comes with PopOS) {{{
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# calibre
flatpak install --assumeyes flathub com.calibre_ebook.calibre
# manually add keyboard shortcuts:
# n = Scroll forwards smoothly

# freetube
sudo flatpak install --assumeyes flathub io.freetubeapp.FreeTube

# obsidian (also available as AppImage and Snap)
sudo flatpak install --assumeyes flathub md.obsidian.Obsidian

# ungoogled-chromium
sudo flatpak install --assumeyes flathub com.github.Eloston.UngoogledChromium
# manual:
# 1) add Google as search engine 1) URL=https://www.google.com/search?q=%s, SearchURL=https://www.google.com/complete/search?client=chrome&q=%s
# 2) In Settings -> Appearance -> 'On Startup' section -> select 'Continue where you left off'

# skype
sudo flatpak install --assumeyes flathub com.skype.Client

# }}}


# }}}
