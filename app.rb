require_relative './data_handlers/load_data'
require_relative './data_handlers/save_data'
require_relative './classes/movie'
require_relative './classes/source'

class App
  def initialize
    # @items = []
    @genres = []
    @authors = []
    @labels = []
    @sources = []

    @items = LoadData.load_items || []
    # @genres = LoadData.read_genres || []
    # @authors = LoadData.read_authors || []
    # @labels = LoadData.read_labels || []
    # @sources =LoadData.read_sources || []
  end

  def options
    puts [
      '',
      '    [1]  - List all books',
      '    [2]  - List all music albums',
      '    [3]  - List all movies',
      '    [4]  - List of games',
      '    [5]  - List all genres',
      '    [6]  - List all labels',
      '    [7]  - List all authors',
      '    [8]  - List all sources',
      '    [9]  - Add a book',
      '    [10] - Add a music album',
      '    [11] - Add a movie',
      '    [12] - Add a game',
      '    [13] - Exit',
      ''
    ]
  end

  def select_action(input)
    case input
    when '1' then puts 'List all books'
    when '2' then puts 'List all music albums'
    when '3' then puts 'List all movies'
    when '4' then puts 'List of games'
    when '5' then puts 'List all genres'
    when '6' then puts 'List all labels'
    when '7' then puts 'List all authors'
    when '8' then puts 'List all sources'
    when '9' then puts 'Add a book'
    when '10' then puts 'Add a music album'
    when '11' then puts 'Add a movie'
    when '12' then puts 'Add a game'
    end
  end

  def run
    # movie1 = Movie.new('Gladiator', '2020-10-13', false)
    # movie2 = Movie.new('Trip to the moon', '1900-05-24', true)
    # @items.push(movie1, movie2)
    # source1 = Source.new('Online shop')
    # @sources << source1
    # source1.add_item(movie1)
    # movie2.add_source(source1)
    loop do
      options
      input = gets.chomp
      if input == '13'
        # save data on JSON files when exit the program
        SaveData.save_items(@items)
        # SaveData.save_genres(@genres)
        # SaveData.save_authors(@authors)
        # SaveData.save_labels(@labels)
        # SaveData.save_sources(@sources)
        system 'clear'
        puts 'See you next time!'
        break
      end
      select_action(input)
    end
  end
end
