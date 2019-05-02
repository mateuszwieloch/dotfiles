echo "Fast keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 0.02

echo "Shorter delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 12

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Save screenshots to ~/Documents/Screenshots"
mkdir ~/Documents/Screenshots
defaults write com.apple.screencapture location ~/Documents/Screenshots

echo "Remove delay for showing hidden Dock"
defaults write com.apple.Dock autohide-delay -float 0

echo "Speed up Dock animations"
defaults write com.apple.dock autohide-time-modifier -float 0.35

echo "Kill affected applications, so the changes apply"
for app in Safari Finder Dock SystemUIServer; do killall "$app" >/dev/null 2>&1; done
