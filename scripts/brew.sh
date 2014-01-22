# This script installs Homebrew, our package manager
# http://brew.sh/

which -s brew
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

# Install helpful formulae
brew bundle "$source_files/Brewfile"

# fin
