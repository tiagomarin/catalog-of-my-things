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

  def self.list_all(genres)
    rows = []
    genres.each do |genre|
      rows << [genre.id,
               genre.name]
    end

    table = Terminal::Table.new title: 'All Genres',
                                headings: %w[id Name], rows: rows
    puts table
  end
end
