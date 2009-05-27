def is_palindrome?(string)
  string == string.reverse
end

def double_palindrome?(string)
  is_palindrome?(string) &&
  is_palindrome?(string.to_i.to_s(2))
end

palindromes = []
("1".."999").each do |half|
  num = half + half.reverse
  palindromes << num if double_palindrome?(num)
end

("0".."9").each do |middle|
  ("1".."99").each do |half|
    num = half + middle + half.reverse
    palindromes << num if double_palindrome?(num)
  end
end

("1".."9").each do |num|
  palindromes << num if double_palindrome?(num)
end

palindromes.collect! {|p| p.to_i}
sum = palindromes.inject {|a,b| a+b}

puts "Solution: #{sum}"