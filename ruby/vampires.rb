puts "How many employees are you processing?"

employees = gets.chomp
employees = employees.to_i

(1..employees).each do

	puts "What is your name?"

	name = gets.chomp

	puts "How old are you?"

	age = gets.chomp
	age = age.to_i

	puts "What year were you born?"

	birthyear = gets.chomp
	birthyear = birthyear.to_i

	puts "Our company cafeteria serves garlic bread. Should we order some for you? (y/n)"

	garlic = gets.chomp

	until garlic == "y" || garlic == "n"
		puts "Please use 'y' or 'n'. Now, should we order some garlic bread?"
		garlic = gets.chomp
	end

	if garlic == "y"
  	garlic = true
	else
  	garlic = false
	end

	puts "Would you like to enroll in the company's health insurance? (y/n)"

	insurance = gets.chomp

	until insurance == "y" || insurance == "n"
		puts "Please use 'y' or 'n'. Now, would you like to enroll?"
		insurance = gets.chomp
	end

	if insurance == "y"
	  insurance = true
	else
	  insurance = false
	end

	vampire = "Results inconclusive."
	curryear = age + birthyear

	if curryear == 2017 && garlic && insurance
	  vampire = "Probably not a vampire."
	end

	if curryear != 2017 && ( !garlic || !insurance )
		vampire = "Probably a vampire."
	end

	if curryear != 2017 && ( !garlic && !insurance )
		vampire = "Almost certainly a vampire."
	end

	if name == "Drake Cula" || name == "Tu Fang"
		vampire = "Definitely a vampire"
	end

	puts "#{vampire}"
end