#!/usr/bin/env kitty

set_color black --background=yellow
echo "Downloading and executing install script..."
set -x
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/code/mateuszwieloch/dotfiles/.config/kitty/ ~/.config
