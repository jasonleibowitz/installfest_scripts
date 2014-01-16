WDI InstallFest Scripts

A work in progress to automate the set up of a student's development machine.

Run this script from the command line

```bash
curl https://raw.github.com/WDI_NYC_12/installfest_scripts/master/install.sh | bash
```

The repo is currently hidden, so use the below url with token.
```
curl https://raw.github.com/ga-students/WDI_NYC_12_Instructors/super_installfest/installfest/install.sh?token=1198291__eyJzY29wZSI6IlJhd0Jsb2I6Z2Etc3R1ZGVudHMvV0RJX05ZQ18xMl9JbnN0cnVjdG9ycy9zdXBlcl9pbnN0YWxsZmVzdC9pbnN0YWxsZmVzdC9pbnN0YWxsLnNoIiwiZXhwaXJlcyI6MTM5MDQ5NzAzNX0%3D--63f35c53937b27cd9b9d79db9ac357f25075e6f2 | bash
```

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
