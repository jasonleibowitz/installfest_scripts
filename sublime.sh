# clear terminal screen
clear

# Sublime Text 2
if [ -x /Applications/Sublime\ Text\ 2.app/ ]; then
  echo "Sublime already installed..."
else
  echo "Installing Sublime Text 2"
  curl -L -o "Sublime Text 2.0.2.dmg" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg"
  hdiutil mount "Sublime Text 2.0.2.dmg"
  cp -R "/Volumes/Sublime Text 2/Sublime Text 2.app" /Applications
  hdiutil unmount "/Volumes/Sublime Text 2"
  rm "Sublime Text 2.0.2.dmg"
fi

# Download and write sublime system settings
# http://unix.stackexchange.com/questions/19608/how-can-i-specify-that-curl-via-command-line-overwrites-a-file-if-it-already-e

# Set sublime user preferences
# curl https://gist.github.com/phlco/6871610/raw/4ee94373d770da2ffd02fb655d1e57097cebb18e/Preferences.sublime-settings > ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
cp "dotfiles/Preferences.sublime-settings" ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings

# Installing Package Control for Sublime Text 2
curl -L -o "Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"
mv "Package Control.sublime-package" ~/Library/Application\ Support/Sublime\ Text\ 2/Installed\ Packages

# Install Packages
# https://github.com/mrmartineau/SublimeTextSetupWiki/issues/3
cp "dotfiles/Package Control.sublime-settings" "/Users/philco/Library/Application Support/Sublime Text 2/Installed Packages/Package Control.sublime-settings"

# Setup symlink
# https://gist.github.com/olivierlacan/1195304
ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
