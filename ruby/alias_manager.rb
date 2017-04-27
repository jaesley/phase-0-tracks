# METHODS

# Shift to next vowel.

def shift_vowel(name)

# Store vowels.
  vowels = ["a", "e", "i", "o", "u"]

end

# Shift to next consonant.

def shift_consonant(name)
  
# Store consonants.
  consonants = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
end

# Alias maker.
def make_alias(name)
  
# Swap first and last name.
  name = name.split(' ').reverse.join(' ')

# Convert name to array.
  name = name.split('')

# Alias vowels.
  name = vowel_shift(name)

# Alias consonants.
  name = consonant_shift(name)

# Rejoin name.
  name = name.join('')
  
end

# DRIVERS

# Get agent name.

puts "What is the agent's name?"
name = gets.chomp
# Perform alias-making method.

alias = make_alias(name)

# Return alias.

puts "#{name} is also known as #{alias}."