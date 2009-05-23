def rising_factorial(x, n)
  product = 1
  n.times do |i|
    product *= x + i
  end
  product
end

def factorial(n)
  number = 1
  while n > 1
    number *= n
    n -= 1
  end
  number
end

def square_paths(n)
  rising_factorial(n+1,n)/factorial(n)
end

puts "Solution: #{square_paths(20)}"
