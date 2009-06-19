n = 1
increment = 2
sum = 1
while increment < 1001
  4.times do
    n += increment
    sum += n
  end
  increment += 2
end

puts "Solution: #{sum}"