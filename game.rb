class Game
  attr_reader :player_1, :player_2, :winner

  def initialize
    greet
    @player_1, @player_2 = initialize_players
    @winner = nil
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
end