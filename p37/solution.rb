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

def left_to_right_prime?(s)
  s.size.times do |n|
    return false unless is_prime?(s[0..n].to_i)
  end
  true
end

def right_to_left_prime?(s)
  s.size.times do |n|
    return false unless is_prime?(s[n..-1].to_i)
  end
  true
end

def truncatable?(string)
  if string.size > 1
    right_to_left_prime?(string) && left_to_right_prime?(string)
  else
    false
  end
end

def find_primes(n)
  n = n.to_s
  primes = []
  ["1","2","3","5","7","9"].each do |p|
    string = p + n
    if is_prime?(string.to_i)
      primes << string unless !is_prime?(string[0..0].to_i)
      primes += find_primes(string) unless p == "2"
    end
  end
  primes
end

primes = find_primes(3) + find_primes(7)

primes.collect! do |prime|
  if truncatable?(prime)
    prime.to_i
  else
    nil
  end
end.compact!.sort!

sum = primes.inject {|a,b| a+b}
puts "Solution: #{sum}"
