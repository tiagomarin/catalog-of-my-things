require_relative '../classes/movie'
require_relative '../classes/source'
require 'json'
require 'pry'

class LoadData
  def self.load_items
    file_path = './data/items.json'
    items_file = File.open(file_path)
    items_arr = []
    JSON.parse(items_file.read).each do |item|
      case item['type']
      when 'Movie'
        items_arr.push(Movie.new(item['title'], item['date'], item['silent'], item['id']))
      when 'Book'
        puts 'book'
      when 'Game'
        puts 'game'
      else
        puts 'music album'
      end
    end
    pp "items array:  #{items_arr}"
    items_arr
  end

  def self.load_sources(items)
    file_path = './data/sources.json'
    sources_file = File.open(file_path)

    sources_arr = []

    JSON.parse(sources_file.read).each do |source|
      new_source = Source.new(source['name'], source['id'])

      source['items_ids'].each do |item_id|
        items.each do |item|
          new_source.add_item(item) if item.id == item_id
        end
      end
      sources_arr.push(new_source)
    end
    pp "sources array:  #{sources_arr}"
    sources_arr
  end
end
