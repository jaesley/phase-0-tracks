require_relative 'game'

describe Game do
  let(:game) { Game.new("test word") }

  it "stores the input as an array of characters" do
    expect(game.input).to eq ["t", "e", "s", "t", " ", "w", "o", "r", "d"]
  end

  it "stores the guessed_letters with only a space" do
    expect(game.guessed_letters).to eq [" "]
  end

  it "stores the guess_count" do
    expect(game.guess_count).to eq 0
  end

  it "updates guessed_letters when user guesses a letter" do
    game.guess_letter("k")
    expect(game.guessed_letters).to eq [" ", "K"]
  end

  it "throws an error message if user guesses same letter twice" do
    game.guess_letter("k")
    expect(game.guess_letter("k")).to eq false
  end
end