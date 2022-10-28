require 'securerandom'

class Source
  attr_accessor :name, :items
  attr_reader :id

  def initialize(name, id = SecureRandom.random_number(1000))
    @id = id
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

  def self.select_source(sources, movie)
    puts 'Time to add a source! '
    puts 'This is the list of sources available:'
    list_all(sources)

    puts 'Choose an option'
    puts '[ 1 ] Select a source from the list'
    puts '[ 2 ] Add a new source'
    source_option = gets.chomp.to_i

    if source_option == 1
      print 'ID of the source: '
      id_source = gets.chomp.to_i
      sources.each do |source|
        movie.add_source(source) if source.id == id_source
      end
    else
      print 'Name: '
      name = gets.chomp
      source = Source.new(name)
      source.add_item(movie)
      sources.push(source)
    end
    sources
  end
end
