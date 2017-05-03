class Santa
  def initialize(gender, ethnicity)
    reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    age = 0
    puts "Initializing Santa instance..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end
end

santa1 = Santa.new("male", "white")

santa1.speak 

santa1.eat_milk_and_cookies("chocolate chip")

santas = []
example_genders = ["male", "female", "agender", "bigender", "gender fluid", "transfeminine", 'transmasculine']
example_ethnicities = ["black", "white", "Latinx", "East Asian", "Southeast Asian", "Pacific Islander", "Native American"]

example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end