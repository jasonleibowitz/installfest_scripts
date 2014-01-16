# SSH keygen script

# Check for existing ssh keys
if [ -x "~/.ssh/id_rsa.pub" ]; then
    echo "id_rsa.pub exists"
else
    echo "no sign"
fi

if [ -x "~/.ssh/id_dsa.pub" ]; then
    echo "id_dsa.pub exists"
else
    echo "no sign"
fi


# Creates a new ssh key, using the provided email as a label
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa

# http://stackoverflow.com/questions/3659602/bash-script-for-generating-ssh-keys
# ssh-keygen -t rsa -N "" -f my.key

# Copies the contents of the id_rsa.pub file to your clipboard
pbcopy < ~/.ssh/id_rsa.pub

