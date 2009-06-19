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

a = 0
b = 1
c = 2
d = 3

while true
  a,b,c,d = b,c,d,d+1
  puts a if a%1000==0
  next unless factor(a).uniq.size == 4
  next unless factor(b).uniq.size == 4
  next unless factor(c).uniq.size == 4
  puts "got past c"
  next unless factor(d).uniq.size == 4
  break
end

puts "Solution: #{a}"
