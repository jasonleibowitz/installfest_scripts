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

# Add user's github info to gitconfig
sed -e s/github_name/"$github_name"/ -e \s/github_email/"$github_email"/ \
$source_dir/settings/git/gitconfig > ~/.gitconfig
