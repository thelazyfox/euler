def count_chain(value)
  n = 1
  while value != 1
    n += 1
    if value % 2 == 0
      value = value/2
    else
      value = 3*value + 1
    end
  end
  n
end

n = 2
longest_chain_length = 0
longest_chain_start = 0
while n < 1000000
  n += 1
  
  chain_start = n
  chain_length = count_chain(n)
  
  if(chain_length > longest_chain_length)
    longest_chain_length = chain_length
    longest_chain_start = chain_start
  end
end

puts "Solution: #{longest_chain_start}"

# Hmm...Slooooooow  How do I do this faster?