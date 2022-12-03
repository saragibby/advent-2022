# https://adventofcode.com/2022/day/3
# input - https://adventofcode.com/2022/day/3/input

fname = './rucksack_items.txt'
lines_read = File.readlines(fname, chomp: true)

rucksacks = []

alpha_table = {}
('a'..'z').zip(1..26).each { |x| alpha_table[x[0]] = x[1] }
('A'..'Z').zip(27..52).each { |x| alpha_table[x[0]] = x[1] }

lines_read.each do |rucksack|
  mid = rucksack.length / 2
  compartment_1 = rucksack[0..mid - 1]
  compartment_2 = rucksack[mid..-1]

  rucksacks << {
    compartment_1: compartment_1,
    compartment_2: compartment_2,
    shared_item: compartment_1.split('') & compartment_2.split('')
  }
end

all_priorities = rucksacks.map { |r| r[:shared_item] }

result = all_priorities.collect do |x|
  alpha_table[x[0]]
end

puts "RESULT : #{result.sum}"
