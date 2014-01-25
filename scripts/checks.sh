##Checkpoints to see if you computer is configured properly.

# Original checkpoints script from Peter Lai.
# Redone as a suite of ruby tests in `checks.rb`
# Could also be rewritten in bash.
# Students should be able to enter each command and receive the correct output

# # Colors
# # Foreground
# BLACK=$(tput setaf 0)
# BLUE=$(tput setaf 4)
# CYAN=$(tput setaf 6)
# GREEN=$(tput setaf 2)
# MAGENTA=$(tput setaf 5)
# ORANGE=$(tput setaf 172)
# PURPLE=$(tput setaf 141)
# RED=$(tput setaf 1)
# WHITE=$(tput setaf 7)
# YELLOW=$(tput setaf 226)
# # Background
# BG_BLACK=$(tput setab 0)
# BG_BLUE=$(tput setab 4)
# BG_CYAN=$(tput setab 6)
# BG_GREEN=$(tput setab 2)
# BG_MAGENTA=$(tput setab 5)
# BG_ORANGE=$(tput setab 172)
# BG_RED=$(tput setab 1)
# BG_WHITE=$(tput setab 7)
# BG_YELLOW=$(tput setab 226)
# # Formatting
# UNDERLINE=$(tput smul)
# NOUNDERLINE=$(tput rmul)
# BOLD=$(tput bold)
# RESET=$(tput sgr0)

aye () {
  msg=$1
  GREEN=$(tput setaf 2)
  RESET=$(tput sgr0)
  echo "${GREEN}$msg${RESET}"
}

nay () {
  msg=$1
  RED=$(tput setaf 1)
  RESET=$(tput sgr0)
  echo "${RED}$msg${RESET}"
}

# Instruments of Darkness
what_news_of () {
  app_name=$1
  echo -n "What news of $app_name? "
  if [ -x "/Applications/$app_name.app" ]; then
    aye "Good"
  else
    nay "Alack!"
  fi
}

dost_thou_have () {
  filename=$1
  # That which thou seeks is thine
  if [ -e "$filename" ]; then
    aye "Good"
  else
    nay "Thou searchest in vain.";
  fi
}

is_not_this () {
  cmd=$($1)
  pass=$2
  if [[ $cmd == *"$pass"* ]]; then
    aye "Good"
  else
    nay "Alack!"
  fi
}

echo "Running some checks on how our Install went"

is_not_this "brew doctor"     "ready to brew."
is_not_this "ruby -v"         "2.1.0"
is_not_this "gem list pry -i" "true"

# When you type `subl` into your terminal, it opens up Sublime Text
if [ ! -L /usr/local/bin/subl ]; then
  nay "sublime doesn't appear to be symlinked.";
fi

# Your root directory contains the following:
# `.gitignore_global`, `.gitconfig`, `.bash_profile`
# You should be able to open each one with `subl ~/FILENAME`
# ie `subl ~/.gitignore_global`
dost_thou_have ~/.bash_profile
dost_thou_have ~/.gitignore_global
dost_thou_have ~/.gitconfig
dost_thou_have ~/Library/Application\ Support/Sublime\ Text\ */Installed\ Packages
dost_thou_have ~/dev/wdi

# Applications
what_news_of "Spectacle"
what_news_of "Sublime Text"
what_news_of "HipChat"
what_news_of "Google Chrome"
what_news_of "Mou"

# Your ssh keys are set up (see [here](https://help.github.com/articles/generating-ssh-keys) for instructions)

# Sublime Checks
# Just checking for Sublime 3
sublime="${HOME}/Library/Application Support/Sublime Text 3/Packages/User"
subl_prefs=$(cat "$sublime/Preferences.sublime-settings")
tab_size="\"tab_size\": 2"
tab_to_space="\"translate_tabs_to_spaces\": true"

if [[ "$subl_prefs" != *$tab_size* ]]; then
  nay "Tab size must be set to 2!"
fi

if [[ "$subl_prefs" != *$tab_to_space* ]]; then
  nay "Translate tabs to spaces must be true!"
fi
