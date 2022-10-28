require_relative './item'
require 'securerandom'
require 'terminal-table'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(title, publish_date, publisher, cover_state, id = SecureRandom.random_number(1000))
    super(title, publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end

  def self.create_book(items, labels)
    print 'Book Title: '
    title = gets.chomp.to_s

    print 'When was it published? [yyyy-mm-dd]: '
    published_date = gets.chomp.to_s

    print 'Who was the publisher? - '
    publisher = gets.chomp.to_s

    puts 'What is the state of the cover?'
    puts '    [1] - good'
    puts '    [2] - bad '
    cover_state = gets.chomp.to_i == 1 ? 'good' : 'bad'

    book = Book.new(title, published_date, publisher, cover_state)
    items.push(book)

    puts 'Book created successfully'

    Label.select_label(labels, book)
  end

  def self.list_all(items)
    rows = []
    items.each do |item|
      next unless item.instance_of?(Book)

      rows << [item.id,
               item.title,
               item.cover_state,
               item.publisher,
               item.publish_date,
               item.archived,
               item.label ? item.label.title : '',
               item.genre ? item.genre.name : '',
               item.author ? item.author.first_name : '',
               item.source ? item.source.name : '']
    end
    # require 'terminal-table'
    table = Terminal::Table.new title: 'All Books',
                                headings: %w[ID Title Cover_State Publisher Publish_Date
                                             Archived Label Genre Author Source],
                                rows: rows
    puts table
  end
end
