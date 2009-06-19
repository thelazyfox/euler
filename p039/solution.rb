squares = {}
(1..1000).each do |n|
  squares[n] = n**2
end

values = Hash.new([])

(4..1000).each do |p|
  div = (p-1)/2
  puts p
  (1..div).each do |a|
    (1..((p-a)>>1)).each do |b|
      c = p - a - b
      if (squares[a] + squares[b]) == (squares[c])
        values[p] += [[a,b,c]]
      end
    end
  end
end

largest = 0
index = 0
(3..1000).each do |n|
  if values[n].size > largest
    largest = values[n].size
    index = n
  end
end

puts "Solution: #{index}"