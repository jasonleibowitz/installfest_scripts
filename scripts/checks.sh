##Checkpoints to see if you computer is configured properly.

# Original checkpoints script from Peter Lai.
# Redone as a suite of ruby tests in `checks.rb`
# Could also be rewritten in bash.
# Students should be able to enter each command and receive the correct output

# Instruments of Darkness
what_news_of () {
  app_name=$1
  echo "What news of $app_name?"
  if [ ! -x "/Applications/$app_name.app" ]; then
    echo "Alack! No news of $app_name";
  else
    echo "$app_name is well"
  fi
}

dost_thou_have () {
  filename=$1
  if [ -e "$filename" ]; then
    echo "Aye. That which thou seeks is thine"
  else
    echo "Nay. Thou searchest in vain.";
  fi
}

is_not_this () {
  cmd=$($1)
  pass=$2
  if [[ $cmd != *"$pass"* ]]; then
    echo "Nay";
  else
    echo "Aye";
  fi
}

echo "Running some checks on how our Install went"

is_not_this "brew doctor"     "ready to brew."
is_not_this "ruby -v"         "2.1.0"
is_not_this "gem list pry -i" "true"

# # When you type `subl` into your terminal, it opens up Sublime Text
if [ ! -L /usr/local/bin/subl ]; then
  echo "sublime symlink problem";
fi

# Your root directory contains the following:
# `.gitignore_global`, `.gitconfig`, `.bash_profile`
# You should be able to open each one with `subl ~/FILENAME`
# ie `subl ~/.gitignore_global`
dost_thou_have ~/.bash_profile
dost_thou_have ~/.gitignore_global
dost_thou_have ~/.gitconfig
dost_thou_have ~/Library/Application\ Support/Sublime\ Text\ */Installed\ Packages
dost_thou_have ~/dev/wdi/WDI_NYC_12

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
  echo "Tab size must be set to 2!"
fi

if [[ "$subl_prefs" != *$tab_to_space* ]]; then
  echo "Translate tabs to spaces must be true!"
fi
