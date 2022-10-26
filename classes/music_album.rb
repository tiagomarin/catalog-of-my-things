require_relative './item'
require 'securerandom'
require 'terminal-table'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(title, date, on_spotify, id = SecureRandom.random_number(1000))
    super(title, date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @on_spotify && super
  end

  def self.list_all(items)
    rows = []
    items.each do |item|
      next unless item.instance_of?(MusicAlbum)

      rows << [item.id,
               item.title,
               item.genre ? item.genre.name : '',
               item.author ? item.author.first_name : '',
               item.source ? item.source.name : '',
               item.label ? item.label.title : '',
               item.publish_date,
               item.archived]
    end

    table = Terminal::Table.new title: 'All Music Albums',
                                headings: %w[ID Title Genre Author Source Label Publish_Date Archived], rows: rows
    puts table
  end
end
