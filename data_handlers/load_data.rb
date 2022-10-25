require_relative '../classes/movie'
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
end
