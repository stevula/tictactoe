require_relative '../square'

describe Square do
  let(:square) {Square.new}

  it 'has a value' do
    expect(square).to respond_to :value
  end

  describe '#mark(glyph)' do
    it 'assigns the glyph as the value' do
      square.mark("X")
      expect(square.value).to eq "X"
    end
  end
end
