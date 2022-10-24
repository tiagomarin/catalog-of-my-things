require 'securerandom'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(date)
    @id = SecureRandom.uuid
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = archived
  end
end