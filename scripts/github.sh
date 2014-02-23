# SSH keys establish a secure connection between your computer and GitHub
# This script follows these instructions `https://help.github.com/articles/generating-ssh-keys`

# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa
# Copy SSH key to the clipboard
pbcopy < ~/.ssh/id_rsa.pub

echo "We just copied your SSH key to the clipboard."
echo "Now we're going to visit GitHub to add the SSH key"

echo "Do the following in your browser: "
echo '- Click "SSH Keys" in the left sidebar'
echo '- Click "Add SSH key"'
echo '- Paste your key into the "Key" field'
echo '- Click "Add key"'
echo '- Confirm the action by entering your GitHub password'

pause_awhile "Press Enter. We'll be here until you get back from Github."

open https://github.com/settings/ssh

pause_awhile "Ok. Ready to Continue? Press Enter."
# Fin
