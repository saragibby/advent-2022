# https://adventofcode.com/2022/day/4
# input - https://adventofcode.com/2022/day/4/input

fname = './elves_assignments.txt'
lines_read = File.readlines(fname, chomp: true)
overlapping_assigments = 0

lines_read.each do |assignment|
  elf_1_assignment = assignment.split(',')[0]
  elf_2_assignment = assignment.split(',')[1]

  elf_1_sections = (elf_1_assignment.split('-')[0]..elf_1_assignment.split('-')[1]).to_a
  elf_2_sections = (elf_2_assignment.split('-')[0]..elf_2_assignment.split('-')[1]).to_a

  overlapping_assigments += 1 if (elf_1_sections - elf_2_sections).empty? || (elf_2_sections - elf_1_sections).empty?
  if (elf_1_sections - elf_2_sections).empty? || (elf_2_sections - elf_1_sections).empty?
    puts "overlap --- #{elf_1_assignment} - #{elf_2_assignment}"
  end
end

puts '****************'
puts "Total overlapping assignments: #{overlapping_assigments}"
