#!/usr/bin/env ruby

require 'optparse'

options = {}

OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"
  
  opts.separator("")
  opts.separator "Specific options:"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-s", "--sick", "Report an absense") do |s|
    options[:sick] = s
  end

  opts.separator "Common options:"

  # No argument, shows at tail.  This will print an options summary.
  # Try it and see!
  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end

end.parse!

p options

p ARGV

# $ wdi alert --github --hipchat