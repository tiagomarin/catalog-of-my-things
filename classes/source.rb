require 'securerandom'

class Source
  attr_accessor :name, :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_source(self)
  end
end
