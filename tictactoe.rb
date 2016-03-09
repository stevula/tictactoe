require_relative 'board'
require_relative 'square'
require_relative 'player'

board = Board.new

current_player = board.player_1
while board.status == :ongoing
  puts board
  puts "Player #{current_player.number} (#{current_player.glyph}), enter row 0, 1, or 2:"
  row_number = gets.to_i

  puts "Player #{current_player.number} (#{current_player.glyph}), enter column 0, 1, or 2:"
  column_number = gets.to_i

  board.mark(player: current_player, row: row_number, column: column_number)

  # alternate player_number between 1 and 2 on each loop
  current_player = current_player == board.player_1 ? board.player_2 : board.player_1
end

puts board

if board.status == :solved
 puts "Congratulations, Player #{board.winner.number}!"
end

if board.status == :stalemate
  puts "Stalemate!"
end

# prevent player from picking an already marked space
# prevent player from choosing the same glyph as another player
# check for stalemate before board is filled
# victory/loss/stalemate messages
