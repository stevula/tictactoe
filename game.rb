class Game
  attr_reader :player_1, :player_2

  def initialize
    greet
    initialize_players
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

    # prevent player 2 from choosing same glyph as player 1
    while @player_2.glyph.to_s == "" || @player_2.glyph == @player_1.glyph
      if @player_2.glyph == @player_1.glyph
        @player_2.glyph = nil
        puts "Please enter a different symbol from Player 1!"
      end

      get_player_symbol(@player_2)
    end

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
    @board = Board.new
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

    # replay option
    replay_or_abort
  end

  def get_move(player)
    # loop until unmarked square is chosen
    loop do
      row    = get_coords(player: player, option: row)
      column = get_coords(player: player, option: column)

      return if @board.mark(player: player, row: row, column: column)

      puts "Cannot select a square that has already been marked!"
    end
  end

  def get_coords(player: player, option: row_or_column)
    puts "Player #{player.number} (#{player.glyph}), enter #{option} 1, 2, or 3:"
    position = gets.chomp

    until ("1".."3").to_a.include? position
      puts "Please select valid #{option} number!"
      position = gets.chomp
    end

    position.to_i
  end

  def declare_status
    victory = "Congratulations, Player #{@board.winner.number if @board.winner}!"
    stalemate = "Stalemate!"

    puts @board.status == :solved ? victory : stalemate
  end

  def replay_or_abort
    puts "Would you like to play again? (Y/N)"
    response = gets.chomp
    response.upcase == "Y" ? run : abort("Thanks for playing!")
  end
end