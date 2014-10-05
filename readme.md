## WDI InstallFest Script

##### Note

This is a fork of [phlco](https://github.com/phlco)'s version of the GA installfest scripts. I modified it so that this script is optimized for post-WDI dev machines. 

All notes below are Phil's notes and will be updated for my fork.

---

A work in progress to automate the set up of a student's development machine.

##### For Mac OS:

Paste this script into a Terminal prompt:

```
bash <(curl -s https://raw.github.com/ga-instructors/installfest_script/mac_os/install.sh)
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

##### For Ubuntu Linux:

```
bash <(curl -s https://raw.github.com/ga-instructors/installfest_script/ubuntu/install.sh)
```

**Don't use yet!** Is not in working condition.

### Why not use a Virtual Environment?

When weighing the options, we decided not use Vagrant to ensure all students were working in a common environment for three main reasons:

1. ownership
2. simplicity
3. Heroku

##### Ownership

We want the students to feel as if they are in control of their environments. That is, they should be able, within reason, to customize and optimize their coding experience as they see fit. Using a common install and then stepping away feels like a good way to set a baseline while allowing them ownership. While they could do the same with virtual machine, that undermines the entire reson of forcing them to work in a virtualized environment.

The precept holds as well: let's help them grow as individuals, and not enforce uniformity upon them. It seems to me weirdly patronizing to force them to work in an environment we've created, instead of giving them the tools to begin building their own.

##### Simplicity

Sure, having the students install Vagrant and run a VM may seem like it takes fewer steps than running this overcooked install script. But it's also removing a fair amount of agency. They don't afterwards have to interact with their dev envrionment, but only because of a reliance upon multiple layers of incredibly complicated software. It's giving the students "the magic" up front, which we've often seen lead to a number of questions we can't answer and misconceptions that are hard to clear up.

##### Heroku

As long as we are pushing our repos to Heroku for deployment, a VM seems unnecessary. But if we begin using a different and customizable hosting environment, and teaching students basics concerning DevOps, it may make sense to use Chef and Vagrant to configure servers and deploy.

### That being said...

We expect to build virtual machines using the script and then have torrent links available here.

* [Download and install Vagrant.][vagrant]
* [Download our Vagrant Box via BitTorrent.][torrent]

[vagrant]: http://www.vagrantup.com/downloads  "Vagrant"
[torrent]: http://example.com/  "GABox"
