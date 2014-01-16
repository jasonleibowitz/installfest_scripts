# Checkpoints to see if you computer is configured properly.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Installfest" do

  ROOT = File.expand_path('~')

  describe "Brew" do
    # When you type `brew doctor` into your Terminal, you get no warnings.
    # If you get warnings follow the instructions
    # repeat until it says `Your system is ready to brew.`
    it "says 'Your system is ready to brew.'" do
      brew = `brew doctor`
      brew.must_include("Your system is ready to brew.")
    end
  end

  describe "Ruby" do
    # When you type `ruby -v` into your terminal, you get `ruby  2.1.0`
    it "rbenv is the default" do
      ruby = `which ruby`
      ruby.must_include(".rbenv/versions/")
    end
    it "says version 2.1.0" do
      RUBY_VERSION.must_match(/2.1.0/)
    end
  end

  describe "Pry" do
    # When you type `pry` into your terminal, it changes the prompt to `pry(main)`
    # (Type `exit` to return to return to the bash prompt)
    it "is installed" do
      pry = begin
        gem "pry"
      rescue Gem::LoadError
        false
      end
      pry.must_equal true
    end
  end

  describe "Sublime" do
    # Returns true if the named file is a symbolic link.
    # When you type `subl` into your terminal, it opens up Sublime Text
    it "has a symlink" do
      File.symlink?("/usr/local/bin/subl").must_equal true
    end
    it "has package manager" do
      # Check for either sublime
      sublimes = Dir["#{ROOT}/Library/Application Support/Sublime Text*/Installed Packages/"]
      package_manager = "Package Control.sublime-package"
      sublimes.each do |path|
        File.exists?("#{path}/#{package_manager}").must_equal true
      end
    end
  end

  # You have your `.gitignore_global`, `.gitconfig`, `.bash_profile` set up in your root directory.
  # You should be able to open each one with `subl ~/FILENAME` ie `subl ~/.gitignore_global`

  describe "Bash" do
    it "has a .bash_profile" do
      File.exists?("#{ROOT}/.bash_profile").must_equal true
    end
  end

  describe "Git" do
    it "is installed via homebrew" do
      git = `which git`
      git.must_include("/usr/local/bin/git")
    end
    it "has a .gitignore_global" do
      File.exists?("#{ROOT}/.gitignore_global").must_equal true
    end
    it "has a .gitconfig" do
      File.exists?("#{ROOT}/.gitconfig").must_equal true
    end
  end

  # When you have Sublime open and press `CMD+Shift+P` you'll see a drop down menu.
  # When you type `install` into the menu
  # you should see the option `Package Control: Install Package`

  # Your ssh keys are set up
  # (see [here](https://help.github.com/articles/generating-ssh-keys) for instructions)

  # When you type `subl ~/dev/wdi/WDI_NYC_12`, you see our class repository files

  describe "Spectacle" do
    # You have `Spectacle` installed on your computer and can use it to manage your windows
    it "is installed" do
      File.exists?("/Applications/Spectacle.app").must_equal true
    end
  end

end
