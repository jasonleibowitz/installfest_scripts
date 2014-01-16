# This script installs applications we'll be using in class

lend_me_your () {
  app_name=$1
  app_url=$2
  if [ -x "/Applications/$app_name.app" ]; then
    echo "$app_name already installed..."
  else
    echo "Installing $app_name"
    # check file type
    # hark! a zip!
    if [ ${app_url: -4} == ".zip" ]; then
        mkdir $app_name
        curl -L -o source.zip $app_url
        unzip source.zip -d $app_name
        mv $app_name/*.app /Applications
        # clean up
        rm -rf source.zip
        rm -rf $app_name
    fi
    # hark! a dmg!
    if [ ${app_url: -4} == ".dmg" ]; then
        curl -L -o app.dmg $app_url
        MOUNTPOINT="/Volumes/MountPoint"
        IFS=""
        hdiutil attach -mountpoint $MOUNTPOINT app.dmg
        for app in `find $MOUNTPOINT -type d -maxdepth 2 -name \*.app `; do
          cp -a "$app" /Applications/
        done
        hdiutil detach $MOUNTPOINT
    fi
  fi
}

# Friends, Romans, countrymen,
lend_me_your "HipChat"        "http://downloads.hipchat.com.s3.amazonaws.com/osx/HipChat-2.4.zip"
lend_me_your "Spectacle"      "https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.8.4.zip"
lend_me_your "Mou"            "http://mouapp.com/download/Mou.zip"
lend_me_your "Sublime Text 2" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg"
lend_me_your "Google Chrome"  "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"

# Solarized Terminal colors
echo "Installing 'Solarized Colors' for Terminal..."
curl -L -o "solarized.zip" https://github.com/tomislav/osx-terminal.app-colors-solarized/archive/master.zip
unzip "solarized.zip"
open "osx-terminal.app-colors-solarized-master/Solarized Light.terminal"
open "osx-terminal.app-colors-solarized-master/Solarized Dark.terminal"
rm solarized.zip
defaults write com.apple.terminal "Default Window Settings" -string "Solarized Dark"
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark"
rm -rf "osx-terminal.app-colors-solarized-master"
