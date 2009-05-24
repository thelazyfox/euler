def factorial(n)
  number = 1
  while n > 1
    number *= n
    n -= 1
  end
  number
end

string = factorial(100).to_s
array = string.split('')
array.collect! {|value| value.to_i}

sum = array.inject {|a,b| a+b}

puts "Solution: #{sum}"