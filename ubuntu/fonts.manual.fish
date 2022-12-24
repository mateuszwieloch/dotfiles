#!/usr/bin/env fish

sudo apt-get install font-manager

sudo http --download 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FiraMono.zip' --output="$HOME/Downloads/FiraMono.zip"

set_color black --background=yellow
echo
echo
echo "Now open the Font Manager app and add the ~/Downloads/FiraMono.zip font."
echo "Confusingly the actual font name is FuraMono Nerd Font."

echo
echo "Also, go to GNOME Tweaks app -> Fonts ->"
echo "1) Enable Subpixel Antialiasing"
echo "2) Set Hinting to Full"
set_color normal
