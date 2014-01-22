if [ "$subl_vers" == "2" ]; then
  declare subl_settings="${HOME}/Library/Application Support/Sublime Text 2"
  # Symlink Sublime Text 2
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
else
  declare subl_settings="${HOME}/Library/Application Support/Sublime Text 3"
  # Symlink Sublime Text 3
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi

# Set sublime user preferences
declare user_prefs="Preferences.sublime-settings"
cp "$src_settings/sublime/$user_prefs" "$subl_settings/Packages/User/$user_prefs"

# Installing Package Control
declare pkg_control="Package Control.sublime-package"
declare pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
curl -L -o "$pkg_control" "$pkg_url"
mv "$pkg_control" "$subl_settings/Installed Packages"

# Install Packages
declare pkg_settings="Package Control.sublime-settings"
cp "$src_settings/sublime/$pkg_settings" "$subl_settings/Installed Packages/$pkg_settings"

# fin #
