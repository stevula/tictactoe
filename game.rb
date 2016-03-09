class Game
  attr_reader :player_1, :player_2

  def initialize
    greet
    initialize_players
    @board = Board.new
    run
  end

  private

  def greet
    puts "Welcome to Tic-Tac-Toe."
  end

  def initialize_players
    @player_1 = Player.new(number: 1)
    @player_2 = Player.new(number: 2)

    get_player_symbol(@player_1)
    get_player_symbol(@player_2)

    puts "Player 1, you are #{@player_1.glyph}."
    puts "Player 2, you are #{@player_2.glyph}."
  end

  def get_player_symbol(player)
    puts "Player #{player.number}, pick a symbol (X/O/etc.):"

    # prevent nil or empty string input
    while player.glyph.to_s == ""
      player.glyph = gets.chomp
      puts "Please enter a character!" if player.glyph.to_s == ""
    end
  end

  def run
    current_player = @player_1

    while @board.status == :ongoing
      puts @board
      
      get_move(current_player)

      # alternate player_number between 1 and 2 on each loop
      current_player = current_player == @player_1 ? @player_2 : @player_1
    end

    # show final board
    puts @board

    # declare winner or stalemate
    declare_status
  end

  def get_move(player)
    # loop until unmarked square is chosen
    loop do
      puts "Player #{player.number} (#{player.glyph}), enter row 0, 1, or 2:"
      row = gets.to_i
      puts "Player #{player.number} (#{player.glyph}), enter column 0, 1, or 2:"
      column = gets.to_i

      return if @board.mark(player: player, row: row, column: column)

      puts "Cannot select a square that has already been marked!"
    end
  end

  def declare_status
    victory = "Congratulations, Player #{@board.winner.number}!"
    stalemate = "Stalemate!"

    puts @board.status == :solved ? victory : stalemate
  end
end