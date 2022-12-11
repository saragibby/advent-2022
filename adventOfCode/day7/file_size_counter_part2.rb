# https://adventofcode.com/2022/day/7
# input - https://adventofcode.com/2022/day/7/input

fname = './dir_commands.txt'
input = File.read(fname)

directories = Hash.new { |h, k| h[k] = [] }

current_dir = []

input.each_line do |line|
  split_line = line.split
  if split_line[0] !~ /\D/
    directories[current_dir.clone] << split_line[0].to_i
  elsif split_line[0] == 'dir'
    new_dir = current_dir.clone.append(split_line[1])
    directories[current_dir.clone] << directories[new_dir]
  elsif split_line[0] == '$' && split_line[1] == 'cd' && split_line[2] == '..'
    current_dir.pop
  elsif split_line[0] == '$' && split_line[1] == 'cd' && split_line[2] =~ /.+/
    current_dir << split_line[2]
  end
end

total_space = 70_000_000
target_free_space = 30_000_000
used_space = directories[['/']].flatten.sum
minimum_to_delete = target_free_space - (total_space - used_space)

puts directories

min_to_delete = directories.map { |_k, v| v.flatten.sum }
                           .select { |size| size >= minimum_to_delete }
                           .min

puts "MIN : #{min_to_delete}"
