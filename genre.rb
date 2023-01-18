class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = Random.rand(1...9_999_999)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
