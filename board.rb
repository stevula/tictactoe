require_relative 'square'

class Board
  def initialize
    # create 3x3 (2-d) array of Squares
    @board = Array.new(3) {Array.new(3) {Square.new}}
  end

  def to_s
    @board.each do |row|
      puts row.map(&:to_s).join(" ")
      puts
    end
  end

  def status
    if solved?
      return :solved
    elsif filled?
      return :stalemate
    else
      return :ongoing
    end
  end

  def mark(player: player, row: row, column: column)
    square = @board[row][column]
    square.mark(player.glyph)
  end

  private

  def filled?
    # true if all squares filled, false if any nil values on board
    @board.flatten.none? {|square| square.value.nil?}
  end

  def solved?
    check_rows || check_columns || check_diagonal || check_diagonal_inverse
  end

  def check_rows(board = @board)
    # return the value if there's a streak in any row
    board.each do |row|
      if row.all? {|square| square.value && square.value == row.first.value}
        return row.first.value
      end
    end

    false
  end

  def check_columns
    check_rows(@board.transpose)
  end

  def check_diagonal(board = @board)
    diagonal = (0..2).collect {|index| board[index][index]}
    if diagonal.all? {|square| square.value && square.value == diagonal.first.value}
      return square.first.value
    end

    false
  end

  def check_diagonal_inverse
    check_diagonal(@board.map(&:reverse))
  end
end