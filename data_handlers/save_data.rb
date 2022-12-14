require 'json'

class SaveData
  def self.save_items(items)
    file_path = './data/items.json'
    items_data = items.map do |item|
      case item.class.name
      when 'Movie' then save_movie(item)
      when 'Book' then save_book(item)
      when 'Game' then save_game(item)
      else
        save_music_album(item)
      end
    end
    json = JSON.pretty_generate(items_data)
    File.write(file_path, json)
  end

  def self.save_movie(item)
    {
      type: item.class.name,
      id: item.id,
      title: item.title,
      genre_id: item.genre ? item.genre.id : '',
      author_id: item.author ? item.author.id : '',
      source_id: item.source ? item.source.id : '',
      label_id: item.label ? item.label.id : '',
      publish_date: item.publish_date,
      archived: item.archived,
      silent: item.silent
    }
  end

  def self.save_book(item)
    {
      type: item.class.name,
      id: item.id,
      title: item.title,
      publish_date: item.publish_date,
      publisher: item.publisher,
      cover_state: item.cover_state,
      archived: item.archived,
      label_id: item.label ? item.label.id : ''
    }
  end

  def self.save_game(item)
    {
      type: item.class.name,
      id: item.id,
      title: item.title,
      publish_date: item.publish_date,
      multiplayer: item.multiplayer,
      last_played_at: item.last_played_at,
      author: item.author ? item.author.id : ''
    }
  end

  def self.save_music_album(item)
    {
      type: item.class.name,
      id: item.id,
      title: item.title,
      genre_id: item.genre ? item.genre.id : '',
      author_id: item.author ? item.author.id : '',
      source_id: item.source ? item.source.id : '',
      label_id: item.label ? item.label.id : '',
      publish_date: item.publish_date,
      archived: item.archived,
      on_spotify: item.on_spotify
    }
  end

  def self.save_sources(sources)
    file_path = './data/sources.json'
    sources_data = sources.map do |e|
      items_ids = []
      e.items.each { |item| items_ids.push(item.id) }
      {
        id: e.id,
        name: e.name,
        items_ids: items_ids
      }
    end
    File.write(file_path, JSON.pretty_generate(sources_data))
  end

  def self.save_labels(labels)
    file_path = './data/labels.json'
    labels_data = labels.map do |e|
      items_ids = []
      e.items.each { |item| items_ids.push(item.id) }
      {
        id: e.id,
        title: e.title,
        color: e.color,
        items_ids: items_ids
      }
    end
    File.write(file_path, JSON.pretty_generate(labels_data))
  end

  def self.save_genres(genres)
    file_path = './data/genres.json'
    genres_data = genres.map do |e|
      items_ids = []
      e.items.each { |item| items_ids.push(item.id) }
      {
        id: e.id,
        name: e.name,
        items_ids: items_ids
      }
    end
    File.write(file_path, JSON.pretty_generate(genres_data))
  end

  def self.save_authors(authors)
    file_path = './data/authors.json'
    authors_data = authors.map do |e|
      items_ids = []
      e.items.each { |item| items_ids.push(item.id) }
      {
        id: e.id,
        first_name: e.first_name,
        last_name: e.last_name,
        items_ids: items_ids
      }
    end
    File.write(file_path, JSON.pretty_generate(authors_data))
  end
end
