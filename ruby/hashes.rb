# METHODS

# Convert to Boolean

# method make_bool(input)
  # Return:
  #   true if input is "y"
  #   false if input is "n"
# end method

def make_bool(input)
  if input == "y"
    return true
  end
  
  return false
end

# Repeat Input to Force Boolean

# method repeat(hash, key, question)
#   start loop
#     print question
#     get input for key
#     if key is "y" or "n"
#       convert key to boolean
#       break loop
#     end if
#   end loop
# end method

def repeat(hash, key, question)
  loop do
    puts question
    hash[key] = gets.chomp

    if hash[key] == "y" || hash[key] == "n"
      hash[key] = make_bool(hash[key])
      break
    end
  end
end
# Add Client

# method add_client()
  # get client name
  # get client age as integer
  # get number of children as integer
  # get decor theme
  # get budget as integer
  # get approval status
    # convert to boolean
  # get hgtv status
    # convert to boolean
  # check if any key needs to be updated
# end method

def add_client()
  client = {}
  
  puts "What is the client's name?"
  client[:name] = gets.chomp

  puts "What is the client's age?"
  client[:age] = gets.chomp.to_i

  puts "What is the client's number of children?"
  client[:children] = gets.chomp.to_i

  puts "What is the client's decor theme?"
  client[:theme] = gets.chomp

  puts "What is the client's budget?"
  client[:budget] = gets.chomp

  repeat(client, "approval", "Did the client approve the design sketches? (y/n)")

  repeat(client, "hgtv", "Is this redecoration going to be on HGTV? (y/n)")
  
  client.each do | key, value |
    puts "#{key}: #{value}"
  end

  update(client)

  client.each do | key, value |
    puts "#{key}: #{value}"
  end
end

# Update Key

# method update(client)
#   get key to update
#     break if none
#   update key
#   correct return type if necessary
#   return updated hash
# end method

def update(hash)
  puts "Which key needs updating? Enter 'none' if all are correct."
  key = gets.chomp

  if key != "none"
      if key == "age" || key == "children" || key == "budget"
        puts "What is the correct value for key #{key}?"
        hash[key.to_sym] = gets.chomp.to_i
      elsif key == "approval" || key == "hgtv"
        repeat(hash, key, "What is the correct value for key #{key}?")
      else
        puts "What is the correct value for key #{key}?"
        hash[key.to_sym] = gets.chomp
      end
  end
  return hash
end

add_client