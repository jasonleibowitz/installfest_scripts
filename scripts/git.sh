# This script creates a gitconfig file and copies over additional git settings

# copying gitignore global and commit template
cp $source_files/git/gitconfig        ~/.gitconfig        # set gitconfiguration variables
cp $source_files/git/gitignore_global ~/.gitignore_global # files to ignore in every git repo
cp $source_files/git/gitmessage.txt   ~/.gitmessage.txt   # default git commit message tempalte

# Add user's github info to gitconfig
git config --global user.name  $github_name
git config --global user.email $github_email

# fin
