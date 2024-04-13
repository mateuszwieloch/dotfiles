#!/usr/bin/fish
set fish_trace 1

# Install SBCL and SDL2
sudo apt-get install sbcl build-essential libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev

# Install qlot
curl -L https://qlot.tech/installer | bash
fish_add_path $HOME/.qlot/bin

mkdir $HOME/common-lisp
cd $HOME/common-lisp
git clone https://github.com/lem-project/lem.git
cd lem && make sdl2

fish_add_path $HOME/common-lisp/lem
