# https://adventofcode.com/2022/day/1

fname = './elf_calorie_items.txt'

lines = File.readlines(fname, chomp: true)
begin_index = 0
total_calories = []
sub_arrays = []

loop do
  elf_items = []
  space_index = lines.index("")

  if space_index.nil?
    break
  end

  elf_items = lines.slice(0, space_index)
  calories = elf_items.inject(0){ |sum, x| sum + x.to_i }

  sub_arrays << elf_items
  puts "-- # food items carried: #{space_index}"
  puts elf_items
  puts "---- total calories: #{calories}"

  lines = lines.slice(space_index + 1, lines.length)
  total_calories << calories
end

puts "***************************"
puts "Total Elves: #{sub_arrays.count}"
puts "Top 3 calories: #{total_calories.sort{ |a, b| b <=> a }[0...3]}"
puts "Top 3 total calories: #{total_calories.sort{ |a, b| b <=> a }[0...3].sum}"
puts "***************************"