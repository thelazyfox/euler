palindromes = []

def is_palindrome?(n)
  s = n.to_s
  s == s.reverse
end

(100..999).each do |a|
  (100..999).each do |b|
    palindromes << a*b if is_palindrome? a*b
  end
end

solution = palindromes.sort.pop

puts "Solution: #{solution}"