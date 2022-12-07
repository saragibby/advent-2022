# https://adventofcode.com/2022/day/5
# input - https://adventofcode.com/2022/day/5/input

fname = './crates.txt'
lines_read = File.readlines(fname, chomp: true)

stacks = {
  '1' => [],
  '2' => [],
  '3' => [],
  '4' => [],
  '5' => [],
  '6' => [],
  '7' => [],
  '8' => [],
  '9' => []
}

lines_read[0..7].each do |line|
  stacks['1'] << line[1] unless line[1].strip.empty?
  stacks['2'] << line[5] unless line[5].strip.empty?
  stacks['3'] << line[9] unless line[9].strip.empty?
  stacks['4'] << line[13] unless line[13].strip.empty?
  stacks['5'] << line[17] unless line[17].strip.empty?
  stacks['6'] << line[21] unless line[21].strip.empty?
  stacks['7'] << line[25] unless line[25].strip.empty?
  stacks['8'] << line[29] unless line[29].strip.empty?
  stacks['9'] << line[33] unless line[33].strip.empty?
end

puts '--- STARTING ---'
puts "stack 1: #{stacks['1']}"
puts "stack 2: #{stacks['2']}"
puts "stack 3: #{stacks['3']}"
puts "stack 4: #{stacks['4']}"
puts "stack 5: #{stacks['5']}"
puts "stack 6: #{stacks['6']}"
puts "stack 7: #{stacks['7']}"
puts "stack 8: #{stacks['8']}"
puts "stack 9: #{stacks['9']}"

lines_read[10..lines_read.length].each do |move_line|
  number_to_move = move_line.split('from')[0].gsub('move', '').strip
  move_from = move_line.split('from')[1].split('to')[0].strip
  move_to = move_line[-1]

  puts ">>> >>> #{number_to_move} - from: #{move_from} - to: #{move_to}"
  puts "FROM: #{stacks[move_from]}"
  puts "TO: #{stacks[move_to]}"
  puts "MOVING: #{stacks[move_from][0..number_to_move.to_i - 1]}"
  
  stacks[move_to] = stacks[move_from][0..number_to_move.to_i - 1] + stacks[move_to]
  stacks[move_from].shift(number_to_move.to_i)
  
  puts "RESULT: #{stacks[move_to]}"
end

puts '------- END RESULT OF STACKS ------'
puts "stack 1: #{stacks['1']}"
puts "stack 2: #{stacks['2']}"
puts "stack 3: #{stacks['3']}"
puts "stack 4: #{stacks['4']}"
puts "stack 5: #{stacks['5']}"
puts "stack 6: #{stacks['6']}"
puts "stack 7: #{stacks['7']}"
puts "stack 8: #{stacks['8']}"
puts "stack 9: #{stacks['9']}"

puts "FIRST OF EACH STACK : #{(1..9).map { |x| stacks[x.to_s][0] }.join('')}"
