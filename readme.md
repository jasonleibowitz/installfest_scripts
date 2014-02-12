WDI InstallFest Script

A work in progress to automate the set up of a student's development machine.

Run this script from the command line

```bash
bash <(curl -s https://raw.github.com/phlco/installfest_scripts/master/install.sh)
```

The repo is currently hidden, so use the below url with token.

The script first runs any software updates and then checks for Xcode.

If Xcode is installed the script continues.

- We then clone the repo onto the student's machine
- Remove Macports or RVM
- Installs homebrew and some formulae
- Sets up git
- Installs Sublime and Sublime settings (package manager and base packages)
- Installs additional apps like Chrome, HipChat and Spectacle
- Sets up RBenv and installs bundler, pry and rails
- Adds solarized to Terminal
