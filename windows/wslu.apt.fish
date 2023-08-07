#!/usr/bin/env fish

set fish_trace 1

# These commands allow to open html link in Windows browser from WSL
sudo apt install wslu
set --export --universal BROWSER "wslview"
