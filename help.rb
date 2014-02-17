#!/usr/bin/env ruby

require 'rainbow/ext/string'
require 'yaml'
require 'hipchat'
require 'github'

WDI_INFO = YAML::load(File.open("wdi_info.yaml", "r"))

OPTIONS = [
    "Instructors", 
    "Producers", 
    "Building Locations and Hours", 
    "Office Hours",
    "One on One Schedule",
    "I'm sick today"
]

def say(message, color=:default)
  puts(message.color(color))
end

def ask(question)
  say(question, :yellow)
  gets.chomp
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
  client = HipChat::Client.new(HIPCHAT_API_TOKEN)
  hipchat_username = ENV["hipchat_username"]
  message = "Testing: I'm out sick! Today"
  classroom = ENV["hipchat_classroom"]
  client[classroom].send(hipchat_username, message, :color => 'red')
  say("Sending sick notice. Feel better!")
end

def github_issue
  github = Github.new({
    :user => ENV["github_username"],
    :repo => ENV["wdi_class_repo"],
    :password => ENV["github_password"]
  })
  github.issues.create({
    "title" => "Missing Class",
    "body" => "This is an issue test",
    "labels" => [
      "attendance"
    ],
    "assignee" => WDI_INFO["homework_lead"]
  })
end

def continue?
  puts("Continue? (y/n)")
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
  gets.chomp.to_i
end

loop do
  choice = menu
  case choice
  when 0 then tell_me_about(:instructors)
  when 1 then tell_me_about(:producers)
  when 2 then tell_me_about(:locations)
  when 3 then tell_me_about(:office_hours)
  when 4 then alert_instructors
  end
  continue?
end

# Resources

# https://github.com/hipchat/hipchat-rb
# https://api.hipchat.com/v1/rooms/message
# http://help.hipchat.com/knowledgebase/articles/64389-github-integration

# Symlinked with 
# ln -s "/Users/philco/.wdi-installfest/wdi_help" /usr/local/bin/wdi_help