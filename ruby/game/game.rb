class game
  method initialize(input)
    print start message
    if string_val is true:
      store instance variable guess_count as 0
      store instance variable input
      convert(input)
      store instance variable guessed_letters as empty array
      initialize instance
      end loop
    else
      return error message asking for better input
    end if
  end method

  method string_val(input)
    for each character of input
      if character is not a letter or space
        return false
      else 
        return true
      end if
    end loop
  end method

  method print_input(input)
    for each character of input_blanks
      when character is space
        print two spaces
      when guessed_letters includes character
        print letter + space
  end method

  method guess_letter
    if input contains that letter and it has not been guessed yet
      get index of the corresponding blank
      convert that blank to letter
      store guessed letter in guessed_letters array
      print success message
      print_input(input)
      increment guess_count by 1
    else
      return give_up message
    end if


end class

# Driver Code

get user input for word
initialize new game instance with input

start loop
  ask user for letter
  break when guess_count = input length
end loop

