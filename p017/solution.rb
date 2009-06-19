require 'rubygems'
require 'linguistics'


Linguistics::use(:en)

count = 0
(1..1000).each do |n|
  string = n.en.numwords
  count += string.count(("a".."z").to_a.join)
end

puts "Solution: #{count}"