# Copy over settings and back up bashprofile
# Next back up bash_profile and write new one.
cp ~/.bash_profile{,.bak}
curl https://gist.github.com/phlco/6670713/raw/ac75a26dbbb387a72942ae23e2c65b7eda1ca33a/bash_profile > ~/.bash_profile

# install helpfull settings
export settings='
  aliases
  bash_profile
  bash_prompt
  bashrc
  editorconfig
  exports
  gemrc
  inputrc
'

for setting in $settings
do
  echo 'copying '$setting'...'
  cp dotfiles/$setting ~/.$setting
done
