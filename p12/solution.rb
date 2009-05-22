def triangle_number(n)
  n*(n+1)/2
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

start = Time.now
n = 0
begin
  n += 1
  count = Hash.new(0)
  factor(triangle_number(n)).each do |value|
    count[value] += 1
  end

  divisors = 1
  count.each_value do |value|
    divisors *= value+1
  end
end while divisors < 500
elapsed = Time.now - start

puts "Took #{elapsed} seconds."

puts triangle_number(n)

