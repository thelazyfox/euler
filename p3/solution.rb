number = 600851475143

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

solution = (factor(number).sort {|a,b| b <=> a})[0]

puts "Solution: #{solution}"