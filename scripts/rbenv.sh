# This script downloads ruby 2.1 and sets it as the global default ruby
#clear

# Download and install
brew install rbenv            # our ruby version manager
brew install ruby-build       # provides an `rbenv install` command
brew install rbenv-gem-rehash # automatically runs `rbenv rehash` command

# Install Ruby
rbenv install 2.1.0
# Set global Ruby
rbenv global 2.1.0

# Reload
source ~/.bash_profile
