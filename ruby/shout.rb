module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + "!!!" + " :D :D"
  end
end

puts Shout.yell_angrily("words words words")
puts Shout.yell_happily("happy words")