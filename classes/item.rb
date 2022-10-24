require 'securerandom'
require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date
  attr_reader :id, :archived

  def initialize(date, archived: false)
    @id = SecureRandom.uuid
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = date
    @archived = archived
  end

  def add_genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def add_author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def add_label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def can_be_archived?
    now = Date.today
    date_array = @publish_date.split(/-/)
    p_date = Date.civil(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
    difference_in_days = (now - p_date).to_i
    years = (difference_in_days / 365.25).to_i

    years >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end
