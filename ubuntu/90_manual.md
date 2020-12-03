## Ungoogled Chrome

### Change settings

In 'Appearance':
- Uncheck 'Show home button'. 
- Uncheck 'Use system title bar and borders'.

In 'Search Engine'->'Manage Search Engines':
- (prerequisite is to visit startpage.com and google.com)
- Add StartPage as a search engine and assign it keyword `s`.
- Add Google as a search engine and assign it keyword `g`.
- Change DuckDuckGo's keyword to `d`.

In 'On Startup':
- Select 'Continue where you left off'.


### Install apps
- Calibre - in the 40_app file
- [LBRY](https://lbry.com/get)
- [FreeTube](https://freetubeapp.io/#download)

### Chromium

Extensions:
- [Chrome Web Store](https://github.com/NeverDecaf/chromium-web-store) - to be able to notify about extension updates
- Bitwarden
- Don't Close Window With Last Tab
- [Shortkeys](https://github.com/mikecrittenden/shortkeys/releases)
  - has more configurable shortcuts than the Keyboard Shortcuts extension
  - can export/import configuration
  - Select previous tab Ctrl+H
  - Select next tab Ctrl+L
  - Move current tab left Ctrl+Shift+H
  - Move current tab right Ctrl+Shift+L
- SmoothScroll - to make mouse wheel scrolling usable in Chromium on Linux
- Amazon Ad Blocker
- [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
- Privacy Redirect
- Adblock for YouTube
- LanguageTool
- Workona

Settings:
- Ungoogled-Chromium by defaults set the "Clear cookies and site data when you quit Chromium" flag in chrome://settings/content/cookies You can still allow certain cookies there (for example for `[*.]aws.amazon.com`)

## Scroll wheel speed adjustment

1. `sudo apt install imwheel`
2. Run `91_scroll_wheel_script.sh` to set desired scroll wheel speed.
3. Run `Startup Applications` app and add `imwheel` to run on startup.

## GNOME Extensions

[website](https://extensions.gnome.org) - don't forget to install browser extension to use it.

* Remove Dropdown Arrows
* Sound Input & Output Device Chooser 
* [Window is ready notification remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/) - to improve notifications in Signal

