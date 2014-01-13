# Copy over settings and back up bashprofile
# Next back up bash_profile and write new one.
cp ~/.bash_profile{,.bak}
# curl https://gist.github.com/phlco/6670713/raw/ac75a26dbbb387a72942ae23e2c65b7eda1ca33a/bash_profile > ~/.bash_profile

# Create our WDI working folder
mkdir -p ~/dev/wdi

# install helpfull settings
export settings='
  bash_profile
  bashrc
  editorconfig
  gemrc
  inputrc
  pryrc
'
for setting in $settings
do
  echo 'Installing '$setting'...'
  cp "dotfiles/$setting" "~/.$setting"
done

# reload terminal
source ~/.bash_profile
