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

# install homebrew
source $source_dir/brew.sh
