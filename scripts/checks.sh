##Checkpoints to see if you computer is configured properly.

# Original checkpoints script from Peter Lai.
# Redone as a suite of ruby tests in `checks.rb`
# Could also be rewritten in bash.
# Students should be able to enter each command and receive the correct output

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
  # This could also work
  # if ls /path/to/your/files* &> /dev/null;
  if [ -x /Applications/"$app_name".app ]; then
    aye "Good"
  else
    nay "Alack!"
  fi
}

dost_thou_have () {
  filename=$1
  # That which thou seeks is thine
  if [ -e "$filename" ]; then
    aye "Good on $filename"
  else
    nay "Thou searchest in vain for $filename"
  fi
}

is_not_this () {
  cmd=$($1)
  pass=$2
  if [[ $cmd == *"$pass"* ]]; then
    aye "$cmd is $pass"
  else
    nay "Alack! $cmd is not $pass"
  fi
}

echo "Running some checks on how our Install went"

is_not_this "brew doctor"           "ready to brew."
is_not_this "ruby -v"               "2.1.0"
is_not_this "gem list pry -i"       "true"
is_not_this "ssh -T git@github.com" "successfully authenticated"

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
what_news_of "Sublime Text 2"
what_news_of "HipChat"
what_news_of "Google Chrome"
what_news_of "Mou"

# Your ssh keys are set up (see [here](https://help.github.com/articles/generating-ssh-keys) for instructions)

# Sublime Checks
sublime="${HOME}/Library/Application Support/Sublime Text $SUBL_VERS/Packages/User"
subl_prefs=$(cat "$sublime/Preferences.sublime-settings")
tab_size="\"tab_size\": 2"
tab_to_space="\"translate_tabs_to_spaces\": true"

if [[ "$subl_prefs" != *$tab_size* ]]; then
  nay "Tab size must be set to 2!"
fi

if [[ "$subl_prefs" != *$tab_to_space* ]]; then
  nay "Translate tabs to spaces must be true!"
fi
