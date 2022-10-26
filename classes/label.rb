require 'securerandom'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = SecureRandom.random_number(1000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end

  def self.list_all(labels)
    rows = []
    labels.each { |label| rows << [label.id, label.title, label.color] }

    table = Terminal::Table.new title: 'All Labels',
                                headings: %w[ID Title Color], rows: rows
    puts table
  end

  def self.select_label(labels, book)
    puts 'Do you want to add a label to the book? [Y/N]'
    return unless gets.chomp.to_s.downcase == 'y'

    puts 'This is the list of labels available:'
    list_all(labels)

    puts 'Choose an option'
    puts '[ 1 ] Select a label from the list'
    puts '[ 2 ] Add a new label'
    option = gets.chomp.to_i

    if option == 1
      print 'What is the ID of the label you want to add? _ '
      label_id = gets.chomp.to_i
      labels.each do |label|
        book.add_label(label) if label.id == label_id
      end
    else
      print 'Label title: '
      title = gets.chomp
      print 'Label color: '
      color = gets.chomp
      label = label.new(title, color)
      puts 'Label created successfully'
      puts ''
      label.add_item(book)
      labels.push(label)
    end
    puts 'Label added successfully'
  end
end
