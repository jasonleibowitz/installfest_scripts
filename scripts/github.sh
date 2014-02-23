# SSH Keygen
ssh-keygen -t rsa -C $github_email
ssh-add id_rsa
pbcopy < ~/.ssh/id_rsa.pub

echo "We just copied your SSH key to the clipboard."
echo "Now we're going to visit GitHub to add the SSH key"

pause_awhile "Press Enter for Instructions for GitHub"

echo 'Click "SSH Keys" in the left sidebar'
echo 'Click "Add SSH key"'
echo 'Paste your key into the "Key" field'
echo 'Click "Add key"'
echo 'Confirm the action by entering your GitHub password'

echo "Press Enter to open GitHub in the browser."
pause_awhile "We'll be here until you get back."

open https://github.com/settings/ssh

pause_awhile "Ok. Ready?"
# Fin
