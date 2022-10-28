require_relative './item'
require_relative './source'
require 'securerandom'
require 'terminal-table'

class Movie < Item
  attr_accessor :silent

  def initialize(title, date, silent, id = SecureRandom.random_number(1000))
    super(title, date, id)
    @silent = silent
  end

  def can_be_archived?
    @silent || super
  end

  def self.list_all(items)
    rows = []
    items.each do |item|
      next unless item.instance_of?(Movie)

      rows << [item.id,
               item.title,
               item.silent,
               item.source ? item.source.name : '',
               item.publish_date,
               item.archived,
               item.genre ? item.genre.name : '',
               item.author ? item.author.first_name : '',
               item.label ? item.label.title : '']
    end

    table = Terminal::Table.new title: 'All Movies',
                                headings: %w[ID Title Silent Source Publish_Date Archived Genre Author Label],
                                rows: rows
    puts table
  end

  def self.create_movie(items, sources)
    print 'Movie Title: '
    title = gets.chomp.to_s

    print 'When was it published? [yyyy-mm-dd]: '
    author = gets.chomp.to_s

    print 'Is it a silent movie? [Y/N]: '
    silent = true if gets.chomp.to_s.downcase == 'y'

    movie = Movie.new(title, author, silent)
    items.push(movie)

    Source.select_source(sources, movie)

    puts 'Movie created successfully'
  end
end
