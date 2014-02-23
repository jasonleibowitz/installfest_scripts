# This script creates a gitconfig file and copies over additional git settings

# copying gitignore global and commit template
cp $SETTINGS/git/gitconfig        ~/.gitconfig        # set gitconfiguration variables
cp $SETTINGS/git/gitignore_global ~/.gitignore_global # files to ignore in every git repo
cp $SETTINGS/git/gitmessage.txt   ~/.gitmessage.txt   # default git commit message tempalte

# Add user's github info to gitconfig
git config --global user.name  $github_name
git config --global user.email $github_email

# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa
pbcopy < ~/.ssh/id_rsa.pub

echo "We just copied your ssh key to the clipboard."
echo "now we're going to open github to add the ssh key"

open https://github.com/settings/ssh

echo 'Click "SSH Keys" in the left sidebar'
echo 'Click "Add SSH key"'
echo 'Paste your key into the "Key" field'
echo 'Click "Add key"'
echo 'Confirm the action by entering your GitHub password'
# fin
