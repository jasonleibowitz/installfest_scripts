# This script downloads ruby 2.1 and sets it as the global default ruby

clear

rbenv install 2.1.0
rbenv global 2.1.0

# Open a new terminal tab for the next two commands

source ~/.bash_profile

gem update --system
gem install bundler rails pry --no-document