
numbers = {}

(1..4).each do |x|
  (1..9).each do |d1|
    (1..9).each do |d2|
      (1..9).each do |d3|
        (1..9).each do |d4|
          (1..9).each do |d5|
            left = d1
            left = left*10 + d2 if x >= 2
            left = left*10 + d3 if x >= 3
            left = left*10 + d4 if x >= 4
            right = d5
            right = right + d4*10 if x < 4
            right = right + d3*100 if x < 3
            right = right + d2*1000 if x < 2
            product = left*right
            string = left.to_s + right.to_s + product.to_s
            if string.size == 9
              pandigital = true
              ("1".."9").each do |digit|
                pandigital &&= string.count(digit) == 1
              end
              numbers[product] = true if pandigital
            end
          end
        end
      end
    end
  end
end

sum = 0
numbers.each_key do |product|
  sum += product
end

puts "Solution: #{sum}"
