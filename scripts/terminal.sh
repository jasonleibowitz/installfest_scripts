####################################################################################
# Download and set Terminal colors to Solarized
####################################################################################
declare term_default=$(defaults read com.apple.terminal "Default Window Settings")
if [[ $term_default != *Solarized* ]]; then
  echo "Installing 'Solarized Colors' for Terminal..."
  curl -L -o "solarized.zip" https://github.com/tomislav/osx-terminal.app-colors-solarized/archive/master.zip;
  unzip "solarized.zip"
  open "osx-terminal.app-colors-solarized-master/Solarized Light.terminal"
  open "osx-terminal.app-colors-solarized-master/Solarized Dark.terminal"
  rm solarized.zip
  defaults write com.apple.terminal "Default Window Settings" -string "Solarized Dark"
  defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark"
  rm -rf "osx-terminal.app-colors-solarized-master"
else
  echo "Solarized Colors already installed";
fi
