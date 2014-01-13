# Update gems
gem update --system

# Our gems to install
export gems='
  bundler
  rails
  pry
  pg
  awesome_print
'
for gem in $gems
do
  echo "Installing $gem"
  gem install $gem --no-document
done
