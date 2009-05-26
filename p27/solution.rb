def is_prime?(n)
  return false if n < 2
  return true if n == 2
  return true if n == 3
  return false if n % 2 == 0
  return false if n % 3 == 0
  increment = 2
  divisor = 5
  root = Math.sqrt(n)
  return false if divisor == root.to_i
  
  while divisor < root
    return false if n % divisor == 0
    divisor += increment
    increment = (increment == 2 ? 4 : 2)
  end
  true
end

length = 0
product = 0
(-999..999).each do |a|
  (-999..999).each do |b|
    n = 0
    while is_prime?(n**2 + a*n + b)
      n += 1
    end
    if n > length
      length = n
      product = a * b
    end
  end
end

puts "Solution: #{product}"