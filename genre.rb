class Genre
    attr_accessor :name
    
    def initialize(name)
        @id = Random.rand(1...9999999)
        @items = []
        @name = name
    end

    def add_item(item)
        @items << item
        item.genre = self
    end
end