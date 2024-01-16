#!/usr/bin/fish

set fish_trace 1

echo -e "[network]\ngenerateResolvConf = false" | sudo tee -a /etc/wsl.conf
sudo unlink /etc/resolv.conf
echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf 
