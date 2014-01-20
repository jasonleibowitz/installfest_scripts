if [ $subl_vers == "2" ]; then
  declare sublime_settings="${HOME}/Library/Application Support/Sublime Text 2"
  # Symlink Sublime Text 2
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
else
  declare sublime_settings="${HOME}/Library/Application Support/Sublime Text 3"
  # Symlink Sublime Text 3
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Set sublime user preferences
cp "$source_files/sublime/Preferences.sublime-settings" "$sublime_settings/Packages/User/Preferences.sublime-settings"

# Installing Package Control
curl -L -o "Package Control.sublime-package" "https://sublime.wbond.net/Package%20Control.sublime-package"
mv "Package Control.sublime-package" "$sublime_settings/Installed Packages"

# Install Packages
cp "$source_files/sublime/Package Control.sublime-settings" "$sublime_settings/Installed Packages/Package Control.sublime-settings"


