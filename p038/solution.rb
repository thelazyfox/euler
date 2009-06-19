def digit_count(n)
  (Math.log(n)/Math.log(10)).to_i+1
end

def concatenate(n)
  i = 0
  count = 0
  string = ""
  while count < 9
    i += 1
    count += digit_count(n*i)
    string += (n*i).to_s
  end
  string
end

def pandigital?(string)
  ("1".."9").each do |n|
    string.sub!(n,'')
  end
  
  if string.size == 0
    true
  else
    false
  end
end

integers = []

i = 1
while i < 10000
  integers << i if concatenate(i).size == 9
  i += 1
end

integers.collect! do |i|
  string = concatenate(i)
  if pandigital?(string)
    concatenate(i).to_i
  else
    nil
  end
end.compact!.sort!

value = integers.last

puts "Solution: #{value}"
