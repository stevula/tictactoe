class Square
  attr_reader :player

  def initialize
    @player = nil
  end

  def mark(glyph)
    @player = glyph
  end

  def to_s
    player ? @player.glyph : "-"
  end
end