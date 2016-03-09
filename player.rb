class Player
  attr_reader :number
  attr_accessor :glyph

  def initialize(number: number)
    # e.g. "X" || "O"
    @glyph = glyph
    @number = number
  end
end