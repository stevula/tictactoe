class Square
  attr_reader :value

  def initialize
    @value = nil
  end

  def mark(glyph)
    @value = glyph
  end

  def to_s
    value ? @value.to_s : "-"
  end
end