#!/usr/bin/env fish

# source: https://atar-axis.github.io/xpadneo/


# prerequisites, should already by there
sudo apt-get install dkms linux-headers-(uname -r)

pushd ~/code/tmp
git clone https://github.com/atar-axis/xpadneo.git
cd xpadneo
sudo ./install.sh
popd
