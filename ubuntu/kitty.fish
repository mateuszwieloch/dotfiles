#!/usr/bin/env fish

set_color black --background=yellow
echo "Downloading and executing install script..."
set fish_trace 1
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/code/mateuszwieloch/dotfiles/.config/kitty/ ~/.config
