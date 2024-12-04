def read_file(file_name)
  File.read(file_name)
end
def main
  input = read_file("./inputs/day3.txt")
  #puts "Input: #{input}"
  with_exclusions = input.scan(/mul[(]\d{1,3},\d{1,3}[)]/)
  removed_exclusions = input.gsub(/[don't()]{1}.*(mul[(]\d{1,3},\d{1,3}[)])*.*[do()]{1}/, '')
  matches = removed_exclusions.scan(/mul[(]\d{1,3},\d{1,3}[)]/)
  puts "With Exclusions: #{with_exclusions}"
  puts "Matches: #{matches}"
  total = 0
  matches.each { |match|
    if match != nil
      left = match.scan(/\d+/).first.to_i
      right = match.scan(/\d+/).last.to_i
      total += (right * left)
    end
  }
  total
end

if __FILE__ == $0
  puts main
end