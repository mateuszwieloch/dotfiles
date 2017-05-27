# Mac dotfiles and setup scripts

## What's that
It's a set of opinionated setup and installation scripts that tweak a brand new OS X installation into an environment optimized for development.

## Usage
1. Save files and close all software you don't need. Installation scripts will quietly restart Finder, Safari and other software as needed.
2. Run selected scripts one by one. The first two characters indicate a suggested order of execution.
```
$ bash 10_osx.sh
$ bash 20_brew.sh
etc...
```
3. Install vim plugins. Run vim and then run command :PlugInstall
4. Adjust .gitconfig
5. Setup Groupon ssh access by following [the guide](https://access.groupondev.com/getting_started).
6. Install a ruby version of your choice (rbenv is provided so now just run $ rbenv install <ruby-version>)

## Extremely useful apps
1. [Command-Tab Plus](http://commandtab.noteifyapp.com)
2. [Day-0 2](http://www.shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock)
3. [BetterSnapTool](https://itunes.apple.com/us/app/bettersnaptool/id417375580?mt=12)
4. [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake) installed via brew
5. [Stock+](https://itunes.apple.com/us/app/stock-+/id527270840?mt=12)
6. [Skype](https://www.skype.com/en/download-skype/skype-for-computer/)
7. [FreeChat for Facebook Messanger](https://itunes.apple.com/us/app/freechat-for-facebook-messenger/id1077753332?mt=12)
8. [Karabiner Elements](https://github.com/tekezo/Karabiner-Elements/pull/247) Currently needs to be installed from an unmerge PR. Changes Caps Lock into Esc or Ctrl depending if pressed stand-alone or with other keys.
  ln -sf ~/code/dotfiles/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json

## Safari exentsions
1. [Adguard Adblocker](https://adguard.com/en/adblock-adguard-safari.html)
2. [JSONAce](https://github.com/acrogenesis/JSONAce)
3. [PiedPiPr](https://github.com/JoeKuhns/PiedPiPer.safariextension) (Picture in Picture support for all videos in Safari)
4. [Vimmy](https://github.com/gggritso/Vimmy.safariextension)
