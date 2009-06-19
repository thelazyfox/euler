file = File.new("names.txt", "r")
names = file.read
names = "[" + names + "]"
names = eval(names)
names.sort!

LETTERS = ("A".."Z").to_a

def name_score(string)
  score = 0
  string.split('').each do |letter|
    score += letter_score(letter)
  end
  score
end

def letter_score(letter)
  return LETTERS.index(letter) + 1 unless LETTERS.index(letter).nil?
  0
end

scores = names.collect {|name| name_score(name)}

scores.each_index do |i|
  scores[i] *= i+1
end

sum = scores.inject {|a,b| a+b}

puts "Solution: #{sum}"
