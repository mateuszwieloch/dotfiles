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
- Stop rearranging Desktops. Open System Preferences -> Mission Control -> uncheck 'Automatically rearrange Spaces based on most recent use'.
- remove Siri and Spotlight menu bar icons (see below)
- To prevent Pulse Secure from starting on boot, create an Automator application that will run shell command `launchctl unload –w /Library/LaunchAgents/net.pulsesecure.pulsetray.plist`. Add that application to Login Items in macOS Users & Groups settings.

### Changes requiring System Integration Protection to be disabled
- restart macOS and hold ⌘ R to enter Recovery Mode
- from Utilities option on menu bar open Terminal and type `csrutil status`
- disable SIP with `csrutil disable`
- reboot into regular mode
- `cd /System/Library/CoreServices/Spotlight.app/Contents/MacOS`
- make a backup copy `sudo cp Spotlight Spotlight.bak`
- modify icon to make it 0 width (but keep Spotlight working) `sudo perl -pi -e 's|(\x00\x00\x00\x00\x00\x00\x47\x40\x00\x00\x00\x00\x00\x00)\x42\x40(\x00\x00\x80\x3f\x00\x00\x70\x42)|$1\x00\x00$2|sg' Spotlight`
- Make sure changes look good `cmp -l Spotlight Spotlight.bak`
  = 248855 0 102
  = 248856 0 100
- sign new Spotlight `sudo codesign -f -s - Spotlight`
- `sudo killall Spotlight`
- reenable SIP


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

kitty.app
- Hide kitty <some ridiculous mapping>

## Finder
- Preferences, set General->New Finder windows show: Downloads
- In Tags, remove all tags
- In Sidebar, remove useless locations
- In Advanced, set "Show all filename extensions", and "In windows when sorting by name"

## Notes
- Preferences, set 'Sort notes by' to 'Title'
- Preferences, set 'New notes start with' to 'Title'

## PyCharm
Keymap
- Select Next Tab ⌘ L
- Select Previous Tab ⌘ H
Editor
  General
    - turn on 'Ensure line feed at file end on Save', otherwise PyCharm PEP8 checker constantly complains

## Extremely useful apps
1. Bear
  - "Note->Copy Link To Note" Cmd+Shift+C
2. [Day-0 2](http://www.shauninman.com/archive/2016/10/20/day_o_2_mac_menu_bar_clock)
3. [Magnet](https://itunes.apple.com/us/app/magnet/id441258766?mt=12)
  - define snap areas for Left third, Middle third, and Right third
  - maximize: ^⇧ ⌘ M
  - left half: ^⇧ ⌘ H
  - right half: ^⇧ ⌘ L
  - left third: ^⇧ ⌘ G
  - right third: ^⇧ ⌘ ;
4. [KeepingYouAwake](https://github.com/newmarcel/KeepingYouAwake) installed via brew
5. [NightOwl](https://nightowl.kramser.xyz/)
6. [Skype](https://www.skype.com/en/download-skype/skype-for-computer/)
7. [FreeChat for Facebook Messanger](https://itunes.apple.com/us/app/freechat-for-facebook-messenger/id1077753332?mt=12)
8. [Karabiner Elements](https://github.com/tekezo/Karabiner-Elements)
  - in Preferences, Misc, disable 'Show icon in menu bar'
9. [Postman](https://www.getpostman.com/) or [Insomnia](https://insomnia.rest/) $50/year for sync
10. [qBittorrent](https://www.qbittorrent.org/download.php)
11. [VLC](https://www.videolan.org/vlc/)
12. [ToothFairy](https://itunes.apple.com/us/app/toothfairy/id1191449274?mt=12) - simpifies connection to wireless headphones


## Safari

- in Preferences, General, Safari Opens With choose 'All windows from last session'

Add extensions
1. Dashlane
2. uBlockOrigin
3. [JSONAce](https://github.com/acrogenesis/JSONAce)
