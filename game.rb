class Game
  attr_reader :player_1, :player_2

  def initialize
    greet
    @player_1, @player_2 = initialize_players
    @board = Board.new
    run
  end

  private

  def greet
    puts "Welcome to Tic-Tac-Toe."
  end

  def initialize_players
    puts "Player 1, pick a symbol (X/O):"
    player_1_glyph = gets.chomp
    player_1 = Player.new(glyph: player_1_glyph, number: 1)

    puts "Player 2, pick a symbol (X/O):"
    player_2_glyph = gets.chomp
    player_2 = Player.new(glyph: player_2_glyph, number: 2)

    puts "Player 1, you are #{player_1.glyph}."
    puts "Player 2, you are #{player_2.glyph}."

    return player_1, player_2
  end

  def run
    current_player = @player_1

    while @board.status == :ongoing
      puts @board
      
      get_move(player: current_player)

      # alternate player_number between 1 and 2 on each loop
      current_player = current_player == @player_1 ? @player_2 : @player_1
    end

    # show final board
    puts @board

    declare_status
  end

  def get_move(player: player)
    puts "Player #{player.number} (#{player.glyph}), enter row 0, 1, or 2:"
    row = gets.to_i
    puts "Player #{player.number} (#{player.glyph}), enter column 0, 1, or 2:"
    column = gets.to_i

    @board.mark(player: player, row: row, column: column)
  end

  def declare_status
    victory = "Congratulations, Player #{@board.winner.number}!"
    stalemate = "Stalemate!"

    puts @board.status == :solved ? victory : stalemate
  end
end