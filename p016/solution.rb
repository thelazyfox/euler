n = 2**1000
string = n.to_s
array = string.split('')
array.collect! {|value| value.to_i}
sum = array.inject {|a,b| a+b }

puts "Soution: #{sum}"