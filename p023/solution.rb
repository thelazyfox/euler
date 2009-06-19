class Array
  def sum
    self.inject {|a,b| a+b}
  end
end

def factor(n)
  if n == 0
    [0]
  elsif n == 1
    [1]
  else
    i = 2
    while n % i > 0
      i += 1
    end
    if i == n
      [n]
    else
      factor(i) + factor(n/i)
    end
  end
end

def divisors(n)
  primes = Hash.new(0)
  factor(n).each do |value|
    primes[value] += 1
  end
  factors = [1]
  primes.each do |prime,count|
    factors.collect! do |factor|
      list = []
      (count+1).times do |power|
        list << factor * (prime**power)
      end
      list
    end
    factors.flatten!
  end
  factors.flatten
end

abundant_numbers = []

puts "Checking Abundant Numbers..."
(1..28123).each do |n|
  puts n if n % 100 == 0
  divs = divisors(n)
  divs.sort!
  divs.pop
  if divs.uniq.sum > n
    abundant_numbers << n
  end
end
puts "Done.  Found #{abundant_numbers.size} numbers"

puts abundant_numbers
puts ""

abundant_sums = Hash.new(false)

puts "Finding abundant number sums..."
abundant_numbers.each_index do |i|
  puts i if i % 100 == 0
  (i..(abundant_numbers.size-1)).each do |j|
    sum = abundant_numbers[i] + abundant_numbers[j]
    abundant_sums[sum] = true unless sum > 28123
  end
end
puts "Done."

puts "Summing up the result"
sum = 0
(1..28123).each do |n|
  sum += n unless abundant_sums[n]
end
puts "Done"

puts "Solution: #{sum}"

