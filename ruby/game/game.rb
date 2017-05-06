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

#   method convert_input(input)
#     store input_conversion as empty array
#     for each character of input_blanks
#       when character is space
#         print two spaces
#       when guessed_letters includes character
#         print letter + space
#       end loop
#       return input_conversion
#   end method

class Game
  attr_accessor :guess_count, :input, :input_conversion, :guessed_letters

  def initialize(input)
      @guess_count = 0
      @input = input.split('')
      @guessed_letters = [" "]
      puts "Starting a new game...."
  end
end

#   method print_input(input)
  # for each character in input
  #   print character + space
  # end loop
# end method

  def print_input(input, guessed_letters)
    input.each do | character |
      if guessed_letters.include? character
        print character + " "
      else
        print "_ "
      end
    end
  end

#   method guess_letter
#     if input contains that letter and it has not been guessed yet
#       get index of the corresponding blank
#       convert that blank to letter
#       store guessed letter in guessed_letters array
#       print success message
#       print_input(input)
#       increment guess_count by 1
#     else
#       return give_up message
#     end if


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
# start loop
#   ask user for letter
#   break when guess_count = input length
# end loop

