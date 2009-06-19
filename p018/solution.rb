triangle_string = <<-TRIANGLE
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
TRIANGLE

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
    (has_path?(left_triangle(triangle)) && !triangle[1][0].nil?) || 
    (has_path?(right_triangle(triangle)) && !triangle[1][1].nil?)
  end
end

def mask(triangle, min)
  tri = []
  triangle.each do |line|
    tri << line.collect {|value| (value >= min ? value : nil)}
  end
  tri
end

def find_sums(triangle, start_sum = 0)
  if triangle.size == 1
    [triangle[0][0] + start_sum] unless triangle[0][0].nil?
  else
    sums = []
    sums += find_sums(left_triangle(triangle), triangle[0][0] + start_sum) unless triangle[1][0].nil?
    sums += find_sums(right_triangle(triangle), triangle[0][0] + start_sum) unless triangle[1][1].nil?
    sums
  end  
end

n = triangle[0][0]
while !has_path?(mask(triangle,n))
  n -= 1
end

minimal_triangle = mask(triangle, n)
sums = find_sums(minimal_triangle)

sums.sort!

puts "Solution: #{sums.last}"
