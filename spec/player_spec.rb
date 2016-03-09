require_relative '../player'

describe Player do
  let(:player) {Player.new(number: 1)}

  it 'has a glyph' do
    player.glyph = "O"
    expect(player.glyph).to eq "O"
  end
end