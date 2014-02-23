echo "Installing settings for Sublime Text $subl_vers"

if [ "$SUBL_VERS" == "2" ]; then
  # subl_settings="${HOME}/Library/Application Support/Sublime Text 2"
  # Symlink Sublime Text 2
  ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
else
  # Symlink Sublime Text 3
  ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl
fi
subl_settings="${HOME}/Library/Application Support/Sublime Text*"

# Set sublime user preferences
user_prefs="Preferences.sublime-settings"
cp "$SETTINGS/sublime/$user_prefs" "$subl_settings/Packages/User/$user_prefs"

# Installing Package Control
pkg_control="Package Control.sublime-package"
pkg_url="https://sublime.wbond.net/Package%20Control.sublime-package"
curl -L -o "$subl_settings/Installed Packages/$pkg_control" "$pkg_url"

# Install Packages
pkg_settings="Package Control.sublime-settings"
cp "$SETTINGS/sublime/$pkg_settings" "$subl_settings/Installed Packages/$pkg_settings"

# fin #
