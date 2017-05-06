require_relative 'game'

describe Game do
  let(:game) { Game.new("test word") }

  it "stores the words as input" do
    expect(game.guess_count).to eq 0
  end

  it "stores the guessed_letters" do
    expect(game.guessed_letters).to eq []
  end

  it "stores the guess_count" do
    expect(game.guess_count).to eq 0
  end
end