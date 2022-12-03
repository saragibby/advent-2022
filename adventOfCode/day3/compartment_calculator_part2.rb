# https://adventofcode.com/2022/day/3
# input - https://adventofcode.com/2022/day/3/input

fname = './rucksack_items.txt'
lines_read = File.readlines(fname, chomp: true)

alpha_table = {}
('a'..'z').zip(1..26).each { |x| alpha_table[x[0]] = x[1] }
('A'..'Z').zip(27..52).each { |x| alpha_table[x[0]] = x[1] }

puts alpha_table

elves_groups = []
range_start = 0

(3..lines_read.length).step(3) do |x|
  elves_groups << lines_read[range_start..x - 1]
  range_start = x
end

all_badges = elves_groups.map do |group|
  group[0].split('') & group[1].split('') & group[2].split('')
end

result = all_badges.collect do |x|
  alpha_table[x[0]]
end

puts "TOTAL : #{result.sum}"
