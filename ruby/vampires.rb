puts "What is  your name?"

name = gets.chomp

puts "How old are you?"

age = gets.chomp

puts "What year were you born?"

birthyear = gets.chomp

puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"

garlic = gets.chomp

until garlic = "y" || garlic = "n"
	puts "Please use 'y' or 'n'. Now, should we order some garlic bread?"
	garlic = gets.chomp
end

puts "Would you like to enroll in the company's health insurance? (y/n)"

insurance = gets.chomp

until insurance = "y" || insurance = "n"
	puts "Please use 'y' or 'n'. Now, would you like to enroll?"
	insurance = gets.chomp
end