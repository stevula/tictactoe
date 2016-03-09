class Player
  attr_reader :glyph, :number

  def initialize(glyph: glyph, number: number)
    # e.g. "X" || "O"
    @glyph = glyph
    @number = number
  end
end