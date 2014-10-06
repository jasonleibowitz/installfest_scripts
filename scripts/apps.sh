# To the Reader

# This script installs the Applications listed below

# Dramatis Personae

# Google Chrome.........The Browser
# Firefox...............A Browser
# HipChat...............The Chat Client
# Mou...................The Markdown Editor
# Spectacle.............The Window Manager
# Sublime Text 2........The Text Editor
# Sublime Text..........The Text Editor's Heir Apparent
# XQuartz...............The X Window Server
# Alfred................The best productivity app
# 1Password.............Don't forget your passwords
# AppZapper.............The uninstaller Apple forgot
# Bartender.............Organize your menu bar apps
# Chromecast............Stream to your TV
# Dash..................Offline documentation
# Evernote..............The best note taking app
# FileZilla.............The best FTP Client
# Flip4Mac..............Watch wmv videos in QuickTime
# ImageOptim............Better images for web
# iTerm2................Better terminal
# iStat Menus...........Advanced Mac system monitor
# Keka..................The free Mac OS X file archiver
# MacDown...............The updated Markdown Editor
# Skype.................Video chat
# TunnelBear............IP Spoofing
# uTorrent..............Torrent Downloader

# A CATALOGUE
# of the several functions contained herein

install_dmg () {
  echo 'Hark, a dmg!'
  file_name="$1"
  MOUNTPOINT="/Volumes/MountPoint"
  IFS="
  "
  hdiutil attach -mountpoint $MOUNTPOINT "$file_name.dmg"
  app=$(find $MOUNTPOINT 2>/dev/null -maxdepth 2 -iname \*.app)
  if [ ! -z "$app" ]; then
    cp -a "$app" /Applications/
  # for app in `find $MOUNTPOINT -type d -maxdepth 2 -name \*.app `; do
  # done
  fi
  echo 'Hark! A pkg!'
  pkg=$(find $MOUNTPOINT 2>/dev/null -maxdepth 2 -iname \*.pkg)
  if [ ! -z "$pkg" ]; then
    # PL: Need to handle harddrive names that aren't Macintosh HD
    sudo installer -package $pkg -target /
  fi
  hdiutil detach $MOUNTPOINT
}

install_zip () {
  file_name="$1"
  echo 'Hark! A zip!'
  mkdir "$file_name"
  unzip "$file_name.zip" -d "$file_name"
  mv $file_name/*.app /Applications
}

# Checks for the existence of a file
know_you_not_of () {
  file_name="$1"
  file_count=$(find /Applications -name "$file_name.app" | wc -l)
  if [[ $file_count -gt 0 ]]; then
    echo "$file_name is already here.";
    return 1
  else
    echo 'Come forth!'
    return 0
  fi
}

# Downloads and installs apps from zips, dmgs, and pkgs.
lend_me_your () {
  file_name="$1"
  url="$2"
  ext=${url: -4}
  echo "Lend me your $file_name"
  if know_you_not_of "$file_name" ; then
    echo "Downloading from $url"
    curl -L -o "$file_name$ext" $url
    # enter stage left...
    case "$ext" in
      ".dmg")  install_dmg "$file_name";;
      ".zip")  install_zip "$file_name";;
      *) echo "Not Processed";;
    esac
  fi
  # Out spot
  rm -rf "$file_name$ext"
  rm -rf "$file_name"
}

################################################################################
echo "Friends, Romans, Countrymen..."
################################################################################

lend_me_your "Google Chrome"  "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
lend_me_your "Firefox"        "https://download.mozilla.org/?product=firefox-32.0.3-SSL&os=osx&lang=en-US"
lend_me_your "HipChat"        "https://www.hipchat.com/downloads/latest/mac"
lend_me_your "Mou"            "http://mouapp.com/download/Mou.zip"
lend_me_your "Spectacle"      "https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.8.5.zip"
lend_me_your "XQuartz"        "http://xquartz.macosforge.org/downloads/SL/XQuartz-2.7.7.dmg"

if [ "$SUBL_VERS" == "2" ]; then
  lend_me_your "Sublime Text 2" "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.dmg"
else
  lend_me_your "Sublime Text"   "http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%20Build%203065.dmg"
fi
############################ DEFAULTS ##########################################
# We bid be quiet when we hear it cry;
# Disable HipChat Sounds
defaults write com.hipchat.hipchat disableSounds -bool true
defaults write com.hipchat.hipchat notificationVolume -float 20

# To thine own self be true
# Display username in menu bar PL: This doesn't work.
# defaults write com.apple.systemuiserver menuExtras -array \
#   "/System/Library/CoreServices/Menu Extras/Volume.menu"  \
#   "/System/Library/CoreServices/Menu Extras/Battery.menu" \
#   "/System/Library/CoreServices/Menu Extras/Clock.menu"   \
#   "/System/Library/CoreServices/Menu Extras/User.menu"


# for app in "SystemUIServer" "cfprefsd" "Finder" \
#   "Sublime Text" "Mou" "HipChat" "Google Chrome" "Spectacle"; do
#   killall "${app}" > /dev/null 2>&1
# done

######################## INSTALL WITH BREW CASK #################################
echo "Installing additional apps via Brew Cask"

brew install caskroom/cask/brew-cask
# Apps
apps=(
  alfred
  dropbox
  qlcolorcode
  screenflick
  slack
  appcleaner
  hazel
  qlmarkdown
  spotify
  vagrant
  flash
  iterm2
  qlprettypatch
  virtualbox
  flux
  qlstephen
  sketch
  vlc
  cloudup
  nvalt
  quicklook-json
  skype
  onepassword
  bartender
  chromecast
  dash
  evernote
  filezilla
  transmit
  flip4mac
  imageoptim
  istat-menus
  keka
  macdown
  skype
  tunnelbear
  utorrent
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

###################### LINK ALFRED TO APPS ############################
echo "Giving alfred directions to the apps."

brew cask alfred link

############### INSTALL FONTS WITH BREW CASK ##########################
echo "Installing fonts via Brew Cask"

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}


## - FIN - ##

