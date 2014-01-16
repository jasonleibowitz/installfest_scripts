#  _           _        _ _  __           _
# (_)_ __  ___| |_ __ _| | |/ _| ___  ___| |_
# | | '_ \/ __| __/ _` | | | |_ / _ \/ __| __|
# | | | | \__ \ || (_| | | |  _|  __/\__ \ |_
# |_|_| |_|___/\__\__,_|_|_|_|  \___||___/\__|
#

# taken a lot from this https://github.com/divio/osx-bootstrap
# InstallFest Script by Phillip Lamplugh, General Assembly Instructor (2014)

# ABRB
quoth_the_bard () {
  message=$1
  attribution=$2
  YELLOW=$(tput setaf 226)
  RESET=$(tput sgr0)
  PURPLE=$(tput setaf 141)
  echo ""
  echo "$YELLOW$message$RESET"
  echo "$PURPLE$attribution$RESET"
}

O_fie () {
  # upcase the message
  message=$(echo $1 | tr 'a-z' 'A-Z')
  RED=$(tput setaf 1)
  RESET=$(tput sgr0)
  echo ""
  echo "$RED$message$RESET"
  exit
}

announcing () {
  act=$1
  figlet -f ogre $act
}

# clear terminal screen
clear

# Start install fest ###################################################################
echo "Welcome to Installfest"
sudo echo "Thanks." # PJ: capture the user's password
echo "Enter your full name:"
read user_name
echo "Stop here for a second."

# echo "Enter your local password:"
# read -s user_pass
# # cache sudo so we can reuse it with sudo -S
# echo $user_pass | sudo -vS

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Please register for an account on github.com if you haven't already done so."

echo "Github Username:"
read github_name
echo "Github Email:"
read github_email
#######################################################################################

# Determine OS version ################################################################
# PL: we may need to download x11?
# http://xquartz.macosforge.org/landing/
declare osvers=$(sw_vers -productVersion)
declare latest_os="10.9.1"
echo "You're running OSX $osvers"
if [[ "$osvers" < "$latest_os" ]]; then
  echo "Please think about upgrading to the latest OS"
fi

#######################################################################################

# Let's make sure we're updated #######################################################
echo "Checking for software updates..."

sudo softwareupdate -i -a # PL: a Mac thing...
#######################################################################################

# The one prereq is Xcode Command Line Tools ##########################################
# PL: it is possible earlier versions of xcode are installed to /dev... deal with this?
if [ -x /Applications/Xcode.app/ ]; then
  echo "Xcode is installed. We may begin..."
else
  O_fie "Please install Xcode then rerun this script."
fi
#######################################################################################

quoth_the_bard "The play's the thing..."

# Dramatis personae ###################################################################
declare source_dir=~/.wdi-installfest
declare source_scripts=~/.wdi-installfest/scripts
declare source_git=https://github.com/phlco/installfest_scripts.git

# The curtain rises ###################################################################
# download the repo for the absolute paths
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
#######################################################################################

# Ensure Macports and RVM aren't installed ############################################
echo "            _     _                                     _ "
echo "  __ _  ___| |_  / |          ___  ___ ___ _ __   ___  / |"
echo " / _' |/ __| __| | |  _____  / __|/ __/ _ \ '_ \ / _ \ | |"
echo "| (_| | (__| |_  | | |_____| \__ \ (_|  __/ | | |  __/ | |"
echo " \__,_|\___|\__| |_|         |___/\___\___|_| |_|\___| |_|"
echo "                                                          "

quoth_the_bard \
"Woe, destruction, ruin, and decay\; the worst is death and death will have his day." \
"--Richard II (III.ii)"

source $source_scripts/clean.sh
######################################################################################

# Install homebrew and formulae ######################################################
echo "            _     _                                     ____  "
echo "  __ _  ___| |_  / |          ___  ___ ___ _ __   ___  |___ \ "
echo " / _' |/ __| __| | |  _____  / __|/ __/ _ \ '_ \ / _ \   __) |"
echo "| (_| | (__| |_  | | |_____| \__ \ (_|  __/ | | |  __/  / __/ "
echo " \__,_|\___|\__| |_|         |___/\___\___|_| |_|\___| |_____|"
echo "                                                              "

