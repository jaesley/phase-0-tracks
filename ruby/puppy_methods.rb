class Puppy

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def rollover
    puts "*rolls over*"
  end

  def dogyears(hyrs)
    hyrs * 7
  end

  def shake(name)
    if name == "doggo"
      puts "*shakes paw*"
    else
      puts "Arf?"
    end
  end

  def speak(int)
    int.times do 
      puts "Woof!"
    end
  end

  def initialize
    puts "Initializing new Puppy instance..."
  end
end

doggo = Puppy.new

doggo.fetch("ball")

doggo.speak(4)

doggo.rollover

puts doggo.dogyears(5)

doggo.shake("fido")

doggo.shake("doggo")

class Kitty

  def initialize
    puts "Initializing new Kitty instance..."
  end

  def scratch(frn)
    puts "*scratch scratch scratch on the #{frn}"
  end

  def meow(words)
    puts "*human*: #{words}"
    puts "*kitty*: meooow!!"
  end


end

boots = Kitty.new

boots.scratch("ottoman")

boots.meow("Are you hungry?")

kitty_array = []

50.times do | x |
  x = Kitty.new
  kitty_array << x 
end

kitty_array.each do |y|
  y.scratch("chair")
  y.meow("Playtime!")
end

p kitty_array