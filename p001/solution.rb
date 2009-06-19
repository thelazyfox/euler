threes = []
fives  = []

n = 1
while n*3 < 1000
  threes << n*3
  n += 1
end

n = 1
while n*5 < 1000
  fives << n*5
  n += 1
end

sum = 0
fives.each do |n|
  sum += n unless threes.include? n
end

threes.each do |n|
  sum += n
end

puts "Solution: #{sum}"