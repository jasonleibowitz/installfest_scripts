# Checking for Command Line Tools
osx_version=$(sw_vers -productVersion)

have_you_the_command_line_tools () {
  case $osx_version in
    *10.9*) cmdline_version="CLTools_Executables" ;; # Mavericks
    *10.8*) cmdline_version="DeveloperToolsCLI"   ;; # Mountain Lion
    *10.7*) cmdline_version=""                    ;; # Lion
    *) echo "Please upgrade your OS";;
  esac
  # Check for Command Line Tools based on OS versions
  if [ ! -z $(pkgutil --pkgs=com.apple.pkg.$cmdline_version) ]; then
    echo "Command Line Tools are installed"
  fi
}

# May remove full Xcode check.
if [ -x /Applications/Xcode.app/ ]; then
  echo "Xcode is installed. We may begin..."
elif [ $osx_version < "10.9" ]; then
  echo "Please install Xcode from the App Store."
else
  echo "Install Command Line Tools"
  echo "run '$ sudo xcodebuild -license' then"
  echo "'$ xcode-select --install'"
  echo "then rerun this script."
fi
