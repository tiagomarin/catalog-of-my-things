require_relative '../classes/movie'
require_relative '../classes/source'
require_relative '../classes/music_album'
require_relative '../classes/genre'
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
        items_arr.push(Movie.new(item['title'], item['publish_date'], item['silent'], item['id']))
      when 'Book'
        items_arr.push(Book.new(item['title'],
                                item['publish_date'],
                                item['publisher'],
                                item['cover_state'],
                                item['id']))
      when 'Game'
        puts 'game'
      else
        items_arr.push(MusicAlbum.new(item['title'], item['publish_date'], item['on_spotify'], item['id']))
      end
    end
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
    sources_arr
  end

  def self.load_labels(items)
    file_path = './data/labels.json'
    labels_file = File.open(file_path)

    labels_arr = []

    JSON.parse(labels_file.read).each do |label|
      new_label = Label.new(label['title'], label['color'], label['id'])

      label['items_ids'].each do |item_id|
        items.each do |item|
          new_label.add_item(item) if item.id == item_id
        end
      end
      labels_arr.push(new_label)
    end
    labels_arr
  end

  def self.load_genres(items)
    file_path = './data/genres.json'
    genres_file = File.open(file_path)

    genres_arr = []

    JSON.parse(genres_file.read).each do |genre|
      new_genre = Genre.new(genre['name'], genre['id'])

      genre['items_ids'].each do |item_id|
        items.each do |item|
          new_genre.add_item(item) if item.id == item_id
        end
      end
      genres_arr.push(new_genre)
    end
    genres_arr
  end
end
