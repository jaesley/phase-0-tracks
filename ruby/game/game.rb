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

#     method print_input(input)
#     for each character in input
#       print character + space
#     end loop
#   end method

#   method guess_letter(letter)
#     add letter to guessed_letters array
#     print_input
#     return guessed_letters
#   end method

#   method end_game?
#     return true if:
#       @guessed_letters includes all the letters of input
#       @guessed_letters contains input
#       @guessed_letters.length - 1 equals input.length
#     else
#       return false
#   end method
  
# end class

class Game
  attr_accessor :input, :guessed_letters

  def initialize(input)
      @input = input.upcase.split('')
      @guessed_letters = [" "]
      puts "Starting a new game...."
      print_input(@input)
  end

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

  def guess_letter(letter)
    puts "You guessed '#{letter}'."
    @guessed_letters << letter.upcase
    print_input(@input)
    @game_lose = lose_game?
    @guessed_letters.uniq!
  end

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
end

# DRIVER CODE

puts "Pick a word to start a game."
input = gets.chomp

game = Game.new(input)

loop do
  puts "Pick a letter."
  letter = gets.chomp
  game.guess_letter(letter)
  if game.lose_game? == true || game.win_game? == true
    break
  end
end

if game.win_game? == true
  puts "You win... this time."
else
  puts "Ha! You lose!"
end