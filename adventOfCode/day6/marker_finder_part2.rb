# https://adventofcode.com/2022/day/6
# input - https://adventofcode.com/2022/day/6/input

fname = './buffer_message.txt'
lines_read = File.readlines(fname, chomp: true)

start_char = 0

puts "TEST : #{'nqvq'.chars.uniq.count { |char| 'nqvz'.count(char) > 1 }}"

puts lines_read[0][start_char..start_char + 13]
puts lines_read[0][start_char..start_char + 13].squeeze

while start_char < lines_read[0].length
  char_code = lines_read[0][start_char..start_char + 13]
  puts "--- #{start_char} - #{char_code} :: #{char_code.chars.uniq.count { |char| char_code.count(char) > 1 }}"

  if char_code.chars.uniq.count { |char| char_code.count(char) > 1 } == 0
    puts "FOUND IT! Code starts at char : #{start_char} (#{char_code.squeeze})"
    puts "SOLUTION : #{start_char + 14}"
    break
  end

  start_char += 1
end
