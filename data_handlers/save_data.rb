require 'json'

class SaveData
  def self.save_items(items)
    file_json = './data/items.json'
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
    File.write(file_json, json)
  end
end
