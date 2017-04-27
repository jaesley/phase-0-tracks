# METHODS

# SHIFT TO NEXT LETTER.

def shift_letter(letter)

# Store vowels and consonants separately.
  vowels = ["a", "e", "i", "o", "u"]
  consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
  
# Determine if letter is capitalized
  if ('A'..'Z').include?(letter)
    uppercase = true
    letter = letter.downcase
  else
    uppercase = false
  end
  
# If letter is a vowel,

  if vowels.include?(letter)
    
# Return the vowel after the previous one.

    letter = vowels[vowels.index(letter) + 1]
    
# Else if letter is a consonant,
  elsif consonants.include?(letter)
  
# Return the consonant after the previous one.
    letter = consonants[consonants.index(letter) + 1]

# Else letter is probably punctation, so
  else
    
# Return punctuation unchanged.
    letter
  end

# Restore capitalization if necessary.
  if uppercase
    letter = letter.upcase
  else
    letter = letter
  end
end

# MAKE ALIAS

def make_alias(name)
  
# Swap first and last name.
  name = name.split(' ').reverse.join(' ')

# Convert name to array.
  name = name.split('')

# Shift letters to next vowel or consonant.
  name.map! { |letter| shift_letter(letter) }

# Rejoin name.
  name = name.join('')
  
end

# DRIVER CODE

# Get agent name.

puts "What is the agent's name?"
name = gets.chomp

# Perform alias-making method.

aka = make_alias(name)

# Return alias.

puts "#{name} is also known as #{aka}."