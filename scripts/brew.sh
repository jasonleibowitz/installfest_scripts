`which -s brew`
if [[ $? != 0 ]]; then
    echo ''
    echo '##### Installing Homebrew...'
    ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"
else
    echo ''
    echo '##### Running Homebrew Updates...'
    brew update
    brew doctor
fi

# install additional helpful formulae

brew install figlet       # ASCII ART!!!!
brew install hub          # additional git commands
brew install imagemagick  #
brew install graphviz     #
brew install phantomjs    #
brew install qt           #

