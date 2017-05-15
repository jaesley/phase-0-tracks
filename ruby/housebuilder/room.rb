require_relative 'item'

class Room
  attr_reader :width, :length
  attr_accessor :items, :name
  def initialize(name, length, width)
    @name = name
    @length = length
    @width = width
    @items = []
  end

  def total_value
    total = 0
    @items.each do | item |
      total += item.price
    end
    total
  end

  def to_s
    "#{@name} (#{@length} x #{@width})"
  end
end