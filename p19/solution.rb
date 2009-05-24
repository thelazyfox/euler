require 'date'

count = 0
(1901..2000).each do |year|
  (1..12).each do |month|
    wday = Date::civil(year, month, 1).wday
    count += 1 if wday == 6
  end
end

puts "Solution: #{count}"