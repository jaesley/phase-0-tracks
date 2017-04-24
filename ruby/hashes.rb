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

# Get client's name.
puts "What is the client's name?"
client[:name] = gets.chomp

# Get client's age and convert to integer.

puts "What is the client's age?"
client[:age] = gets.chomp.to_i

# Get client's number of children and convert to integer.

puts "What is the client's number of children?"
client[:children] = gets.chomp.to_i

# Get client's decor theme.

puts "What is the client's decor theme?"
client[:theme] = gets.chomp

# Get client's budget and convert to integer.

puts "What is the client's budget?"
client[:budget] = gets.chomp.to_i

# Check client's approval status.

puts "Did the client approve the design sketches? (y/n)"
client[:approval] = gets.chomp

# Force y/n answer.

until client[:approval] == "y" || client[:approval] == "n"
  puts "Please enter 'y' or 'n'. Did the client approve the design sketches?"
  client[:approval] = gets.chomp
end

# Convert to boolean.

if client[:approval] == "y"
  client[:approval] = true
else 
  client[:approval] = false
end

# Check if design will be featured on HGTV.

puts "Is this redecoration going to be on HGTV? (y/n)"
client[:hgtv] = gets.chomp

# Force y/n answer.

until client[:hgtv] == "y" || client[:hgtv] == "n"
  puts "Please enter 'y' or 'n'. Is this redecoration going to be on HGTV?"
  client[:hgtv] = gets.chomp
end

# Convert to boolean.

if client[:hgtv] == "y"
  client[:hgtv] = true
else 
  client[:hgtv] = false
end

# Print client info.

puts client

# Check if key needs updating.

puts "Which key should be updated? If all keys are correct, enter 'none'."
key = gets.chomp

# If not 'none', get corrected key value.

if key != "none"
  puts "What is the corrected value for key \"#{key}\"?"
  client[key.to_sym] = gets.chomp
end

# Reconvert data type if necessary.
if key = "age" || key == "children" || key == "budget"
  client[key.to_sym] = client[key.to_sym].to_i
end

if ( key == "hgtv" || key == "approval" ) && client[key.to_sym] == "y"
  client[key.to_sym] = true
end

if ( key == "hgtv" || key == "approval" ) && client[key.to_sym] == "n"
  client[key.to_sym] = false
end

puts client