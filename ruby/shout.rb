module Shout
  # def self.yell_angrily(words)
  #   words + "!!!" + " :("
  # end

  # def self.yell_happily(words)
  #   words + "!!!" + " :D :D"

  def yell(words)
    puts words.upcase + "!!!"
  end
end

# puts Shout.yell_angrily("words words words")
# puts Shout.yell_happily("happy words")

class Toddler
  include Shout
end

class Isley_Brothers
  include Shout
end

toddler = Toddler.new
toddler.yell("I want Mama")

isley_brothers = Isley_Brothers.new
isley_brothers.yell("Shout, let it all out")