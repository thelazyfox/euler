def is_pentagonal?(x)
  n = (Math.sqrt(24*x+1) + 1.0)/6.0
  return false unless n == n.floor
  true
end

def is_hexagonal?(x)
  n = (Math.sqrt(8*x+1) + 1.0)/4.0
  return false unless n == n.floor
  true
end

def t(n)
  n*(n+1)/2
end

n = 286
value = t(n)
while(!(is_pentagonal?(value) && is_hexagonal?(value)))
  n += 1
  value = t(n)
end

puts value