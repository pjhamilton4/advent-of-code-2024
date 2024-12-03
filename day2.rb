def read_file(file_name)
  result = []
  f = File.open(file_name, "r")
  f.each_line do |line|
    result << line.split(" ")
  end
  result
end
def main()
  file_result = read_file("./inputs/day2.txt")

  puts "File Number of samples: #{file_result.size}"

  safe = []
  unsafe = []

  for line in file_result
    previous_positive = false
    current_positive = false
    is_line_safe = false
    line.each_index do |index|
      if line[index+1] == nil
        break
      end

      change_result = line[index+1].to_i - line[index].to_i
      current_positive = change_result.positive?
      if index != 0
        previous_positive = current_positive
        current_positive = change_result.positive?

        if previous_positive != current_positive
          is_line_safe = false
          break
        end
      end

      change_abs = (line[index].to_i - line[index+1].to_i).abs
      if change_abs == 0
        is_line_safe = false
        break
      elsif change_abs >= 1 && change_abs <= 3
        is_line_safe = true
      else
        is_line_safe = false
        break
      end

    end
    if is_line_safe
      safe.push(line)
    else
      unsafe.push(line)
    end
  end

  puts "Safe Readings: #{safe}"
  puts "Unsafe Readings: #{unsafe}"
  puts safe.length
  puts unsafe.length
end

main()