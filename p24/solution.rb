def factorial(n)
  number = 1
  while n > 1
    number *= n
    n -= 1
  end
  number
end

numbers = (0..9).to_a

permutation = 0
array = []
10.times do |n|
  count = 0
  perm = factorial(9-n)
  while permutation + perm < 1000000
    count += 1
    permutation += factorial(9-n)
  end
  array << count
end

string = ""
array.each do |n|
  string += numbers.delete_at(n).to_s
end

puts "Solution: #{string}"

