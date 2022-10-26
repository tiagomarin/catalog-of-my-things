require 'json'

class SaveData
  def self.save_items(items)
    file_path = './data/items.json'
    items_data = items.map do |item|
      next unless item.instance_of?(Movie)

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
    json = JSON.pretty_generate(items_data)
    File.write(file_path, json)
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
end
