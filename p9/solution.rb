# start with c = 335

a = 0
b = 0
c = 335
while a**2 + b**2 != c**2
  begin
    if b < c-1
      b += 1
    else
      c += 1
      b = 0
    end
    a = 1000 - b - c
  end while !(a < b && b < c)
end

product = a * b * c

puts "Solution: #{product}"