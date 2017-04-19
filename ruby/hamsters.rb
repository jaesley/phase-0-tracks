puts "What is the hamster's name?"
  name = gets.chomp
 
puts "What is the hamster's volume level? (1 = lowest volume, 10 = highest volume)"
  volume = gets.chomp
  volume = volume.to_i
 
  until volume >= 1 && volume <= 10
    puts "What is your volume tolerance level? (1 = lowest volume, 10 = highest volume)"
 	  volume = gets.chomp
      volume = volume.to_i
    end
 
puts "What color is the hamster's fur?"
  furcolor = gets.chomp
 
puts "Is the hamster a good candidate for adoption? (y/n)"
  adoption = gets.chomp
   
  until adoption.downcase == "y" || adoption.downcase == "n"
    puts "Is the hamster a good candidate for adoption? (y/n)"
    adoption = gets.chomp
  end

  if adoption == "y"
  	adoption = true
  else
  	adoption = false
  end

  puts "#{adoption}"
 
puts "What is the hamster's approximate age?"
  age = gets.chomp
    if age == ""
     	age = nil
    else 
    	age.to_i
    end

puts ""
puts "Hamster's name is #{name}."
puts "Hamster's volume level is #{volume}."
puts "Hamster's fur color is #{furcolor}."
	if adoption == true
		puts "Hamster's adoption approval status is approved."
	else 
		puts "Hamster's adoption approval status is not approved."
	end
puts "Hamster's approximate age is #{age}" 