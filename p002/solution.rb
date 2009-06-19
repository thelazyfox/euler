def fib(n)
  c = 0
  s = 1
  (n+1).times do |i|
    c, s = s, c + s
  end
  c
end

n = 1
while fib(n) < 4000000
  n += 1
end

sum = 0
i = 2
while i < n
  sum += fib(i)
  i += 3
end

puts "Solution: #{sum}"