def read_file(file_name)
  File.read(file_name)
end
def main
  input = read_file("./inputs/day3.txt")
  #puts "Input: #{input}"
  matches = input.scan(/mul[(]\d{1,3},\d{1,3}[)]/)
  puts "Matches: #{matches}"
  total = 0
  for match in matches
    left = match.scan(/\d+/).first.to_i
    right = match.scan(/\d+/).last.to_i
    total += (right * left)
  end
  total
end

if __FILE__ == $0
  puts main
end