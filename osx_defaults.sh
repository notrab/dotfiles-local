echo "Immediately require password after sleep or screensaver"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

echo "Enable tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo "Enable dialog tabbing"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Don't allow apps to reopen on start"
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

echo "Enable automatic update checking"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

echo "Download newly available updates in the background"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

echo "Turn on auto update"
defaults write com.apple.commerce AutoUpdate -bool true

echo "Expand print dialog in Chrome by default"
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true
defaults write com.google.Chrome.canary PMPrintingExpandedStateForPrint2 -bool true

echo "Disable local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal

echo "Disable Time Machine asking to use new external drive for backups"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "Disable the 'Are you sure you want to open this application?' dialog."
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo "Show the ~/Library folder."
chflags nohidden ~/Library

echo "Disable press-and-hold keys"
defaults write -g ApplePressAndHoldEnabled -bool false

echo "Improve keyboard repeate rate"
defaults write NSGlobalDomain KeyRepeat -int 0

echo "Decrease delay for key repeats"
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "Automatically show/hide the dock"
defaults write com.apple.dock autohide -bool true

echo "Change the size of the dock"
defaults write com.apple.dock tilesize -int 70

echo "Speed up dock show/hide animation."
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

echo "Disable the Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

echo "Set bottom left hot corner for screensaver"
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "Disable the iTerm 'Are you sure you want to quit?' dialog"
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

echo "Restart Finder. Logout also required"
killall Finder
