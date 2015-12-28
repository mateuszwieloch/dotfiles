# Mac dotfiles and setup scripts

## How does it work
Provided scripts install basic software and setup decent initial config for OS X, brew, bash, git and vim.

Dotfiles get automatically copied to home folder when you run scripts.

## Usage
1. Run selected `*.sh` and `*.applescript` scripts one by one. The first two characters indicate a suggested order of execution.
```
$ bash 10_osx.sh
$ osascript 11_capslock-to-control.applescript
$ bash 20_brew.sh
etc...
```
2. If you want to use vim-airline, choose a powerline font in iTerm (any font with name containing "powerline")
3. Adjust .gitconfig
