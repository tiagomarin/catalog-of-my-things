require_relative './item'
require_relative './genre'
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

  def self.create_music_album(items, genres)
    print 'Music Album title: '
    title = gets.chomp.to_s

    print 'When was it published? [yyyy-mm-dd]: '
    published = gets.chomp.to_s

    print 'Is it available on Spotify? [Y/N]: '
    on_spotify = true if gets.chomp.to_s.downcase == 'y'

    music_album = MusicAlbum.new(title, published, on_spotify)
    items.push(music_album)

    Genre.select_genre(genres, music_album)

    puts 'Music Album created successfully'
    genres
  end
end
