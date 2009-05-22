def sum_of_squares(n)
  sum = 0
  n.times do |n|
    sum += (n+1)**2
  end
  sum
end

def square_of_sum(n)
  (n*(n+1)/2)**2
end

def diff_slow(n)
  square_of_sum(n) - sum_of_squares(n)
end

def diff_fast(n)
  sum = 0
  (1..n).each do |a|
    (1..n).each do |b|
      sum += a*b unless a == b
    end
  end
  sum
end

puts "Solution: #{diff_fast(100)}"

