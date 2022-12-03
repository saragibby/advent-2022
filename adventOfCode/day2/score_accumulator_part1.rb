# https://adventofcode.com/2022/day/2
# input - https://adventofcode.com/2022/day/2/input

# Opponent :
#   Rock (A)
#   Paper (B)
#   Scissors (C)

# Me :
#   Rock (X) - 1pt
#   Paper (Y) - 2pt
#   Scissors (Z) - 3pt

# Game scoring :
#   Lose - 0pt
#   Draw - 3pt
#   Win - 6pt

def round_points(my_play, opponent_play)
  opponent_play_conversion = {
    A: "X",
    B: "Y",
    C: "Z"
  }

  return 3 if my_play == opponent_play_conversion[opponent_play.to_sym]

  return 6 if (my_play == "X" && opponent_play == "C") || 
    (my_play == "Y" && opponent_play == "A") ||
    (my_play == "Z" && opponent_play == "B")
  
  0 # round was lost, no points
end

points = {
  X: 1,
  Y: 2,
  Z: 3
}

fname = './rounds.txt'
lines_read = File.readlines(fname, chomp: true)

my_play_points = 0
my_win_points = 0

lines_read.each do |round| 
  plays = round.split(" ")

  opponent_play = plays[0]
  my_play = plays[1]

  my_play_points += points[my_play.to_sym].to_i
  my_win_points += round_points(my_play, opponent_play)

  puts "--- round: #{my_play} vs #{opponent_play} -- score: #{points[my_play.to_sym].to_i} + #{round_points(my_play, opponent_play)}"
end

puts "My total points: #{my_play_points}"
puts "My win points: #{my_win_points}"
puts "TOTAL: #{my_play_points + my_win_points}"