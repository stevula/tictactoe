require_relative '../square'
require_relative '../player'

describe Square do
  let(:square) {Square.new}
  let(:player_1) {Player.new(number: 1)}
  let(:player_2) {Player.new(number: 2)}

  describe '#player' do
    it 'returns the player who marked the square' do
      expect(square).to respond_to :player
    end
  end

  describe '#mark(player)' do
    before(:each) {square.mark(player_1)}

    it 'assigns the player as the value' do
      expect(square.player).to be player_1
    end

    it 'does not allow a player to mark it if it is already marked' do
      square.mark(player_2)
      expect(square.player).to be player_1
    end
  end
end
