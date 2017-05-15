class Item
  attr_reader :name, :color, :price

  def initialize(name, color, price)
    @name = name
    @color = color
    @price = price
  end

  def to_s
    "A #{@color} #{@name} worth #{@price} cents."
  end
end