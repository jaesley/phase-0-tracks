class Santa
attr_reader :ethnicity, :reindeer_ranking
attr_accessor :gender, :age

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

# Getter methods

  # def age
  #   @age
  # end

  # def ethnicity
  #   @ethnicity
  # end

  # def reindeer_ranking
  #   @reindeer_ranking
  # end

  # def gender
  #   @gender
  # end

# Setter methods

  def gender=(new_gender)
    @gender = new_gender
  end

# Active methods

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
    else
      puts "That's not a reindeer."
    end
  end

  def print
    puts "Santa, #{@gender}, #{@ethnicity}, #{@age} years old"
  end
end

example_santas = []
example_genders = ["male", "female", "agender", "bigender", "gender fluid", "transfeminine", 'transmasculine']
example_ethnicities = ["black", "white", "Latinx", "East Asian", "Southeast Asian", "Pacific Islander", "Native American", "Aborigine"]

example_genders.length.times do |i|
  example_santas << Santa.new(example_genders[i], example_ethnicities[i])
end

santa1 = Santa.new("male", "white")
santa1.speak 
santa1.eat_milk_and_cookies("chocolate chip")

santa1.celebrate_birthday
puts santa1.age
puts santa1.ethnicity

santa1.gender = "female"
puts santa1.gender

santa1.get_mad_at("Vixen")
puts santa1.reindeer_ranking
santa1.get_mad_at("Blair")
puts santa1.reindeer_ranking

santas = []

5000.times do |x|
  santas << Santa.new(example_genders.sample, example_ethnicities.sample)
  santas[x].age = rand(140)
  santas[x].print
end