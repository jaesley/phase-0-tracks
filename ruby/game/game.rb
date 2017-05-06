# method string_val(input)
#   for each character of input
#     if character is not a letter or space
#       return false
#     else 
#       return true
#     end if
#   end loop
# end method

# def string_val(input)
#   input = input.split('')
#   input.each do |character|
#     puts character
#   end
#   return true
# end

# class game
#   method initialize(input)
#     if string_val is true:
#       store instance variable guess_count as 0
#       store instance variable input
#       store instance variable input_conversion as convert(input)
#       store instance variable guessed_letters as empty array
#       initialize instance
#     else
#       return error message asking for better input
#     end if
#   end method

class Game
  attr_accessor :input, :guessed_letters, :game_lose, :game_win

  def initialize(input)
      @input = input.upcase.split('')
      @guessed_letters = [" "]
      @game_lose = false
      @game_win = false
      puts "Starting a new game...."
      print_input(@input)
  end

  #   method print_input(input)
    # for each character in input
    #   print character + space
    # end loop
  # end method

  def print_input(input)
    input.each do | character |
      if @guessed_letters.include? character
        print character + " "
      else
        print "_ "
      end
    end
    print "\n"
    end

  # method guess_letter(letter)
  #   add letter to guessed_letters array
  #   print_input
  #   return guessed_letters
  # end method

  def guess_letter(letter)
    # if @guessed_letters.include? letter
    #   puts "You already guessed '#{letter}' but I won't hold it against you. This time."
    #   return false
    # end
    puts "You guessed '#{letter}'."
    @guessed_letters << letter.upcase
    print_input(@input)
    @game_lose = lose_game?
    @guessed_letters.uniq!
  end

  # method end_game?
  #   return true if:
  #     @guessed_letters includes all the letters of input
  #     @guessed_letters contains input
  #     @guessed_letters.length - 1 equals input.length
  #   else
  #     return false
  # end method

  def lose_game?
    if @guessed_letters.length - 1 == input.length
      return true
     else
      return false
    end
  end

  def win_game?
    if @guessed_letters.include? @input.join('')
      return true
    end

    @input.uniq.each do |character|
      if !@guessed_letters.include? character
        return false
      end
    end

    return true
  end

# end class
end

# DRIVER CODE

# puts "Pick a word to start a game."
# input = gets.chomp

# game = Game.new(input)

# loop do
#   break if game.guessed_letters.length - 1 == game.input.length
#   puts "Pick a letter."
#   letter = gets.chomp
#   game.guess_letter(letter)
# end