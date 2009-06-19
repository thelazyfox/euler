def sum_digits(n)
  digits = n.to_s.split('').collect {|value| value.to_i**5}
  digits.inject {|a,b| a+b}
end

n = 1

while (n * 9**5) >= 10**(n-1)
  n += 1
end

max = (n*9**5) + 1
puts max
n = 2
numbers = []
while n < max
  if n == sum_digits(n)
    numbers << n
  end
  n += 1
end

sum = numbers.inject {|a,b| a+b}
puts "Solution: #{sum}"
