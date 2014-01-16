# This script downloads ruby 2.1 and sets it as the global default ruby

# Install Ruby
declare ruby_version="2.1.0"
declare ruby_check=$(rbenv versions | grep $ruby_version)
if [[ "$ruby_check" == *$ruby_version* ]]; then
  echo "$ruby_version is installed"
else
  rbenv install 2.1.0
fi

# Set global Ruby
rbenv global 2.1.0

# Reload
source ~/.bash_profile
