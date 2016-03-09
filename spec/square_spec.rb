require_relative '../square'

describe Square do
  let(:square) {Square.new}

  describe '#player' do
    it 'returns the player who marked the square' do
      expect(square).to respond_to :player
    end
  end

  describe '#mark(glyph)' do
    it 'assigns the glyph as the value' do
      player = "Player_X"
      square.mark(player)
      expect(square.player).to eq player
    end

    it 'does not allow a player to mark it if it is already marked' do
      pending
    end
  end
end
