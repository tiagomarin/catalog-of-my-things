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

  def can_be_archived?
    now = Date.today
    date_array = @publish_date.split(/-/)
    p_date = Date.civil(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
    difference_in_days = (now - p_date).to_i
    years = (difference_in_days/365.25).to_i

    years >= 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end
end