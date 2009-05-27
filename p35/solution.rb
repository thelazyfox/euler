class Array
  def rotate
    push shift
  end
end

primes = [2,3]

current = 5
increment = 2

start = Time.now
while current < 1000000
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
elapsed = Time.now - start

puts "Elapsed: #{elapsed}"

circular = []

while primes.size > 0
  prime = primes.pop
  array = prime.to_s.split('')
  next if array.include?("0")
  next if array.include?("2")
  next if array.include?("4")
  next if array.include?("6")
  next if array.include?("8")
  valid = true
  list = [prime]
  (array.size-1).times do
    array.rotate
    new_prime = array.join.to_i
    if primes.delete(new_prime).nil? && list.index(new_prime).nil?
      valid = false
      break
    end
    list << new_prime
  end
  puts list.inspect if valid
  circular += list if valid
end

puts "Solution: #{circular.size}"
