# clear terminal screen
clear

# start install fest
echo 'welcome to installfest'

# dramatis personae
declare source_dir=~/.wdi-installfest
declare source_git=https://github.com/phlco/installfest_scripts.git

# we need to download the repo for the absolute paths
if [[ ! -d ~/.wdi-installfest ]]; then
  echo '##### Downloading Installfest repo...'
  # autoupdate bootstrap file
  git clone $source_git $source_dir
  # # hide folder
  # chflags hidden $source_dir
else
  # update repo
  echo '##### Updating repo...'
  cd $source_dir
  git pull origin master
fi

# Ensure Macports and RVM aren't installed
source $source_dir/clean.sh

# install homebrew and formulae
source $source_dir/brew.sh

# git setup
source $source_dir/git.sh

# sublime setup
source $source_dir/sublime.sh

source ~/.bash_profile

echo "All done"
