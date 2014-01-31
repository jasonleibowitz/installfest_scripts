# This script checks for and downloads Ruby 2.1 and sets it as the global default
source ~/.bash_profile

ruby_check=$(rbenv versions | grep $BELOVED_RUBY_VERSION)

# copy over default gemset
# cp $SRC_DIR/settings/ruby/default-gems ~/.rbenv/default-gems

if [[ "$ruby_check" == *$BELOVED_RUBY_VERSION* ]]; then
  echo "$BELOVED_RUBY_VERSION is installed"
else
  rbenv install $BELOVED_RUBY_VERSION
fi

# Set global Ruby
rbenv global $BELOVED_RUBY_VERSION

# Reload
source ~/.bash_profile

# fin #
