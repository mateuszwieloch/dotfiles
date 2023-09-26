#!/usr/bin/env fish

# Debian-based font dirs:
# * System-wide /usr/local/share/fonts
# * User-specific ~/.local/share/fonts or ~/.fonts

# fc-list to list fonts

# unzip doesn't support input pipe, so we need to do it in 2 steps
http --download 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip' --output="/tmp/FiraMono.zip"
unzip /tmp/FiraMono.zip -d "$HOME/.local/share/fonts/"
