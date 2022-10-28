require_relative './item'
require_relative './author'
require 'securerandom'
require 'date'
require 'terminal-table'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(title, publish_date, multiplayer, last_played_at, id = SecureRandom.random_number(1000))
    super(title, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def two_years_old?
    now = Date.today
    date_array = @last_played_at.split(/-/)
    p_date = Date.civil(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
    difference_in_days = (now - p_date).to_i
    years = (difference_in_days / 365.25).to_i

    years >= 2
  end

  def can_be_archived?
    two_years_old? && super
  end

  def self.list_all(items)
    rows = []
    items.each do |item|
      next unless item.instance_of?(Game)

      rows << [item.id,
               item.title,
               item.genre ? item.genre.name : '',
               item.author ? item.author.first_name : '',
               item.source ? item.source.name : '',
               item.label ? item.label.title : '',
               item.publish_date,
               item.archived]
    end

    table = Terminal::Table.new title: 'All Games',
                                headings: %w[ID Title Genre Author Source Label Publish_Date Archived], rows: rows
    puts table
  end

  def self.create_game(items, authors)
    print 'Game title: '
    title = gets.chomp.to_s

    print 'When was it published? [yyyy-mm-dd]: '
    publish_date = gets.chomp.to_s

    print 'Is it a multiplayer game? [Y/N]: '
    multiplayer = true if gets.chomp.to_s.downcase == 'y'

    print 'when is the last played at? [yyyy-mm-dd]: '
    last_played_at = gets.chomp.to_s

    game = Game.new(title, publish_date, multiplayer, last_played_at)
    items.push(game)

    puts 'Game created successfully'

    Author.select_author(authors, game)
  end
end
