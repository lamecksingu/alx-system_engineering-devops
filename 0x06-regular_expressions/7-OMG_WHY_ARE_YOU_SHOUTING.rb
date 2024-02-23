#!/usr/bin/env ruby
#Check if an argument is provided
if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <text>"
    exit 1
end
#get the argument
text = ARGV[0]

#define the regex
pattern = /[A-Z]/

#use regex to match the text
match_result = text.scan(pattern)

#print the results
puts match_result.join('')
