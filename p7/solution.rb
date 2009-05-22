primes = [2]

current = 3

while primes.length < 10001
  divisible = false
  primes.each do |n|
    if current % n == 0
      divisible = true
      break
    end
    if n > Math.sqrt(current)
      break
    end
  end
  primes << current unless divisible
  current += 2
  puts primes.length if primes.length % 100 == 0
end

puts "Solution: #{primes.last}"