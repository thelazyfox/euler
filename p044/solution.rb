def p(n)
  (n*((n+(n<<1))-1))>>1
end

def is_pentagonal?(x)
  root = Math.sqrt(24*x+1)
  return false unless root == root.floor
  n = (root + 1)/6
  return false unless n == n.floor
  true
end

def find_pentagonal
  pentagonals = [0, p(1)]
  k = 2
  while k < 10000
    pk = p(k)
    pentagonals[k] = pk
    (1..k).each do |j|
      pj = pentagonals[j]
      if is_pentagonal?(pk-pj) && is_pentagonal?(pk+pj)
        return [pk,pj]
      end
    end
    k += 1
  end
end

value = find_pentagonal

puts "Solution: #{value[0] - value[1]}"