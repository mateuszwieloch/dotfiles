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

## macOS
- enable MacOS Night Shift feature

## Keyboard

- in settings, go to Text tab and disable 'Capitalize words automatically' and 'Add period with double-space'
- in settings, go to Input Sources tab and disable 'Show Input menu in menu bar'
- disable Character Accent Menu with: `defaults write -g ApplePressAndHoldEnabled -bool false`

Safari.app:
- Close Tab ⌘ W
- Show Next Tab ⌘ L
- Show Previous Tab ⌘ H
- Open Location... ^L

Terminal.app:
- Show Next Tab ⌘ L
- Show Previous Tab ⌘ H

## Finder
- Preferences, set General->New Finder windows show: Downloads

## Notes
- Preferences, set 'Sort notes by' to 'Title'
- Preferences, set 'New notes start with' to 'Title'

## Extremely useful apps
1. [Command-Tab Plus](http://commandtab.noteifyapp.com)
2. [Day-0 2](http://www.shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock)
3. [Magnet](https://itunes.apple.com/us/app/magnet/id441258766?mt=12) OR [BetterSnapTool](https://itunes.apple.com/us/app/bettersnaptool/id417375580?mt=12)
  - define snap areas for Left third, Middle third, and Right third
  - maximize: ^⇧ ⌘ M
  - left half: ^⇧ ⌘ H
  - right half: ^⇧ ⌘ L
  - left third: ^⇧ ⌘ G
  - right third: ^⇧ ⌘ ;

4. [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake) installed via brew
5. [Stock+](https://itunes.apple.com/us/app/stock-+/id527270840?mt=12)
6. [Skype](https://www.skype.com/en/download-skype/skype-for-computer/)
7. [FreeChat for Facebook Messanger](https://itunes.apple.com/us/app/freechat-for-facebook-messenger/id1077753332?mt=12)
8. [Karabiner Elements](https://github.com/tekezo/Karabiner-Elements)
  - in Preferences, Misc, disable 'Show icon in menu bar'


## Safari

- in Preferences, General, Safari Opens With choose 'All windows from last session'

Add extensions
1. [Adguard Adblocker](https://adguard.com/en/adblock-adguard-safari.html)
2. [Ghostery](https://www.ghostery.com/products/)
  - enable blocking for all categories in Options->General
3. [JSONAce](https://github.com/acrogenesis/JSONAce)
