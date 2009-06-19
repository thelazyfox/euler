def factorial(n)
  number = 1
  while n > 1
    number *= n
    n -= 1
  end
  number
end

FACTORIAL = {}
(0..9).each do |n|
  FACTORIAL[n] = factorial(n)
end

def factorial_sum(n)
  digits = n.to_s.split('')
  digits.collect! {|d| FACTORIAL[d.to_i]}
  digits.inject {|a,b| a+b}
end

n = 1
while FACTORIAL[9] * n > 10**(n-1)
  n += 1
end
max_value = FACTORIAL[9]*(n-1)

puts max_value

numbers = []
(10..max_value).each do |n|
  puts n if n % 10000 == 0
  if n == factorial_sum(n)
    numbers << n
  end
end

sum = numbers.inject {|a,b| a+b}

puts "Solution: #{sum}"