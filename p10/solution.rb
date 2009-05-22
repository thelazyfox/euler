primes = [2,3]

current = 5
increment = 2

start = Time.now
while current < 2000000
  divisible = false
  limit = Math.sqrt(current)
  primes.each do |n|
    if current % n == 0
      divisible = true
      break
    end
    if n > limit
      break
    end
  end
  primes << current unless divisible
  current += increment
  increment = (increment == 2 ? 4 : 2)
end

puts primes.last
puts primes.length

sum = 0
primes.each do |n|
  sum += n
end

puts sum.class

puts "Time elapsed: #{Time.now-start}s"

puts "Solution: #{sum}"
