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
