require 'securerandom'

class Genre
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name, id = SecureRandom.random_number(1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_genre(self)
  end
end
