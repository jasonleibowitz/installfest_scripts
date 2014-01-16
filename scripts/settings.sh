# Copy over settings and back up bashprofile
# Next back up bash_profile and write new one.
cp ~/.bash_profile{,.bak}

# Create our WDI working folder
mkdir -p ~/dev/wdi

# Good captain, will you give me a copy of the sonnet
# you writ to Diana in behalf of the Count Rousillon?
beget () {
  setting=$1
  echo 'Moving '$setting'...'
  cp "dotfiles/$setting" "~/.$setting"
}

# Useful settings
beget bash_profile  # personal initialization file, executed for login shells
beget bashrc        # individual per-interactive-shell startup file
beget editorconfig  # plugin for maintaining consistent coding styles between different editors
beget gemrc         # gem configuration
beget inputrc       # deals with the mapping of the keyboard
beget pryrc         # pry configuration
beget bash_settings # store additional settings like API keys

# reload terminal
source ~/.bash_profile
