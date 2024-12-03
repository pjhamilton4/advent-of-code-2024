def read_file(file_name)
  result = []
  f = File.open(file_name, "r")
  f.each_line do |line|
    result << line.split(" ")
  end
  result
end

def safe_report?(arr)
  # Check if the report is either strictly increasing or strictly decreasing
  increasing = true
  decreasing = true

  # Ensure the differences are between 1 and 3 and the list is strictly increasing or decreasing
  (1...arr.length).each do |i|
    diff = (arr[i] - arr[i - 1]).abs
    return false if diff < 1 || diff > 3  # The difference must be between 1 and 3.
    increasing &= arr[i] > arr[i - 1]   # Check if it's strictly increasing
    decreasing &= arr[i] < arr[i - 1]   # Check if it's strictly decreasing
  end

  # The report is safe if it's strictly increasing or strictly decreasing
  increasing || decreasing
end

def safe_report_with_dampener?(arr)
  # If the report is already safe without removing any level
  return true if safe_report?(arr)

  # Try removing each element and check if the resulting report is safe
  (0...arr.length).each do |i|
    new_arr = arr[0...i] + arr[(i+1)..-1]
    return true if safe_report?(new_arr)
  end

  # If no single removal makes it safe, return false
  false
end

def count_safe_reports(reports)
  safe_count = 0

  reports.each do |report|
    # Convert the report string to an array of integers
    arr = report.map(&:to_i)

    # Check if the report is safe with the Problem Dampener rule
    safe_count += 1 if safe_report_with_dampener?(arr)
  end

  safe_count
end

# Example usage with the provided reports
reports = read_file("./inputs/day2.txt")

puts count_safe_reports(reports)