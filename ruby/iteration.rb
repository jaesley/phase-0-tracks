def hello_world
  puts "Hello world"
  yield("Jae", "Jarred")
  puts "Goodbye world."
end

hello_world { |name1, name2| puts "Welcome to Ruby, #{name1} and #{name2}." }

# Array

landmarks = ["Space Needle", "Pike Place Market", "Fremont Troll"]

landmarks.each do |landmark|
  puts "Today we visited #{landmark}."
end

landmarks.map! do |landmark|
  landmark.downcase
end

puts landmarks

# Hash

menu = {:breakfast => "scrambled eggs", :lunch => "PB&J", :dinner => "steak"}

menu.each do |meal, food|
  puts "For #{meal} we ate #{food}."
end

# Release 2

numbers = [2, 4, 6, 8]
# numbers.delete_if { |number| number < 5 }
# puts numbers

numbers = [2, 4, 6, 8, 1, 3]
# puts numbers.select { |number| number < 5 }

# puts numbers.reject { |number| number < 5 }

# puts numbers.drop_while { |number| number < 5 }

hash = {"a" => 1, "b" => 2, "c" => 3, "d" => 4}

# hash.delete_if { |letter, number| number > 3 }

# puts hash.select { |letter, number| number < 2 }

puts hash.reject { |letter, number| number < 2 }