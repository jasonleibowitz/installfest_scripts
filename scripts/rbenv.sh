# This script checks for and downloads Ruby 2.1 and sets it as the global default

beloved_ruby_version="2.1.0"
ruby_check=$(rbenv versions | grep $beloved_ruby_version)

# copy over default gemset
cp $src_dir/settings/ruby/default-gems ~/.rbenv/default-gems

if [[ "$ruby_check" == *$beloved_ruby_version* ]]; then
  echo "$beloved_ruby_version is installed"
else
  rbenv install $beloved_ruby_version
fi

# Set global Ruby
rbenv global $beloved_ruby_version

# Reload
source ~/.bash_profile

# fin #
