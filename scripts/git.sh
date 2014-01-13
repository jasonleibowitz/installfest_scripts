# This script creates a gitconfig file and copies over additional git settings

# clear terminal screen
clear

# Install git
brew install git

echo "Please register for an account on github.com if you haven't already done so."

echo "Github Username:"
read github_name
echo "Github Email"
read github_email

# http://stackoverflow.com/questions/10565877/how-to-replace-two-things-at-once-with-sed
# writing name and email to gitconfig
# http://stackoverflow.com/questions/17957196/using-variables-in-bash-script-to-set-ini-file-values-while-executing
# sed "/^number=/s/=.*/=5/" baseinput.ini > input.ini
sed -e s/github_name/"$github_name"/ -e s/github_email/"$github_email"/ ../dotfiles/gitconfig > ~/.gitconfig

# copying gitignore global and commit template
cp ../dotfiles/gitignore_global ~/.gitignore_global
cp ../dotfiles/gitmessage.txt ~/.gitmessage.txt
