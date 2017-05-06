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
  attr_accessor :guess_count, :input, :input_conversion, :guessed_letters

  def initialize(input)
      @guess_count = 0
      @input = input.split('')
      @guessed_letters = [" "]
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
    puts "You guessed '#{letter}'."
    @guessed_letters << letter.upcase
    print_input(@input)
    @guessed_letters.uniq!
    @guess_count += 1
  end
end


# end class


# # Driver Code

# start loop
#   get user input for word
#   if string_val == true
#     initialize new game instance with input
#   else
#     puts "Your word(s) should only contain letters and spaces. Try again."
# end loop

# loop do
  puts "Pick a word to start a game."
  input = gets.chomp.upcase
#   break if string_val(input) == true
#   puts "Your word should contain only letters and spaces. Try again, loser."
# end

game = Game.new(input)

game.guess_letter("e")
# start loop
#   ask user for letter
#   break when guess_count = input length
# end loop

