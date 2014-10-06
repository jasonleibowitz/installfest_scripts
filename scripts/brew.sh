# This script installs Homebrew, our package manager
# http://brew.sh/
function install_or_update_brew () {
  $(which -s brew)
  if [[ $? != 0 ]]; then
      echo ''
      echo 'Installing Homebrew...'
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
brew install qt5 #............... qt for mavericks/yosemite
# For Ruby
brew install rbenv #............. our ruby version manager
brew install ruby-build #........ provides an `rbenv install` command

# # Additional Players
# brew install rbenv-default-gems #  automatically install gems every time you install a new version of Ruby.
# brew install autoconf #.......... Autoconf is an extensible package of M4 macros that produce shell scripts to automatically configure software source code packages.
# brew install automake #.......... Automake is a tool for automatically generating Makefile.in
# brew install git-flow #.......... Git extensions to provide high-level repository operations
# brew install libtool #........... generic library support script
brew install libyaml #............. a YAML 1.1 parser and emitter
# brew install neon #.............. neon is an HTTP and WebDAV client library
# brew install openssl #........... A toolkit implementing SSL v2/v3 and TLS protocols with full-strength cryptography world-wide.
# brew install pkg-config #........ pkg-config is a helper tool used when compiling applications and libraries.
# brew install readline #.......... provides a set of functions for use by applications that allow users to edit command lines as they are typed in
# brew install serf #.............. a high performance C-based HTTP client library
# brew install sqlite #............ a self-contained, serverless, zero-configuration, transactional SQL database engine.
# brew install ssh-copy-id #....... a script that uses ssh to log into a remote machine
brew install libxml2 #............. XML C parser and toolkit
brew install libxslt #............. a language for transforming XML documents into other XML documents.
brew install libiconv #............ a conversion library between Unicode and traditional encoding

# Additional Binaries via http://lapwinglabs.com/blog/hacker-guide-to-setting-up-your-mac
brew install graphicsmagick #....... The swiss army knife of image processing.  
brew install webkit2png #........... Command line tool to create screenshots of webpages. To use just call ‘webkit2png <url>’ in the command line
brew install rename #............... Renames files according to modification rules specified on command line.
brew install zopfli #............... Compression Algorithm (gzip, deflate). Takes more time, but compresses around 5% better than zlib. 
brew install ffmpeg #............... Complete, cross-platform solution to record, convert and stream audio and video. 
brew install python #............... Python programming language 
brew install sshfs #................ Extend OS X’s native file handling capabilities. Successor to MacFuse.
brew install trash #................ Small command line utility to move files to the trash. http://hasseg.org/trash/
brew install tree #................. Tree is a recursive directory listing command that produces a depth indented listing of files, which is colorized ala dircolors
brew install ack #.................. ack 2.12 is a tool like grep, optimized for programmers Designed for programmers with large heterogeneous trees of source code 

#  Tap a new formula repository from GitHub, or list existing taps.
brew tap homebrew/versions
# Ensures all tapped formula are symlinked into Library/Formula
# and prunes dead formula from Library/Formula.
brew tap --repair

# Remove outdated versions from the cellar
brew cleanup

# fin
