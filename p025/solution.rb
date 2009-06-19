a = 1
b = 1
n = 2

while b.to_s.length < 1000
  n += 1
  a,b = b, a+b
end

puts "Solution: #{n}"