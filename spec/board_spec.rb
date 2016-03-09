require_relative '../board'
require_relative '../player'

describe Board do
  let(:board) {Board.new}
  let(:player_1) {Player.new(glyph: "O", number: 1)}
  let(:player_2) {Player.new(glyph: "X", number: 2)}

  describe '#status' do
    it 'returns solved when the board is won' do
      # O O O
      # - - -
      # - - -
      board.mark(player: player_1, row: 0, column: 0)
      board.mark(player: player_1, row: 0, column: 1)
      board.mark(player: player_1, row: 0, column: 2)
      expect(board.status).to be :solved
    end

    it 'returns stalemate when the board is full but no winner' do
      # O X O
      # X X O
      # O O X
      board.mark(player: player_1, row: 0, column: 0)
      board.mark(player: player_2, row: 0, column: 1)
      board.mark(player: player_1, row: 0, column: 2)
      board.mark(player: player_2, row: 1, column: 0)
      board.mark(player: player_2, row: 1, column: 1)
      board.mark(player: player_1, row: 1, column: 2)
      board.mark(player: player_1, row: 2, column: 0)
      board.mark(player: player_1, row: 2, column: 1)
      board.mark(player: player_2, row: 2, column: 2)
      expect(board.status).to be :stalemate
    end

    it 'returns ongoing when there is neither a winner nor a stalemate' do
      # O X O
      # X X O
      # - - -
      board.mark(player: player_1, row: 0, column: 0)
      board.mark(player: player_2, row: 0, column: 1)
      board.mark(player: player_1, row: 0, column: 2)
      board.mark(player: player_2, row: 1, column: 0)
      board.mark(player: player_2, row: 1, column: 1)
      board.mark(player: player_1, row: 1, column: 2)
      expect(board.status).to be :ongoing
    end
  end
end