#!/usr/bin/env ruby
#Check if an argument is provided
if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <log_entry>"
    exit 1
end

#Get the log entry from the command-line argument
log_entry = ARGV[0]

#Extract information using regex
matches = log_entry.match(/\[from:([\w\+\-\(\)]+)\] \[to:([\w\+\-\(\)]+)\] \[flags:([\d:\-]+)\]/)

#output results
if matches
  sender = matches[1]
  receiver = matches[2]
  flags = matches[3]
  puts "#{sender},#{receiver},#{flags}"
else
  puts "Unable to extract information from the log entry"
end
