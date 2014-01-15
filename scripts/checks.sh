##Checkpoints to see if you computer is configured properly.

# Original checkpoints script from Peter Lai.
# Redone as a suite of ruby tests in `checks.rb`
# Could also be rewritten in bash.
# Students should be able to enter each command and receive the correct output

# When you type `brew doctor` into your Terminal, you get no warnings.
# If you get warnings follow the instructions
# repeat until it says `Your system is ready to brew.`

# When you type `ruby -v` into your terminal, you get `ruby  2.1.0`

# When you type `pry` into your terminal, it changes the prompt to `pry(main)`
# (Type `exit` to return to return to the bash prompt)
gem list pry -i # should return true

# When you type `subl` into your terminal, it opens up Sublime Text

# Your root directory contains the following:
# `.gitignore_global`, `.gitconfig`, `.bash_profile`
# You should be able to open each one with `subl ~/FILENAME`
# ie `subl ~/.gitignore_global`

# When you have Sublime open and press `CMD+Shift+P` you'll see a drop down menu.
# When you type `install` into the menu
# you should see the option `Package Control: Install Package`

# Your ssh keys are set up (see [here](https://help.github.com/articles/generating-ssh-keys) for instructions)

# When you type `subl ~/dev/wdi/WDI_NYC_12`
# you see our class repository files

# You have `Spectacle` installed on your computer to manage your windows
