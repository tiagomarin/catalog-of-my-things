require_relative './item'
require 'securerandom'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(title, publish_date, multiplayer, last_played_at, id = SecureRandom.random_number(1000))
    super(title, publish_date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def two_years_old?
    now = Date.today
    date_array = @last_played_at.split(/-/)
    p_date = Date.civil(date_array[0].to_i, date_array[1].to_i, date_array[2].to_i)
    difference_in_days = (now - p_date).to_i
    years = (difference_in_days / 365.25).to_i

    years >= 2
  end

  def can_be_archived?
    two_years_old? && super
  end
end
