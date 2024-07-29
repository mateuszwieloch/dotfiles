#!/usr/bin/env fish

set fish_trace 1

sudo apt install gnupg2 apt-transport-https
wget -O - https://pkg.wslutiliti.es/public.key | sudo gpg -o /usr/share/keyrings/wslu-archive-keyring.pgp --dearmor
echo "deb [signed-by=/usr/share/keyrings/wslu-archive-keyring.pgp] https://pkg.wslutiliti.es/debian bookworm main" | sudo tee /etc/apt/sources.list.d/wslu.list

sudo apt update


# These commands allow to open html link in Windows browser from WSL
sudo apt install wslu
set --export --universal BROWSER "wslview"
