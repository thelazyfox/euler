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

amicable = []
(1..9999).each do |a|
  divs = divisors(a)
  divs.pop
  b = divs.sum
  if b < 10000
    divs = divisors(b)
    divs.pop
    if divs.sum == a && a != b
      amicable << a
      amicable << b
    end
  end
end

sum = amicable.uniq.sum
puts "Solution #{sum}"