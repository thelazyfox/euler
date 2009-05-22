primes = [2]

current = 3

start = Time.now
while primes.last < 2000000
  divisible = false
  limit = Math.sqrt(current)
  limit = limit/(Math.log(limit)-1)
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
  current += 2
end

puts primes.pop
puts primes.last

sum = primes.inject {|a,b| a+b}

puts "Time elapsed: #{Time.now-start}s"

puts "Solution: #{sum}"