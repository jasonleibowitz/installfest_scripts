# Copy over settings and back up bashprofile
# Next back up bash_profile and write new one.
cp ~/.bash_profile{,.bak}

# Create our WDI working folder
mkdir -p ~/dev/wdi

# install helpfull settings
# redo with commented lines
export settings='
  bash_profile
  bashrc
  editorconfig
  gemrc
  inputrc
  pryrc
  bash_settings
'
for setting in $settings
do
  echo 'Installing '$setting'...'
  cp "dotfiles/$setting" "~/.$setting"
done

# reload terminal
source ~/.bash_profile
