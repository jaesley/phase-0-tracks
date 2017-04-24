# METHODS

# Set up blank hash.

client = {
  :name => ""
  :age => ""
  :children => ""
  :theme => ""
  :budget => ""
  :approval => ""
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

puts "Did the client approve the design sketches?"

client[:approval] = gets.chomp

puts "Is this redecoration going to be on HGTV?"

client[:hgtv] = gets.chomp