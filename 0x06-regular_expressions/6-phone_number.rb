#!/usr/bin/env ruby
#Check if an argument is provided
if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <text>"
    exit 1
end
#get the argument
text = ARGV[0]

#define the regex
pattern = /\A\d{10}\z/

#use regex to match the text
match_result = text.match(pattern)

#print the results
puts match_result ? match_result[0] : ''
