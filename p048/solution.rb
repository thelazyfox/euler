sum = 0
(1..1000).each do |i|
  sum += i**i
end

puts "Solution: #{sum.to_s[-10..-1]}"