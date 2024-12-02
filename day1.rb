def read_file(file_name)
  result = []
  f = File.open(file_name, "r")
  f.each_line do |line|
    result << line.split(" ")
  end
  result
end

def main()
  left = []
  right = []

  file_result = read_file("./inputs/day1.txt")

  for line in file_result
    left.push(line[0].to_i)
    right.push(line[1].to_i)
  end

  left = left.sort
  right = right.sort

  puts "Left: #{left}"
  puts "Right: #{right}"

  puts "Left Length: #{left.length}"
  puts "Right Length: #{right.length}"

  total = 0
  right.each_index do |index|
    total += (left[index] - right[index]).abs
  end

  puts "Total: #{total}"

  right_tally = right.tally

  similarity_score = 0
  left.each do |num|
    similarity_score += num * right_tally[num].to_i
  end

  puts "Similarity Score: #{similarity_score}"
end

main()
