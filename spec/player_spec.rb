require_relative '../player'

describe Player do
  let(:player) {Player.new(glyph: "O")}

  it 'has a glyph' do
    expect(player.glyph).to eq "O"
  end
end