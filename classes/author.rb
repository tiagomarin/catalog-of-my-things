require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name, id = SecureRandom.random_number(1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_author(self)
  end

  def self.list_all(authors)
    rows = []
    authors.each do |author|
      rows << [author.id,
               author.first_name,
               author.last_name]
    end

    table = Terminal::Table.new title: 'All Authors',
                                headings: %w[id first_name last_name], rows: rows
    puts table
  end

  def self.select_author(authors, game)
    puts 'Add an author!'
    puts 'this is the list of authors available:'
    list_all(authors)

    puts 'choose an option'
    puts '[ 1 ] Select an author from the list'
    puts '[ 2 ] Add a new author'
    author_option = gets.chomp.to_i

    if author_option == 1
      print 'ID of the author: '
      id_author = gets.chomp.to_i
      authors.each do |author|
        game.add_author(author) if author.id == id_author
      end
    else
      print 'First Name: '
      first_name = gets.chomp
      print 'Last Name: '
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
      author.add_item(game)
      authors.push(author)
      puts 'Author created successfully'
    end
  end
end
