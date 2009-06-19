class Array
  def rotate
    push shift
  end
end

primes = [2,3]

current = 5

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
  if divisible
    goldbach = false
    (1..(primes.size-1)).each do |i|
      value = current - primes[i]
      if (value % 2) == 0
        value >>= 1
        root = Math.sqrt(value)
        if root.ceil == root.floor
          goldbach = true
        end
      end
    end
    unless goldbach
      puts "Solution: #{current}"
      break
    end
  else
    primes << current
  end
  current += 2
end
