require_relative "hipchat_notifier"
require_relative "github_notifier"

def say(message, color=:default)
  puts(message.color(color))
end

def ask(message)
  print message
  gets.chomp.downcase
end

def tell_me_about(info)
  system("clear")
  say(info.to_s.upcase.center(80, "#"))
  WDI_INFO[info.to_s].each do |line|
    line.each do |key, value|
      say("#{key.rjust(10, " ")}: #{value}")
    end
  end
end

def alert_instructors
  system("clear")
  # via hipchat
  HipchatNotifier.new.warn("Out Sick!")
  # via github issues
  GithubNotifier.new.alert("Out Sick!")
  say("Your instructors have been notified via HipChat and Github. Feel better!")
  exit
end

def continue?
  print("Continue? (y/n)")
  choice = gets.chomp.downcase
  if choice == "n" || choice == "q"
    say("Goodbye!")
    exit
  end
end

def menu
  system("clear")
  say("Halp!", :red)
  OPTIONS.each_with_index do |option, i|
    say("- #{i} #{option}")
  end
  print("Pick a number ")
  gets.chomp.to_i
end