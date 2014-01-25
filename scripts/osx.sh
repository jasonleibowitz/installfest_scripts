# # Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false

# # Reveal IP address, hostname, OS version, etc. when clicking the clock
# # in the login window
# sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# # Disable the warning when changing a file extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# # Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4

# # Use a modified version of the Pro theme by default in Terminal.app
# open "${HOME}/init/Mathias.terminal"
# sleep 1 # Wait a bit to make sure the theme is loaded
# defaults write com.apple.terminal "Default Window Settings" -string "Mathias"
# defaults write com.apple.terminal "Startup Window Settings" -string "Mathias"

# # Install Sublime Text settings
# cp -r init/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text*/Packages/User/Preferences.sublime-settings 2> /dev/null

# spectacle
# http://support.apple.com/kb/HT5914
# codesign -s - --resource-rules=/Users/YourUserNameHere/ResourceRules-ignoring-Scripts.plist /path/to/applet.app

# https://github.com/chytreg/dotfiles/blob/c532970fb63a78b2507141b4de26b3c8e25c2bfc/bin/bootstrap
allow_control() {
  if [[ "$OSTYPE" =~ ^darwin13.*$ ]]; then
    for app; do
      APP_ID="$(osascript -e "id of app \"$app\"")"
      if [[ -n "$APP_ID" ]]; then
        sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "INSERT or REPLACE INTO access values ('kTCCServiceAccessibility', '$APP_ID', 0, 1, 0, NULL);"
      fi
    done
  else
    echo "allow_control works only on Mavericks"
  fi
}

allow_control Spectacle

# also look into brew cask for installing applications
# https://github.com/Homebrew/homebrew/wiki/External-Commands