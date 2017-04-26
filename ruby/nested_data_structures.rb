books = {
  fiction: {
    science_fiction: {
      "Mira Grant" => [
        'Feed'],
        
      "James S. A. Corey" => [
        'Leviathan Wakes',
        'Caliban\'s War'
        ]
    },
    
    fantasy: {
      "Django Wexler" => [
        'The Thousand Names'],
        
      "Neil Gaiman" => [
        'American Gods',
        'Anansi Boys',
        'Neverwhere',
        'The Ocean at the End of the Lane'
        ]
    },
    
    teen: {
      "Scott Westerfeld" => [
        'Uglies',
        'Pretties'
        ],
        
        "Markus Zuzak" => [
          'The Book Thief']
    }
  },
  
  nonfiction: {
    travel: {
      "Bill Bryson" => [
        'In a Sunburned Country',
        'Notes from a Small Island',
        'A Walk in the Woods',
        'I\'m a Stranger Here Myself'
        ]
    }
  }
}

# Print an array from within a nest of hashes.
puts "Books by Neil Gaiman:"
puts books[:fiction][:fantasy]["Neil Gaiman"]

# Print a hash from within a hash.
puts "\nTeen Books:"
puts books[:fiction][:teen]

# Print an item from within an array within hashes.
puts "\nScott Westerfeld's second book:"
puts books[:fiction][:teen]["Scott Westerfeld"][1]

# Add an item to a nested data structure.
books[:nonfiction][:travel]["Bill Bryson"].push('The Lost Continent')
puts "\nBooks by Bill Bryson:"
puts books[:nonfiction][:travel]["Bill Bryson"]

# Add a category to a nested data structure.
books[:nonfiction][:linguistics] = {"Bill Bryson" => ['The Mother Tongue']}
puts "\nLinguistics Books by Bill Bryson:"
puts books[:nonfiction][:linguistics]["Bill Bryson"]