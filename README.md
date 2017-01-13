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

## Extremely useful apps
1. [Command-Tab Plus](http://commandtab.noteifyapp.com)
2. [Day-0 2](http://www.shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock)
3. [Flux](https://justgetflux.com) installed via brew
4. [Caffeine](http://lightheadsw.com/caffeine/)
5. [Stock+](https://itunes.apple.com/us/app/stock-+/id527270840?mt=12)
6. [Skype](https://www.skype.com/en/download-skype/skype-for-computer/)
7. [FreeChat for Facebook Messanger](https://itunes.apple.com/us/app/freechat-for-facebook-messenger/id1077753332?mt=12)

## Safari exentsions
1. Adguard Adblocker
2. JSONAce
3. vimari
