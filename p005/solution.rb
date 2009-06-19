def divisible?(n)
  ret = true
  [3,6,7,8,9,11,12,13,14,15,16,17,18,19].each do |i|
    ret &&= n % i == 0
  end
  ret
end

n = 2520
while !divisible?(n)
  n += 20
end

puts "Solution: #{n}"