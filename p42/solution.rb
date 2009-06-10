file = File.new("words.txt", "r")
text = file.read

words = eval("[" + text + "]")

A = "A"[0]-1

words.collect! do |word|
  sum = 0
  word.size.times do |i|
    sum += word[i] - A
  end
  sum
end

words.sort!

def triangle_number(n)
  (n*(n+1))/2
end

largest = words.last

triangle_numbers = [1]
n = 1
while triangle_numbers.last < largest
  n += 1
  triangle_numbers << triangle_number(n)
end

count = 0
words.each do |sum|
  count += 1 if triangle_numbers.include?(sum)
end

puts "Solution: #{count}"