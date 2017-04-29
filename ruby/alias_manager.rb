# SHIFT LETTER

# method shift_letter(letter)
  # store hash of shifts
  # return:
    # the shifted letter if letter is downcase
    # the shifted capital letter if letter is upcase
    # the letter if letter is actually punctuation
  # (This approach solves for nonstandard capitalization
  # ie "bell hooks" or "Andrew McMahon" or "Ludwig van Beethoven")
# end
  
def shift_letter(letter)
  key = {"a" => "e", "b" => "c", "c" => "d", "d" => "f", "e" => "i", 
         "f" => "g", "g" => "h", "h" => "j", "i" => "o", "j" => "k", 
         "k" => "l", "l" => "m", "m" => "n", "n" => "p", "o" => "u", 
         "p" => "q", "q" => "r", "r" => "s", "s" => "t", "t" => "v", 
         "u" => "a", "v" => "w", "w" => "x", "x" => "y", "y" => "z", 
         "z" => "b"}
  
  if ('a'..'z').include? letter
    return key[letter]
  elsif ('A'..'Z').include? letter
    return key[letter.downcase].upcase
  else
    return letter
  end
end

# MAKE ALIAS

# method make_alias(name)
  # swap order of names
  # split swapped name into array of letters
  # shift each letter
  # rejoin name
#end

def make_alias(name)
  name = name.split(' ').reverse.join(' ').split('')
  name.map! { |letter| shift_letter(letter) }
  name = name.join('')
end

# HASH ALIASES

#method hash_alias()
  # Start loop.
    # get name from user
      # break loop if 'quit'
    # make alias for name
    # store name and alias in hash
    # print name and alias
    # return hash
# end

def hash_alias()
  hash = {}
  loop do
    puts "\nAgent name:"
    name = gets.chomp
    
    break if name == "quit"
    
    aka = make_alias(name)
    
    hash[name] = aka
    
    puts "#{name} is also known as #{aka}."
  end
  
  hash.each do | name, aka |
    print "\n#{name} is also known as #{aka}."
  end
end

hash_alias()