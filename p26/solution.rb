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

def coprimes?(a,b)
  a_factors = factor(a).uniq
  b_factors = factor(b).uniq
  
  a_factors.each do |n|
    return false if b_factors.include?(n)
  end
  true
end

def order_of(n)
  return nil unless coprimes?(10,n)
  k = 1
  while (10**k) % n != 1
    k += 1
  end
  k
end

non_terminals = []
(1..999).each do |n|
  a = n
  while a % 2 == 0
    a /= 2
  end
  while a % 5 == 0
    a /= 5
  end
  non_terminals << n unless a == 1
end

periods = {}
non_terminals.each do |n|
  p2 = 0
  p5 = 0
  a = n
  while a % 2 == 0
    a /= 2
    p2 += 1
  end
  while a % 5 == 0
    a /= 5
    p5 += 1
  end
  periods[n] = order_of(a)
end

biggest_key = 0
biggest_value = 0
periods.each do |key,value|
  if value > biggest_value
    biggest_key = key
    biggest_value = value
  end
end

puts "Holy crap it worked"
puts "Solution: #{biggest_key}"
