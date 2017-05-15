require_relative 'room'

class House
  attr_reader :rooms

  def initialize
    @rooms = []
  end

  def add_room(room)
    if @rooms.length < 10
      @rooms << room
      true
    else
      false
    end
  end

  def to_s
    house_string = ""
    @rooms.each do | room |
      house_str << room.to_s.upcase
      house_str << "\n\n"
      room.items.each do | item |
        house_str << item.to_s
        house_str << "/n"
      end
      house_str << "\n"
    end
    house_str
  end

  def total_value
    total = 0
    @rooms.each do | room |
      total += room.total_value
    end
    value
  end

  def square_footage
    sq_footage = 0
    @rooms.each do | room |
      sq_footage += room.width * room.length
    end
    sq_footage
  end
end