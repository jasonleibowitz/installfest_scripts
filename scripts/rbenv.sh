# This script checks for and downloads Ruby 2.1 and sets it as the global default

declare beloved_ruby_version="2.1.0"
declare ruby_check=$(rbenv versions | grep $beloved_ruby_version)

if [[ "$ruby_check" == *$beloved_ruby_version* ]]; then
  echo "$beloved_ruby_version is installed"
else
  rbenv install $beloved_ruby_version
fi

# Set global Ruby
rbenv global $beloved_ruby_version

# Reload
source ~/.bash_profile
