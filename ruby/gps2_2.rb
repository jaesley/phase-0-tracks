# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # split the input string into words
  # add each word to the hash with a default value of 0
  # print the list to the console [can you use one of your other methods here?]
# output: hash

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: 
  # add item to the list (hash)
    # if quantity is given, set it as quantity
    # otherwise, set quantity as 0
# output: list

# Method to remove an item from the list
# input: list, item name
# steps:
  # find the item in the hash by key
  # delete that key/value pair
# output: list

# Method to update the quantity of an item
# input: list, item name, quantity
# steps:
  # find the item in the hash
  # update the value of that key to quantity
# output: list

# Method to print a list and make it look pretty
# input: list
# steps: 
  # for each item in list:
    # print the key and the value
# output: list