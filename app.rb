require_relative './data_handlers/load_data'
require_relative './data_handlers/save_data'
require_relative './classes/movie'
require_relative './classes/source'
require_relative './classes/music_album'
require_relative './classes/genre'

class App
  def initialize
    # @items = []
    @genres = []
    @authors = []
    @labels = []
    # @sources = []

    @items = LoadData.load_items || []
    # @genres = LoadData.load_genres || []
    # @authors = LoadData.load_authors || []
    # @labels = LoadData.load_labels || []
    @sources = LoadData.load_sources(@items) || []
    p @items
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
    when '2' then MusicAlbum.list_all(@items)
    when '3' then Movie.list_all(@items)
    when '4' then puts 'List of games'
    when '5' then Genre.list_all(@genres)
    when '6' then puts 'List all labels'
    when '7' then puts 'List all authors'
    when '8' then Source.list_all(@sources)
    when '9' then puts 'Add a book'
    when '10' then MusicAlbum.create_music_album(@items, @genres)
    when '11' then Movie.create_movie(@items, @sources)
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
    album01 = MusicAlbum.new('Music', '2000-09-18', true)
    album02 = MusicAlbum.new('Motomami', '2022-03-18', true)
    @items.push(album01, album02)
    genre01 = Genre.new('Alternative')
    genre02 = Genre.new('Pop')
    genre01.add_item(album01)
    genre02.add_item(album02)
    @genres.push(genre01, genre02)
    loop do
      options
      input = gets.chomp
      if input == '13'
        # save data on JSON files when exit the program
        SaveData.save_items(@items)
        # SaveData.save_genres(@genres)
        # SaveData.save_authors(@authors)
        # SaveData.save_labels(@labels)
        SaveData.save_sources(@sources)
        system 'clear'
        puts 'See you next time!'
        break
      end
      select_action(input)
    end
  end
end
