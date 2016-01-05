# Mac dotfiles and setup scripts

## What's that
It's a set of opinionated setup and installation scripts that tweak a brand new OS X installation into an environment optimized for development.

Dotfiles get automatically copied to home folder when you run scripts.

## Usage
1. Save files and close all software you don't need. Installation scripts will quietly restart Finder, Safari and other software as needed.
2. Run selected `*.sh` and `*.applescript` scripts one by one. The first two characters indicate a suggested order of execution.
```
$ bash 10_osx.sh
$ osascript 11_capslock-to-control.applescript
$ bash 20_brew.sh
etc...
```
3. Add additional vim plugins. Many popular plugins that you may like are listed in the .vimrc file.  
4. Install vim plugins. Run vim and then run command :PluginInstall 
5. If you want to use vim-airline, choose a powerline font in iTerm (any font with name containing "powerline")
6. Adjust .gitconfig
7. (very optional) add a button to Finder that opens iTerm2 in the current folder: https://github.com/jbtule/cdto
8. Setup Groupon ssh access by following [the guide](https://access.groupondev.com/getting_started).
9. Install a ruby version of your choice (rbenv is provided so now just run $ rbenv install <ruby-version>)
