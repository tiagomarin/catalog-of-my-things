require 'securerandom'

class Source
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name)
    @id = SecureRandom.random_number(1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_source(self)
  end

  def self.list_all(sources)
    rows = []
    sources.each do |source|
      rows << [source.id,
               source.name]
    end

    table = Terminal::Table.new title: 'All Sources',
                                headings: %w[id Name], rows: rows
    puts table
  end
end
