require_relative 'square'

class Board
  attr_reader :winner

  def initialize
    # create 3x3 (2-d) array of Squares
    @board = Array.new(3) {Array.new(3) {Square.new}}
    @winner = nil
  end

  def to_s
    @board.map {|row| puts row.map(&:to_s).join(" ")}
  end

  def status
    if get_winner
      return :solved
    elsif filled?
      return :stalemate
    else
      return :ongoing
    end
  end

  def mark(player: player, row: row, column: column)
    square = @board[row][column]
    square.mark(player)
  end

  private

  def get_winner
    @winner = check_rows || check_columns || check_diagonal || check_diagonal_inverse
  end

  def filled?
    # check if all squares filled
    @board.flatten.none? {|square| square.player.nil?}
  end

  def check_rows(board = @board)
    # return the player if there's a streak in any row
    board.each do |row|
      if row.all? {|square| square.player && square.player == row.first.player}
        return row.first.player
      end
    end

    false
  end

  def check_columns
    check_rows(@board.transpose)
  end

  def check_diagonal(board = @board)
    diagonal = (0..2).collect {|index| board[index][index]}
    if diagonal.all? {|square| square.player && square.player == diagonal.first.player}
      return square.first.player
    end

    false
  end

  def check_diagonal_inverse
    check_diagonal(@board.map(&:reverse))
  end
end