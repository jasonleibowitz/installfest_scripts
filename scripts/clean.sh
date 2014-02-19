# This script checks for and removes previous installs of macports and rvm

# Uninstall RVM
# http://stackoverflow.com/questions/3950260/howto-uninstall-rvm
if hash rvm 2>/dev/null; then
  rvm implode
  rm -rf ~/.rvm
  echo "RVM has been destroyed. You are welcome, $(user_name)."
else
  echo "RVM is not installed. Moving on..."
fi

# Uninstall Macports
# http://guide.macports.org/chunked/installing.macports.uninstalling.html
if hash port 2>/dev/null; then
  echo "$(user_name), you installed Macports?"
  sudo port -fp uninstall installed
  sudo rm -rf \
    /opt/local \
    /Applications/DarwinPorts \
    /Applications/MacPorts \
    /Library/LaunchDaemons/org.macports.* \
    /Library/Receipts/DarwinPorts*.pkg \
    /Library/Receipts/MacPorts*.pkg \
    /Library/StartupItems/DarwinPortsStartup \
    /Library/Tcl/darwinports1.0 \
    /Library/Tcl/macports1.0 \
    ~/.macports
    # carthago delenda est
    sudo find / | grep macports | sudo xargs rm
    echo "Macports has been removed."
else
  echo "Macports is not installed. Moving on..."
fi
