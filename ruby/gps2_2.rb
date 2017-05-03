# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # split the input string into words
  # add each word to the hash with a default value of 1
  # print the list to the console [can you use one of your other methods here?]
# output: hash

def make_list(item_list)
  item_list = item_list.split(' ')
  list = {}
  item_list.each do | item |
    list[item] = 1
  end
  print_list(list)
  list
end

# Method to add or update an item to a list
# input: list, item name, and optional quantity
# steps: 
  # add item to the list (hash)
    # if quantity is given, set it as quantity
    # otherwise, set quantity as 1
# output: list

def  update_list(list, item_name, quantity=1)
    list[item_name] = quantity
  list
end

# Method to remove an item from the list
# input: list, item name
# steps:
  # find the item in the hash by key
  # delete that key/value pair
# output: list

def remove_item(list, item_name)
  list.delete(item_name)
  list
end

# Method to update the quantity of an item
# input: list, item name, quantity
# steps:
  # find the item in the hash
  # update the value of that key to quantity
# output: list

# def update_item(list, item_name, quantity)
#   if !list.include? item_name
#     puts "Please use 'add_item' method."
#   else
#     list[item_name] = quantity
#   end
#   list
# end

# Method to print a list and make it look pretty
# input: list
# steps: 
  # for each item in list:
    # print the key and the value
# output: list

# GROCERY LIST
# Carrots: 0
# Apples: 0

def print_list(list)
  puts "GROCERY LIST"
  list.each do | item, quantity |
    puts "#{item.capitalize}: #{quantity}"
  end
end

# DRIVER CODE

list = make_list("carrots apples cereal pizza")

update_list(list, "eggs")

remove_item(list, "eggs")

update_list(list, "carrots", 2)

print_list(list)