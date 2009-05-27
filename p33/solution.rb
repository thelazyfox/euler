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

fractions = []
("1".."9").each do |d1|
  ("1".."9").each do |d2|
    ("1".."9").each do |d3|
      num = d2.to_f/d3.to_f
      next if d2 == d3 || num >= 1
      if num == (d1+d2).to_f/(d1+d3).to_f
        fractions << [(d1+d2).to_i,(d1+d3).to_i]
      elsif num == (d2+d1).to_f/(d1+d3).to_f
        fractions << [(d2+d1).to_i,(d1+d3).to_i]
      elsif num == (d1+d2).to_f/(d3+d1).to_f
        fractions << [(d1+d2).to_i,(d3+d1).to_i]
      elsif num == (d2+d1).to_f/(d3+d1).to_f
        fractions << [(d2+d1).to_i,(d3+d1).to_i]
      end
    end
  end
end

puts fractions.inspect

fraction = fractions.inject {|f1,f2| [f1[0]*f2[0],f1[1]*f2[1]]}

n_factors = factor(fraction[0])
d_factors = factor(fraction[1])

puts n_factors.inspect
puts d_factors.inspect

unique_factors = n_factors.uniq

unique_factors.each do |f|
  while n_factors.include?(f) && d_factors.include?(f)
    n_factors.delete_at(n_factors.index(f))
    d_factors.delete_at(d_factors.index(f))
  end
end

n_factors << 1
d_factors << 1

numerator = n_factors.inject {|a,b| a*b}
denominator = d_factors.inject {|a,b| a*b}

puts numerator
puts denominator