# This script installs Homebrew, our package manager
# http://brew.sh/
function install_or_update_brew () {
  $(which -s brew)
  if [[ $? != 0 ]]; then
      echo ''
      echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
  else
      echo ''
      echo 'Brew is already installed. Running Homebrew Updates...'
      brew update
      brew doctor
  fi
}

install_or_update_brew

# Install helpful formulae

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Dramatis Personae
brew install figlet #............ ASCII ART!!!!
brew install git #............... Version Control
brew install graphviz #.......... visualization tool for ERDs
brew install heroku-toolbelt #... Heroku command-line tooling for working with the Heroku platform
brew install hub #............... additional git commands
brew install imagemagick #....... image resizing
brew install node #.............. Event-driven I/O server-side JavaScript environment based on V8
brew install phantomjs #......... PhantomJS is a headless WebKit scriptable with a JavaScript API.
brew install postgres #.......... open source object-relational database management system
brew install qt #................ WebKit implementation of Qt
brew install qt4 #............... qt for mavericks
# For Ruby
brew install rbenv #............. our ruby version manager
brew install ruby-build #........ provides an `rbenv install` command

# # Additional Players
# brew install rbenv-default-gems #  automatically install gems every time you install a new version of Ruby.
# brew install autoconf #.......... Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages.
# brew install automake #.......... Automake is a tool for automatically generating Makefile.in
# brew install git-flow #.......... Git extensions to provide high-level repository operations
# brew install libtool #........... generic library support script
brew install libyaml #........... a YAML 1.1 parser and emitter
# brew install neon #.............. neon is an HTTP and WebDAV client library
# brew install openssl #........... A toolkit implementing SSL v2/v3 and TLS protocols with full-strength cryptography world-wide.
# brew install pkg-config #........ pkg-config is a helper tool used when compiling applications and libraries.
# brew install readline #.......... provides a set of functions for use by applications that allow users to edit command lines as they are typed in
# brew install serf #.............. a high performance C-based HTTP client library
# brew install sqlite #............ a self-contained, serverless, zero-configuration, transactional SQL database engine.
# brew install ssh-copy-id #....... a script that uses ssh to log into a remote machine

#  Tap a new formula repository from GitHub, or list existing taps.
brew tap homebrew/versions
# Ensures all tapped formula are symlinked into Library/Formula
# and prunes dead formula from Library/Formula.
brew tap --repair

# Remove outdated versions from the cellar
brew cleanup

# fin
