# This script installs applications we'll be using in class

# clear terminal screen
clear

# Chrome
if [ -x /Applications/Google\ Chrome.app/ ]; then
  echo "Chrome already installed..."
else
  echo "Installing Chome"
  curl -L -O "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
  hdiutil mount googlechrome.dmg
  cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
  hdiutil unmount "/Volumes/Google Chrome"
  rm googlechrome.dmg
fi

# cd ~/Desktop

# curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg
# hdiutil attach googlechrome.dmg
# cd /Volumes/googlechrome.dmg
# sudo installer -pkg DarwinPorts-1.2.pkg -target "/"
# hdiutil detach /Volumes/DarwinPorts-1.2/

# Hipchat
if [ -x /Applications/HipChat.app/ ]; then
  echo "HipChat already installed"
else
  echo "Installing Hipchat"
  curl -L -o "HipChat-2.4.zip" "http://downloads.hipchat.com.s3.amazonaws.com/osx/HipChat-2.4.zip"
  unzip HipChat-2.4.zip
  mv HipChat.app /Applications
  rm HipChat-2.4.zip
fi

# Mou
if [ -x /Applications/Mou.app/ ]; then
  echo "Mou already installed"
else
  echo "Installing Mou"
  curl -L -o "Mou.zip" "http://mouapp.com/download/Mou.zip"
  unzip Mou.zip
  mv Mou.app /Applications/
  rm Mou.zip
fi

# Spectacle
if [ -x /Applications/Spectacle.app/ ]; then
  echo "Spectacle already installed"
else
  echo "Installing Spectacle"
  curl -L -o "Spectacle+0.8.4.zip" "https://s3.amazonaws.com/spectacle/downloads/Spectacle+0.8.4.zip"
  unzip Spectacle+0.8.4.zip
  mv "Spectacle.app" /Applications
  rm Spectacle+0.8.4.zip
fi
