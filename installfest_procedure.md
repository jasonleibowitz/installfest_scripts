# Installing Tools

1. Install [HipChat][hipchat]
* [Upgrade to OS X Mavericks][osx]
* Install [Google Chrome][chrome]
* Check to make sure you don't have RVM or Macports by running this command from your terminal
  * `bash <(curl -s https://gist.github.com/phlco/8358292/raw/b6e4df4efc7b7973cb5566e89c57672380062074/uninstalls.sh)ds`
* [Install Homebrew][brew] (The command is at the bottom of the page)
      * Type: `brew doctor` and resolve any warnings or errors that come up before moving on.
	* Then: `brew install git rbenv ruby-build rbenv-gem-rehash postgres`
      * Then: `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
* [Install Ruby + Rails]
	* `rbenv install 2.1.0`
	* `rbenv global 2.1.0`
      * Open a new terminal tab for the next two commands
	* `gem update --system`
	* `gem install bundler rails pry --no-document`
* Setup [Github Account][github]
* Set up your Bash Profile
  * Ensure you are in your home directory by entering `cd` into your terminal
	* If they exist, rename the files `.gitconfig`, `.gitignore-global`, `.bash_profile` to have the extension `.bk`
  * Copy the files `.gitconfig`, `.gitignore-global`, `.bash_profile` from our [GitHub Repo][dotfiles] in their place
	* Customize icon if you want! (We have ♬ in there by default)
* [Sublime Text 2][subl]
    1. Follow the "Simple" directions to install the [Package Manger][pkg]
    2. Check to make sure your `subl` command works. When you type it, it should open up Sublime Text.
      * If it doesn't work, you may need to edit your `.bash_profile` file. You should change the line that says `alias subl='open -a "Sublime Text"'` to `alias subl='open -a "Sublime Text 2"'`
    3. From Sublime Text, from the program menu, select "Preferences" then "Settings - User". Replace what is in this file with the contents of the `Preferences.sublime-settings` that we've provided
* Setting up your work folder
  * Ensure you are in your home directory by entering `cd` into your terminal
  * Create a `dev` directory by typing the command `mkdir dev`
  * Navigate into your new `dev` directory by typing `cd dev`
  * In your `dev` directory, create a `wdi` directory by typing the command `mkdir wdi`
  * We'll start populating these directories in Week 1
* Install the [Spectacle Screen Manager][spectacle] and play around with what it can do. You may have to change your system preferences to allow for assistive devices.

[brew]:     http://mxcl.github.io/homebrew/
[chrome]:   https://www.google.com/intl/en/chrome/browser/
[dotfiles]: ../installfest/dotfiles
[gconfig]:  http://git-scm.com/book/en/Customizing-Git-Git-Configuration
[gignore]:  https://help.github.com/articles/ignoring-files
[github]:   https://github.com/
[osx]:      http://www.apple.com/osx/
[pkg]:      http://wbond.net/sublime_packages/package_control/installation
[subl]:     http://www.sublimetext.com/
[hipchat]:  https://www.hipchat.com/mac
[rbenv]:    https://github.com/sstephenson/rbenv
[spectacle]: http://spectacleapp.com/
