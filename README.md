# Mac dotfiles and setup scripts


## macOS
- Stop rearranging Desktops. Open System Preferences -> Mission Control -> uncheck 'Automatically rearrange Spaces based on most recent use'.
- remove Siri and Spotlight menu bar icons (see below)

Remove Siri and Spotlight icons (requires disabling System Integration Protection):
- restart macOS and hold ⌘R to enter Recovery Mode
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
- in settings, go to Text tab and disable 'Capitalize words automatically', 'Add period with double-space', 'Use smart quotes and dashes'
- in settings, go to Shortcuts and disable:
    - Under Keyboard: Show/Hide Trackpad Handwriting (conflicts with IntelliJ)
    - Under Services: Search man Page Index in Terminal (conflicts with FindAction in IntelliJ)
    - Under Spotlight: Disable everything (use Alfred instead)
- in settings, go to Input Sources tab and disable 'Show Input menu in menu bar'
- disable Character Accent Menu with: `defaults write -g ApplePressAndHoldEnabled -bool false`

Safari.app:
- Duplicate Tab ⌘D
- Close Tab ⌘W
- Show Next Tab ⌘L
- Show Previous Tab ⌘H
- Open Location... ⌘O
- Pin Tab ⌘;  (⌘. doesn't work - probably a bug in Safari)
- Unpin Tab ⌘;

Chromium.app:
- Duplicate Tab ⌘ShiftD
- Select Next Tab ⌘L
- Select Previous Tab ⌘H
- Bookmark This Tab... (to free ⌘D)
- Open Location... ⌘D (to work on Linux too)
- Pin Tab ⌘;

Utilities/Terminal.app:
- Show Next Tab ⌘L
- Show Previous Tab ⌘H

kitty.app
- Hide kitty <some ridiculous mapping>


## Finder
- Preferences, set General->New Finder windows show: Downloads
- In Sidebar, remove useless locations
- In Advanced, set "Show all filename extensions", and "In windows when sorting by name"


## Extremely useful apps
1. [Magnet](https://itunes.apple.com/us/app/magnet/id441258766?mt=12)
  - define snap areas for Left third, Middle third, and Right third
  - maximize: ^⇧ ⌘M
  - left half: ^⇧ ⌘H
  - right half: ^⇧ ⌘L
  - left third: ^⇧ ⌘G
  - right third: ^⇧ ⌘;
2. [ToothFairy](https://itunes.apple.com/us/app/toothfairy/id1191449274?mt=12) - simpifies connection to wireless headphones
3. [Ethernet Status](https://apps.apple.com/us/app/ethernet-status/id1186187538?mt=12)
4. [Facebook Messenger](https://apps.apple.com/app/messenger/id1480068668)
5. [pCloud](https://www.pcloud.com/download-free-online-cloud-file-storage.html)


## Browsers

In Chromium-based browsers you may need to disable "Use hardware acceleration when available" to avoid scroll lag when on battery. The lag is due to switching between integrated and dGPU.

### ungoogled-chromium (cask)
Because Firefox doesn't support custom shortcuts like ⌘O 'search bar' and 'next/prev tab' ⌘L/⌘H.

Extensions: 
- [Chrome Web Store](https://github.com/NeverDecaf/chromium-web-store) - to be able to notify about extension updates
- [Bitwarden](https://chrome.google.com/webstore/detail/bitwarden-free-password-m/nngceckbapebfimnlniiiahkandclblb)
- [SimpleLogin](https://chrome.google.com/webstore/detail/simplelogin-open-source-e/dphilobhebphkdjbpfohgikllaljmgbn)
- [xBrowserSync](https://chrome.google.com/webstore/detail/xbrowsersync/lcbjdhceifofjlpecfpeimnnphbcjgnc?hl=en) - encrypted, no account bookmarks sync.
- [Don't Close Window With Last Tab](https://chrome.google.com/webstore/detail/dont-close-window-with-la/dlnpfhfhmkiebpnlllpehlmklgdggbhn)
- [Rearrange Tabs](https://chrome.google.com/webstore/detail/rearrange-tabs/ccnnhhnmpoffieppjjkhdakcoejcpbga)
    ```
    1. Go to `chrome://extensions/shortcuts`
    2. Scroll down to locate `Rearrange Tabs`.
    3. Click in the greyed out fields for `Not set`.
    4. Move selected tab(s) left = ⇧⌘H
    5. Move selected tab(s) right = ⇧⌘L
    ```
- [Amazon Ad Blocker](https://chrome.google.com/webstore/detail/amazon-ad-blocker/heakoamokkehmhdmhinhhchfpleokalg)
- [LanguageTool](https://chrome.google.com/webstore/detail/grammar-and-spell-checker/oldceeleldhonbafppcapldpdifcinji)

### Safari
- in Preferences, General, Safari Opens With choose 'All non-private windows from last session'
