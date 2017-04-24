# METHODS

# Set up blank hash.

client = {
  :name => "",
  :age => "",
  :children => "",
  :theme => "",
  :budget => "",
  :approval => "",
  :hgtv => ""
}

# DRIVER CODE

# Update user-entered variables for hash.

puts "What is the client's name?"

client[:name] = gets.chomp

puts "What is the client's age?"

client[:age] = gets.chomp

puts "What is the client's number of children?"

client[:children] = gets.chomp

puts "What is the client's decor theme?"

client[:theme] = gets.chomp

puts "What is the client's budget?"

client[:budget] = gets.chomp

puts "Did the client approve the design sketches? (y/n)"

client[:approval] = gets.chomp

# Force y/n answer.

until client[:approval] == "y" || client[:approval] == "n"
  puts "Please enter 'y' or 'n'. Did the client approve the design sketches?"
  client[:approval] = gets.chomp
end

# Convert to boolean.

if client[:approval] == "y"
  client[:approval] == true
else 
  client[:approval] == false
end

puts "Is this redecoration going to be on HGTV? (y/n)"

client[:hgtv] = gets.chomp

# Force y/n answer.

until client[:hgtv] == "y" || client[:hgtv] == "n"
  puts "Please enter 'y' or 'n'. Is this redecoration going to be on HGTV?"
  client[:approval] = gets.chomp
end

# Convert to boolean.

if client[:hgtv] == "y"
  client[:hgtv] == true
else 
  client[:hgtv] == false
end

puts client