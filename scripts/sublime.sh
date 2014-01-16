# Download and write sublime system settings
# http://unix.stackexchange.com/questions/19608/how-can-i-specify-that-curl-via-command-line-overwrites-a-file-if-it-already-e

# Set sublime user preferences
# curl https://gist.github.com/phlco/6871610/raw/4ee94373d770da2ffd02fb655d1e57097cebb18e/Preferences.sublime-settings > ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings
cp "dotfiles/Preferences.sublime-settings" "~/Library/Application Support/Sublime Text 2/Packages/User/Preferences.sublime-settings"

# Installing Package Control for Sublime Text 2
curl -L -o "Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"
mv "Package Control.sublime-package" "~/Library/Application Support/Sublime Text 2/Installed Packages"

# Install Packages
# https://github.com/mrmartineau/SublimeTextSetupWiki/issues/3
cp "dotfiles/Package Control.sublime-settings" "~Library/Application Support/Sublime Text 2/Installed Packages/Package Control.sublime-settings"

# Setup symlink
# https://gist.github.com/olivierlacan/1195304
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
