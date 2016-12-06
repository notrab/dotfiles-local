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

echo "Speed up dock show/hide animation."
defaults write com.apple.dock autohide-time-modifier -float 0.5
killall Dock

echo "Set bottom left hot corner for screensaver"
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

echo "Restart Finder. Logout also required"
killall Finder
