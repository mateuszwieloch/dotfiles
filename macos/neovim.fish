#!/usr/bin/fish

set fish_trace 1

brew install neovim
sudo ln -sf $HOMEBREW_PREFIX/bin/nvim /usr/bin/vi
sudo ln -sf $HOMEBREW_PREFIX/bin/nvim /usr/bin/vim

mkdir -p ~/.config/nvim
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -s ~/code/mateuszwieloch/dotfiles/.config/nvim/after ~/.config/nvim/after


# On Linux with X11 the clipboard feature requires xclip
if test (uname) = "Linux"
  echo "Detected Linux"
  set DISPLAY_SERVER (loginctl show-session (loginctl | awk '/tty/ {print $1}') -p Type | awk -F= '{print $2}')
  if test "$DISPLAY_SERVER" = "x11"
    echo "Detected X11"
    brew install xclip
  else
    echo "X11 display server not detected. Skipping xclip installation."
  end
else
  echo "Linux not detected. Skipping xclip installation."
end

# Lua language server is essenitial to get in config files
brew install lua-language-server
