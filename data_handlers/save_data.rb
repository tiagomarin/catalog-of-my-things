require 'json'

class SaveData
  def self.save_items(items)
    file_json = './data/items.json'
    items_data = items.map do |item|
      next unless item.instance_of?(Movie)

      {
        id: item.id,
        title: item.title,
        genre: item.genre,
        author: item.author,
        source: item.source,
        label: item.label,
        publish_date: item.publish_date,
        archived: item.archived,
        silent: item.silent
      }
    end
    json = JSON.pretty_generate(items_data)
    File.write(file_json, json)
  end
end
