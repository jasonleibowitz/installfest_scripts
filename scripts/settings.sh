# Copy over settings and back up bashprofile

# Back up bash_profile and copy over new one.
touch ~/.bash_profile
cp ~/.bash_profile{,.bak}

# Create our WDI working folder
# mkdir -p ~/dev/wdi
mkdir -p ~/dev

# Good captain, will you give me a copy of the sonnet
# you writ to Diana in behalf of the Count Rousillon?
beget () {
  setting=$1
  echo "Moving $setting..."
  cp "$SETTINGS/dotfiles/$setting" "${HOME}/.$setting"
}

# Useful settings
beget bash_profile   # personal initialization file, executed for login shells
beget bash_settings  # store additional settings like API keys
beget welcome_prompt # wdi_welcome prompt and system settings sanity check
beget bashrc         # individual per-interactive-shell startup file
beget editorconfig   # plugin for maintaining consistent coding styles between different editors
beget gemrc          # gem configuration
beget inputrc        # deals with the mapping of the keyboard
beget pryrc          # pry configuration

# reload terminal
source ~/.bash_profile

# fin