quoth_the_bard \
"PISTOL: The plain-song is most just: for humours do abound:
Knocks go and come; God's vassals drop and die;
And sword and shield,
In bloody field,
Doth win immortal fame.

Boy: Would I were in an alehouse in London! I would give
all my fame for a pot of ale and safety." \
"--Henry V (III.ii)"

source $source_scripts/brew.sh
######################################################################################

# Additional settings and bash_profile ###############################################
# FIGLET enters stage left. (homebrew installed a figlet formula to do auto ascii-text art)
# PHIL: What ho, Figlet!
# FIGLET: It is a tale. Told by an idiot, full of sound and fury. Signifying nothing.
# PHIL: Ummmmm, ok... Would you mind announcing the acts?
announcing "act 1 - scene 3"

quoth_the_bard \
"I have touch'd the highest point of all my greatness;
And, from that full meridian of my glory,
I haste now to my setting: I shall fall
Like a bright exhalation in the evening,
And no man see me more." \
"--Henry VIII (III.ii)"

source $source_scripts/settings.sh # PL: someday maybe these are kept in a hidden folder?
#######################################################################################

# Ruby setup ##########################################################################
announcing "act 3 - scene 1"

quoth_the_bard \
"Once more the ruby-colour'd portal open'd," \
"--Venus and Adonis (1593)"

source $source_scripts/rbenv.sh
#######################################################################################

# git setup ###########################################################################
announcing "act 2 - scene 1"

quoth_the_bard \
"MARIA: This and these pearls to me sent Longaville:
The letter is too long by half a mile.

PRINCESS OF FRANCE: I think no less. Dost thou not wish in heart
The chain were longer and the letter short?" \
"--Love's Labour Lost (V.ii)"

source $source_scripts/git.sh
#######################################################################################

# Sublime setup #######################################################################
announcing "act 2 - scene 2"

quoth_the_bard \
"Suit the action to the word, the word to the action,
with this special observance that you o'erstep not the modesty of nature." \
"--Hamlet (III.ii)"

source $source_scripts/sublime.sh
#######################################################################################


# PJ STOPPED CHECKING HERE ...


# Additional apps #####################################################################
announcing "act 2 - scene 3"

quoth_the_bard \
"Lend me an arm; the rest have worn me out
With several applications..." \
"--All's Well That Ends Well (I.ii)"

source $source_scripts/apps.sh
#######################################################################################


# Gem setup ###########################################################################
announcing "act 3 - scene 2"

quoth_the_bard \
"Making a couplement of proud compare,
With sun and moon, with earth and sea's rich gems,
With April's first-born flowers, and all things rare
That heaven's air in this huge rondure hems." \
"--Sonnet 21"

source $source_scripts/gems.sh
#######################################################################################

# Install Postgres ####################################################################
announcing "act 4 - scene 1"

quoth_the_bard \
"'Tis in my memory lock'd, And you yourself shall keep the key of it." \
"--Hamlet (I.iii)"

source $source_scripts/postgres.sh
#######################################################################################

# Reload ##############################################################################
announcing "act 4 - scene 2"

quoth_the_bard \
"Once more unto the breach, dear friends, once more;
Or close the wall up with our English dead." \
"--Henry V (III.i)"

source ~/.bash_profile
#######################################################################################

# echo "All done? Let's run some tests..."

# checkpoints
ruby $source_scripts/checks.rb

quoth_the_bard \
"Double, double toil and trouble; Fire burn, and caldron bubble." \
"--Macbeth (IV.i)"

# EPILOGUE
echo "You may want to run brew doctor to ensure everything is working."
echo "Next make sure your SSH keys are setup."
echo "Follow the instructions here: https://help.github.com/articles/generating-ssh-keys"
