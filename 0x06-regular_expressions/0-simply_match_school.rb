#!/usr/bin/env ruby
#check if an argument is provided
#
if ARGV.empty?
  puts "Usage: #{$PROGRAM_NAME} <text>"
    exit 1
end
#get the argument
text = ARGV[0]
pattern = /School/
#use the regx to match the text
match_result = text.scan(pattern)
#print result or an empty string if no match
puts match_result.join('')
