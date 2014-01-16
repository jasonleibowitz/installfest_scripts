# This script installs homebrew our package manager

`which -s brew`
if [[ $? != 0 ]]; then
    echo ''
    echo 'Installing Homebrew...'
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
else
    echo ''
    echo 'Running Homebrew Updates...'
    brew update
    brew doctor
fi

# install additional helpful formulae
brew install figlet           # ASCII ART!!!!
brew install git              # version control
brew install postgres         # open source object-relational database management system
brew install hub              # additional git commands
brew install imagemagick      # image resizing
brew install graphviz         # visualization tool for ERDs
brew install phantomjs        # headless webkit for javascript testing
brew install qt               # capybara-webkit depends on a WebKit implementation from Qt
brew install qt4              # qt for mavericks
# Ruby
brew install rbenv            # our ruby version manager
brew install ruby-build       # provides an `rbenv install` command
brew install rbenv-gem-rehash # automatically runs `rbenv rehash` command
