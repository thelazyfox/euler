def is_prime?(n)
  return false if n < 2
  return true if n == 2
  return true if n == 3
  return false if n % 2 == 0
  return false if n % 3 == 0
  increment = 2
  divisor = 5
  root = Math.sqrt(n)
  return false if divisor == root
  
  while divisor < root
    return false if n % divisor == 0
    divisor += increment
    increment = (increment == 2 ? 4 : 2)
  end
  true
end

def combinations(string)
  if string.size == 1
    return [string]
  elsif string.size == 2
    return [string,string.reverse]
  end
  combos = []
  string.split('').each do |c|
    combos += combinations(string.delete(c)).collect {|s| c+s}
  end
  combos
end

primes = []

9.downto(1) do |n|
  (1..n).each do |i|
    right = ("1".."#{i}").to_a.join
    left = ("1".."#{n}").to_a.join.reverse.delete(right)
    combinations(right).each do |combo|
      number = (left + combo).to_i
      primes << number if is_prime?(number)
    end
  end
end

largest = primes.sort.last

puts "Solution: #{largest}"