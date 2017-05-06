require_relative 'game'

describe Game do
  let(:game) { Game.new("test word") }

  it "stores the input as an array of characters" do
    expect(game.input).to eq ["T", "E", "S", "T", " ", "W", "O", "R", "D"]
  end

  it "stores the guessed_letters with only a space" do
    expect(game.guessed_letters).to eq [" "]
  end

  it "updates guessed_letters when user guesses a letter" do
    game.guess_letter("k")
    expect(game.guessed_letters).to eq [" ", "K"]
  end

  it "ends the game if you guess more times than there are letters" do
    game = Game.new("th")
    game.guess_letter("g")
    game.guess_letter("h")
    expect(game.lose_game?).to eq true
  end

  it "wins the game if you guess the word" do
    game.guess_letter("test word")
    expect(game.win_game?).to eq true
  end

  it "wins the game if you guess all the letters" do
    game = Game.new("th")
    game.guess_letter("t")
    game.guess_letter("h")
    expect(game.win_game?).to eq true
  end
end