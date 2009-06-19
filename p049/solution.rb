class Array
  def rotate
    push shift
  end
end

primes = [2,3]

current = 5
increment = 2

while current < 10000
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

while primes.first < 1000
  primes.delete_at(0)
end

def permutations(num)
  if num.size == 2
    return [num,num.reverse]
  end
  values = []
  num.split('').each do |digit|
    permutations(num.sub(digit,'')).each do |permutation|
      values << digit + permutation
    end
  end
  values
end

oddballs = []

primes.each do |prime|
  values = []
  permutations(prime.to_s).each do |permutation|
    if primes.include?(permutation.to_i)
      values << permutation.to_i
    end
  end
  if values.size >= 3
    values.sort!
    oddballs << values
  end
end

oddballs.sort!

solutions = []

oddballs.each do |odd|
  (0..(odd.size-3)).each do |i|
    (1..(odd.size-2)).each do |j|
      (2..(odd.size-1)).each do |k|
        if odd[j] - odd[i] == odd[k] - odd[j] && odd[j] != odd[i]
          solutions << [odd[i], odd[j], odd[k]]
        end
      end
    end
  end
end

solutions.uniq!
solutions.collect! do |array|
  array.collect do |num|
    num.to_s
  end.inject do |a,b|
    a+b
  end
end

puts solutions.inspect
