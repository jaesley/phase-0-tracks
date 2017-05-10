# BUSINESS LOGIC

def add_room(house, room)
  return false if house.keys.length == 5
  house[room] = []
  true
end

def add_item(house, room, item)
  house[room] << item
end

house = {}

# USER INTERFACE

def print_house(house)
  puts "-" * 10
  puts "Current house configuration:"
  house.keys.each_with_index do | room, index |
    puts "#{index} - #{room}: #{house[room]}"
  end

  puts "-" * 10
end

can_add_rooms = true

while can_add_rooms
  puts "Type the name of a room to add (or type 'done'):"  
  room = gets.chomp
  break if room == 'done'
  can_add_rooms = add_room(house, room)
  print_house(house)
end

loop do
  puts "Enter the number of the room to add an item to (or type 'done'):"
  input = gets.chomp
  break if input == 'done'
  room_index = input.to_i
  puts "Enter the item to add:"
  item = gets.chomp
  add_item(house, house.keys[room_index], item)
  print_house(house)
end