#  _           _        _ _  __           _
# (_)_ __  ___| |_ __ _| | |/ _| ___  ___| |_
# | | '_ \/ __| __/ _` | | | |_ / _ \/ __| __|
# | | | | \__ \ || (_| | | |  _|  __/\__ \ |_
# |_|_| |_|___/\__\__,_|_|_|_|  \___||___/\__|

# taken a lot from this https://github.com/divio/osx-bootstrap
# InstallFest by Phillip Lamplugh, General Assembly Instructor(2013)
# This script can be run from the terminal by pasting in
# curl https://raw.github.com/phlco/installfest_scripts/master/install.sh | bash

# clear terminal screen
clear

# Start install fest
echo 'Welcome to Installfest'
echo "Enter your name"
read user_name
echo "Enter your account password"
read -s user_pass
# cache sudo so we can reuse it with sudo -S
echo $user_pass | sudo -vS

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Please register for an account on github.com if you haven't already done so."

echo "Github Username:"
read github_name
echo "Github Email"
read github_email

# Determine OS version
declare osvers=$(sw_vers -productVersion)
declare latest_os="10.9.1"
echo "You're running OSX $osvers"
if [[ "$osvers" < "$latest_os" ]]; then
  echo "Please think about upgrading to the latest OS"
fi

# Let's make sure we're updated
echo "Checking for software updates..."
# mac thing
sudo softwareupdate -i -a

# The one prereq is Xcode Command Line Tools
# Check for those
# it is possible earlier versions of xcode are installed to /dev
if [ -x /Applications/Xcode.app/ ]; then
  echo "Xcode is installed"
else
  echo "Please install Xcode then rerun this script."
  exit
fi

# dramatis personae
declare source_dir=~/.wdi-installfest
declare source_scripts=~/.wdi-installfest/scripts
declare source_git=https://github.com/phlco/installfest_scripts.git

# we need to download the repo for the absolute paths
if [[ ! -d $source_dir ]]; then
  echo 'Downloading Installfest repo...'
  # autoupdate bootstrap file
  git clone $source_git $source_dir
  # hide folder
  chflags hidden $source_dir
else
  # update repo
  echo 'Updating repo...'
  cd $source_dir
  git pull origin master
fi


# Ensure Macports and RVM aren't installed
echo "             _     _ "
echo "   __ _  ___| |_  / |"
echo "  / _' |/ __| __| | |"
echo " | (_| | (__| |_  | |"
echo "  \__,_|\___|\__| |_|"

echo “Woe, destruction, ruin, and decay; the worst is death and death will have his day.”
echo "Richard II (III.ii)"
source $source_scripts/clean.sh

echo "             _     ____  "
echo "   __ _  ___| |_  |___ \ "
echo "  / _\` |/ __| __|   __) |"
echo " | (_| | (__| |_   / __/ "
echo "  \__,_|\___|\__| |_____|"
echo "                         "

echo "PISTOL: The plain-song is most just: for humours do abound:"
echo "Knocks go and come; God's vassals drop and die;"
echo "And sword and shield,"
echo "In bloody field,"
echo "Doth win immortal fame."
echo ""
echo "Boy: Would I were in an alehouse in London! I would give /"
echo "all my fame for a pot of ale and safety."
echo "--Henry V (III.ii)"
# install homebrew and formulae
source $source_scripts/brew.sh

figlet -f ogre act 3
echo "I have touch'd the highest point of all my greatness;"
echo "And, from that full meridian of my glory,"
echo "I haste now to my setting: I shall fall "
echo "Like a bright exhalation in the evening, "
echo "And no man see me more."
echo "--Henry VIII (III.ii)"
# additional settings and bash_profile
# someday maybe these are kept in a hidden folder
source $source_scripts/settings.sh

figlet -f ogre act 4
echo "something loves labours lost eh"
echo "Maria. This and these pearls to me sent Longaville"
echo "The letter is too long by half a mile."
echo "Princess of France. I think no less. Dost thou not wish in heart "
echo "The chain were longer and the letter short?"
echo "http://www.opensourceshakespeare.org/views/plays/play_view.php?WorkID=loveslabours&Act=5&Scene=2&Scope=scene"

# git setup
source $source_scripts/git.sh

# sublime setup
source $source_scripts/sublime.sh

# additional apps
source $source_scripts/apps.sh

# Ruby setup
source $source_scripts/rbenv.sh

# Gem setup
source $source_scripts/gems.sh

# Install Postgres
source $source_scripts/postgres.sh

# reload
source ~/.bash_profile

# echo "All done? Let's run some tests..."

# # checkpoints
# ruby $source_scripts/checks.rb

# echo "You may want to run brew doctor to ensure everything is working."
# echo "Next make sure your SSH keys are setup."
# echo "Follow the instructions here: https://help.github.com/articles/generating-ssh-keys"
