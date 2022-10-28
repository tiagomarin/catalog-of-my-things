require_relative './data_handlers/load_data'
require_relative './data_handlers/save_data'
require_relative './classes/movie'
require_relative './classes/source'
require_relative './classes/book'
require_relative './classes/label'
require_relative './classes/music_album'
require_relative './classes/genre'
require_relative './classes/game'
require_relative './classes/author'

class App
  def initialize
    # @items = []
    # @genres = []
    # @authors = []
    # @labels = []
    # @sources = []

    @items = LoadData.load_items || []
    @genres = LoadData.load_genres(@items) || []
    @authors = LoadData.load_authors(@items) || []
    @labels = LoadData.load_labels(@items) || []
    @sources = LoadData.load_sources(@items) || []
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
    when '1' then Book.list_all(@items)
    when '2' then MusicAlbum.list_all(@items)
    when '3' then Movie.list_all(@items)
    when '4' then Game.list_all(@items)
    when '5' then Genre.list_all(@genres)
    when '6' then Label.list_all(@labels)
    when '7' then Author.list_all(@authors)
    when '8' then Source.list_all(@sources)
    when '9' then Book.create_book(@items, @labels)
    when '10' then MusicAlbum.create_music_album(@items, @genres)
    when '11' then Movie.create_movie(@items, @sources)
    when '12' then Game.create_game(@items, @authors)
    end
  end

  def run
    loop do
      options
      input = gets.chomp
      if input == '13'
        # save data on JSON files when exit the program
        SaveData.save_items(@items)
        SaveData.save_genres(@genres)
        SaveData.save_authors(@authors)
        SaveData.save_labels(@labels)
        SaveData.save_sources(@sources)
        # system 'clear'
        puts 'See you next time!'
        break
      end
      select_action(input)
    end
  end
end
