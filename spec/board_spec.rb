require_relative '../board'
require_relative '../player'

describe Board do
  let(:board) {Board.new}
  player_1 = Player.new(number: 1)
  player_2 = Player.new(number: 2)
  player_1.glyph = "O"
  player_2.glyph = "X"

  describe '#status' do
    it 'returns solved when there is a horizontal streak' do
      # O O O
      # - - -
      # - - -
      board.mark(player: player_1, row: 1, column: 1)
      board.mark(player: player_1, row: 1, column: 2)
      board.mark(player: player_1, row: 1, column: 3)
      expect(board.status).to be :solved
    end

    it 'returns solved when there is a vertical streak' do
      # O - -
      # O - -
      # O - -
      board.mark(player: player_1, row: 1, column: 1)
      board.mark(player: player_1, row: 2, column: 1)
      board.mark(player: player_1, row: 3, column: 1)
      expect(board.status).to be :solved
    end

    it 'returns solved when there is a diagonal streak' do
      # O - -
      # - O -
      # - - O
      board.mark(player: player_1, row: 1, column: 1)
      board.mark(player: player_1, row: 2, column: 2)
      board.mark(player: player_1, row: 3, column: 3)
      expect(board.status).to be :solved
    end

    it 'returns solved when there is a diagonal (inverse) streak' do
      # - - O
      # - O -
      # O - -
      board.mark(player: player_1, row: 1, column: 3)
      board.mark(player: player_1, row: 2, column: 2)
      board.mark(player: player_1, row: 3, column: 1)
      expect(board.status).to be :solved
    end

    it 'returns stalemate when the board is full with no winner' do
      # O X O
      # X X O
      # O O X
      board.mark(player: player_1, row: 1, column: 1)
      board.mark(player: player_2, row: 1, column: 2)
      board.mark(player: player_1, row: 1, column: 3)
      board.mark(player: player_2, row: 2, column: 1)
      board.mark(player: player_2, row: 2, column: 2)
      board.mark(player: player_1, row: 2, column: 3)
      board.mark(player: player_1, row: 3, column: 1)
      board.mark(player: player_1, row: 3, column: 2)
      board.mark(player: player_2, row: 3, column: 3)
      expect(board.status).to be :stalemate
    end

    it 'returns ongoing when there is neither a winner nor a stalemate' do
      # O X O
      # X X O
      # - - -
      board.mark(player: player_1, row: 1, column: 1)
      board.mark(player: player_2, row: 1, column: 2)
      board.mark(player: player_1, row: 1, column: 3)
      board.mark(player: player_2, row: 2, column: 1)
      board.mark(player: player_2, row: 2, column: 2)
      board.mark(player: player_1, row: 2, column: 3)
      expect(board.status).to be :ongoing
    end
  end
end