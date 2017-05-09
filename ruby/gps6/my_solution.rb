# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# Makes a link to a second related Ruby file
# and virtually imports the file
# require takes the full file path as opposed to 
# require_relative which does not

require_relative 'state_data'

class VirusPredictor

  # Creates a new instance of the VirusPredictor class with instance variables
  # passed as parameters to the .new call
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # Calls .predicted_deaths and .speed_of_spread methods and
  # provides the output of those private methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # Takes the state's data and multiplies population by a factor
  # determined by the state's population density
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Takes the state's data and determines the speed of spread
  # based on a factor of population density
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each do |state, data|
  state_prediction = VirusPredictor.new(state, data[:population_density], data[:population])
  state_prediction.virus_effects
end

#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
  # The outer hash, of key state vs value data hash, uses rocket ship notation (=>) to input the value. 
  # The more straight-forward secondary style takes a cue from JavaScript in syntax, and only supports symbols as keys.
# What does require_relative do? How is it different from require?
  # Makes a link to a second related Ruby file and virtually imports the file require takes the full file path as opposed to require_relative which does not
# What are some ways to iterate through a hash?
  # .each is the most basic way, and has additional similarly-named methods that allow for iterating by key, by value, or by pair. 
# When refactoring virus_effects, what stood out to you about the variables, if anything?
  # The variables were already given in instance variables, so there was no need to give them again as method parameters.
# What concept did you most solidify in this challenge?
  # The 'private' call was new to me in the context of Ruby, though I've worked with it somewhat in other languages. I liked getting the opportunity to see how it differs in Ruby.