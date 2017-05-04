class TodoList
  def initialize(item_list)
    @list = item_list
  end

  def get_items
    @list
  end

  def add_item(item)
    @list << item
    @list
  end

  def delete_item(item)
    @list.delete(item)
    @list
  end

  def get_item(int)
    @list[int]
  end
end