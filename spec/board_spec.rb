require_relative '../board'
require_relative '../player'

describe Board do
  let(:board) {Board.new}
  let(:player_1) {Player.new("O")}
  let(:player_2) {Player.new("X")}

  describe '#mark(player, row, column)' do
    it 'assigns the player\'s glyph to the square at x, y' do
      board.mark(player_1, 0, 0)
      expect(board.to_s[0][0].value).to eq player_1.glyph
    end
  end

  describe '#status' do
    it 'returns solved when the board is won' do
      # O O O
      # - - -
      # - - -
      board.mark(player_1, 0, 0)
      board.mark(player_1, 0, 1)
      board.mark(player_1, 0, 2)
      expect(board.status).to be :solved
    end

    it 'returns stalemate when the board is full but no winner' do
      # O X O
      # X X O
      # O O X
      board.mark(player_1, 0, 0)
      board.mark(player_2, 0, 1)
      board.mark(player_1, 0, 2)
      board.mark(player_2, 1, 0)
      board.mark(player_2, 1, 1)
      board.mark(player_1, 1, 2)
      board.mark(player_1, 2, 0)
      board.mark(player_1, 2, 1)
      board.mark(player_2, 2, 2)
      expect(board.status).to be :stalemate
    end

    it 'returns ongoing when there is neither a winner nor a stalemate' do
      # O X O
      # X X O
      # - - -
      board.mark(player_1, 0, 0)
      board.mark(player_2, 0, 1)
      board.mark(player_1, 0, 2)
      board.mark(player_2, 1, 0)
      board.mark(player_2, 1, 1)
      board.mark(player_1, 1, 2)
      expect(board.status).to be :ongoing
    end
  end
end