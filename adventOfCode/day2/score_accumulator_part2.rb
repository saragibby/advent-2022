# https://adventofcode.com/2022/day/2
# input - https://adventofcode.com/2022/day/2/input

# Opponent :
#   Rock (A)
#   Paper (B)
#   Scissors (C)

# I need to end the game with :
#   Lose (X)
#   Draw (Y) 
#   Win (Z) 

# Game scoring :
#   Lose - 0pt
#   Draw - 3pt
#   Win - 6pt

def get_my_play_points(opponent_play, end_of_round)  
  # Draw
  if end_of_round == "Y"
    return 1 if opponent_play == "A"
    return 2 if opponent_play == "B"
    return 3 if opponent_play == "C"
  end

  # Lose
  if end_of_round == "X"
    return 1 if opponent_play == "B"
    return 2 if opponent_play == "C"
    return 3 if opponent_play == "A"
  end

  # Win
  if end_of_round == "Z"
    return 1 if opponent_play == "C"
    return 2 if opponent_play == "A"
    return 3 if opponent_play == "B"
  end
end

game_end_points = {
  X: 0,
  Y: 3,
  Z: 6
}

fname = './rounds.txt'
lines_read = File.readlines(fname, chomp: true)

my_play_points = 0
my_win_points = 0

lines_read.each do |round| 
  plays = round.split(" ")

  opponent_play = plays[0]
  end_of_round = plays[1]

  my_play_points += get_my_play_points(opponent_play, end_of_round)
  my_win_points += game_end_points[end_of_round.to_sym].to_i

  puts "--- #{opponent_play} - #{end_of_round} --- my play points: #{my_play_points} -- end score points: #{game_end_points[end_of_round.to_sym].to_i}"
end

puts "My total points: #{my_play_points}"
puts "My win points: #{my_win_points}"
puts "TOTAL: #{my_play_points + my_win_points}"