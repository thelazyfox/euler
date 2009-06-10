def digits(n)
  (Math.log(n+1)/Math.log(10)).ceil
end

string = ""

multiple = 1

i = 0
count = 0
digit = 0
target = 0
7.times do |n|
  target = 10**n
  while digit < target
    i += 1
    count = digits(i)
    digit += count
  end
  d = target - digit - 1
  multiple *= i.to_s[d..d].to_i
  string += i.to_s[d..d]
end

puts "Solution: #{multiple}"