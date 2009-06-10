def filter(string)
  str = string.dup
  ("0".."9").each do |c|
    str.sub!(c,"")
  end
  if str.size > 0
    nil
  else
    string
  end
end

values = []
(1..999).each do |n|
  if (n % 17) == 0
    values << n
  end
end

values.collect! do |value|
  filter(value.to_s.rjust(3,"0"))
end.compact!

[13,11,7,5,3,2].each do |prime|
  values.collect! do |value|
    new_values = []
    right = value[0..1]
    ("0".."9").each do |n|
      new_values << n+value if ((n+right).to_i % prime) == 0
    end
    new_values.collect! do |value|
      filter(value)
    end.compact!
    new_values
  end.flatten!
end

values.collect! do |value|
  ("0".."9").each do |c|
    value = c + value if value.index(c).nil?
  end
  value.to_i
end

sum = values.inject {|a,b| a+b}

puts "Solution: #{sum}"
