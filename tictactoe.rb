require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'square'

game = Game.new


# prevent player from picking an already marked space
# prevent player from choosing the same glyph as another player
# check for stalemate before board is filled
# victory/loss/stalemate messages
