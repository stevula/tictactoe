class Square
  attr_reader :player

  def initialize
    @player = nil
  end

  def mark(player)
    @player = player unless @player
  end

  def to_s
    player ? @player.glyph : "-"
  end
end