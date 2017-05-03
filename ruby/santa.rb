class Santa
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}!"
  end

  def celebrate_birthday
    @age += 1
  end

  # method get_mad_at(reindeer)
    # if reindeer is found in reindeer_ranking:
      # delete the reindeer's name at current location
      # push reindeer's name to end of array
    # else
      # return error msg
    # end if
  # end method

  def get_mad_at(reindeer)
    if @reindeer_ranking.index(reindeer) != nil
      @reindeer_ranking.delete(reindeer)
      @reindeer_ranking.push(reindeer)
      @reindeer_ranking
  end

  def gender=(new_gender)
    @gender = new_gender
  end

  def age
    @age
  end

  def ethnicity
    @ethnicity
  end
end

santas = []
example_genders = ["male", "female", "agender", "bigender", "gender fluid", "transfeminine", 'transmasculine']
example_ethnicities = ["black", "white", "Latinx", "East Asian", "Southeast Asian", "Pacific Islander", "Native American"]

example_genders.length.times do |i|
  santas << Santa.new(example_genders[i], example_ethnicities[i])
end

santa1 = Santa.new("male", "white")
santa1.speak 
santa1.eat_milk_and_cookies("chocolate chip")

santa1.celebrate_birthday
puts santa1.age
puts santa1.ethnicity

santa1.gender = "female"

santa1.get_mad_at("Vixen")
puts reindeer_ranking
santa1.get_mad_at("Blair")
puts reindeer_ranking