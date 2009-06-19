triangle_file = File.new("triangle.txt", "r")
triangle_string = triangle_file.read

triangle = []
triangle_string.split("\n").each do |line|
  values = line.split(" ")
  values.collect! {|value| value.to_i}
  triangle << values
end

def left_triangle(triangle)
  tri = []
  triangle.each do |line|
    next unless line.length > 1
    tri << line.first(line.size-1)
  end
  tri
end

def right_triangle(triangle)
  tri = []
  triangle.each do |line|
    next unless line.length > 1
    tri << line.last(line.size-1)
  end
  tri
end

def triangle_weight(triangle)
  sum = 0
  triangle.each do |line|
    sum += line.inject {|a,b| (a+b)/line.size}
  end
  sum
end

def triangle_sum(triangle)
  sum = 0
  triangle.each do |line|
    sum += line.inject {|a,b| a+b}
  end
  sum
end

def has_path?(triangle)
  if triangle.size == 1
    return true unless triangle[0][0].nil?
    false
  else
    ret = false
    ret ||= has_path?(left_triangle(triangle)) unless triangle[1][0].nil?
    ret ||= has_path?(right_triangle(triangle)) unless triangle[1][1].nil?
    ret
  end
end

def mask(triangle, min)
  tri = []
  triangle.each do |line|
    tri << line.collect {|value| (!value.nil? && value >= min ? value : nil) }
  end
  tri
end

def find_mask(triangle, start_mask = 1)
  n = start_mask
  while has_path?(mask(triangle, n))
    n += 1
  end
  n-1
end

def sum_right(triangle)
  sum = 0
  triangle.each do |line|
    sum += line.last
  end
  sum
end

def sum_left(triangle)
  sum = 0
  triangle.each do |line|
    sum += line.first
  end
  sum
end

def find_sums(triangle, mask = 1, start_sum = 0)
  if triangle.size == 1
    [triangle[0][0] + start_sum] unless triangle[0][0].nil?
  else
    mask = find_mask(triangle, mask)
    puts mask if triangle.size % 10 == 0 && triangle.size > 10
    sums = []
    puts "L #{triangle.size}" if triangle.size % 10 == 0 && triangle.size > 10
    sums += find_sums(left_triangle(triangle), mask, triangle[0][0] + start_sum) unless triangle[1][0].nil?
    puts "R #{triangle.size}" if triangle.size % 10 == 0 && triangle.size > 10
    sums += find_sums(right_triangle(triangle), mask, triangle[0][0] + start_sum) unless triangle[1][1].nil?
    sums
  end  
end

def find_sum(triangle)
  puts triangle[0][0]
  if triangle.size == 1
    triangle[0][0]
  elsif sum_right(triangle) < sum_left(triangle)
    triangle[0][0] + find_sum(left_triangle(triangle))
  else
    triangle[0][0] + find_sum(right_triangle(triangle))
  end
end

triangle.reverse!

triangle.each_index do |line|
  next unless line + 1 < 100
  triangle[line].each_index do |i|
    next unless i + 1 < triangle[line].size
    if triangle[line][i] > triangle[line][i+1]
      triangle[line+1][i] += triangle[line][i]
    else
      triangle[line+1][i] += triangle[line][i]
    end
  end
end

triangle.reverse!

sum = triangle[0][0]

puts "Solution: #{sum}"
