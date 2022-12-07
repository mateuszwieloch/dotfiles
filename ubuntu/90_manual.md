## Ungoogled Chrome

### Change settings

In 'Search Engine'->'Manage Search Engines':
- (prerequisite is to visit startpage.com and google.com)
- Add StartPage as a search engine URL=https://www.startpage.com/do/dsearch?query=%s SearchURL=
- Add Google as a search engine  URL=https://www.google.com/search?q=%s, SearchURL=https://www.google.com/complete/search?client=chrome&q=%s
- Change DuckDuckGo's keyword to `d`.

In 'On Startup':
- Select 'Continue where you left off'.

Cookies:
- Ungoogled-Chromium by defaults set the "Clear cookies and site data when you quit Chromium" flag in chrome://settings/content/cookies. You can still allow certain cookies there.
- `[*.]aws.amazon.com`
- `[*.]acloud.guru`
- `[*.]schwab.com`
- `[*.]wallst.com` # to make Screener work on Schwab website
- `[*.]wsj.com`

### Chromium

Extensions:
- [Chrome Web Store](https://github.com/NeverDecaf/chromium-web-store) - to be able to notify about extension updates
- Bitwarden
  - Auto-fill the last used login for the current website Ctrl+B
  - Settings -> Vault Timeout -> Never
  - Pin it
- Don't Close Window With Last Tab
- [Keyboard Shortcuts](https://chrome.google.com/webstore/detail/keyboard-shortcuts/lplcmnhgijkkmflbmhabnccgelffpnog?hl=en) or [Shortkeys](https://github.com/mikecrittenden/shortkeys/releases)
  - Keyboard Shortcuts is much more reliable as an extension. Shortcuts has more configurable shortcuts and import/export, but I've never really needed it.
  - Select previous tab Ctrl+H
  - Select next tab Ctrl+L
  - Move current tab left Ctrl+Shift+H
  - Move current tab right Ctrl+Shift+L
- SmoothScroll - to make mouse wheel scrolling usable in Chromium on Linux
  - Step size [px] -> 500
  - Acceleration scale -> 5
- [SimpleLogin](https://chrome.google.com/webstore/detail/simplelogin-open-source-e/dphilobhebphkdjbpfohgikllaljmgbn?hl=en)
  - Pin it
- Amazon Ad Blocker
- [GNOME Shell integration](https://chrome.google.com/webstore/detail/gnome-shell-integration/gphhapmejobijbbhgpjhcjognlahblep)
- Privacy Redirect
    - go to Options -> Advanced -> enable 'Use FreeTube over Invidious when possible'
- [LanguageTool](https://chrome.google.com/webstore/detail/grammar-and-spell-checker/oldceeleldhonbafppcapldpdifcinji?hl=en)

Ubuntu settings:

* Accessibility -> Repeat keys (click) -> make delay shorter and repeat faster
* Power -> Suspend & Power Button -> enable 'Show Battery Percentage'
* To open Nautilus file manager in a custom directory:
  ```
  cp /usr/share/applications/org.gnome.Nautilus.desktop ~/.local/share/applications/
  chmod +x ~/.local/share/applications/org.gnome.Nautilus.desktop
  vi ~/.local/share/applications/org.gnome.Nautilus.desktop
  ```
  and modify both lines with `Exec=` so they look like this:
  ```
  Exec=nautilus --new-window /your/desired/directory
  ```

## GNOME Extensions

[website](https://extensions.gnome.org) - don't forget to install browser extension to use it.

To check GNOME version go to Settings -> About.

Most useful extensions:
* Sound Input & Output Device Chooser 
* [Window is ready notification remover](https://extensions.gnome.org/extension/1007/window-is-ready-notification-remover/) - to improve notifications in Signal
* [Espresso](https://extensions.gnome.org/extension/4135/espresso/)
* [Panel Date Format](https://extensions.gnome.org/extension/3465/panel-date-format) Set format to `%F, %G` which translates to "2022-10-06, 12:56".
