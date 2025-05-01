#!/usr/bin/env fish

winget.exe install wez.wezterm
set WINDOWS_HOME_DIR (wslpath (wslvar USERPROFILE))
mkdir -p $WINDOWS_HOME_DIR/.config/wezterm
cp ../.config/wezterm/wezterm.lua $WINDOWS_HOME_DIR/.config/wezterm/
