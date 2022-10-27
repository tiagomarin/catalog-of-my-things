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

  def self.select_genre(genres, music_album)
    puts 'Time to add a genre! '
    puts 'This is the list of genres available:'
    list_all(genres)

    puts 'Choose an option'
    puts '[ 1 ] Select a genre from the list'
    puts '[ 2 ] Add a new genre'
    genre_option = gets.chomp.to_i

    if genre_option == 1
      print 'ID of the genre: '
      id_genre = gets.chomp.to_i
      genres.each do |genre|
        music_album.add_genre(genre) if genre.id == id_genre
      end
    else
      print 'Name: '
      name = gets.chomp
      genre = Genre.new(name)
      genre.add_item(music_album)
      genres.push(genre)
    end
  end
end
