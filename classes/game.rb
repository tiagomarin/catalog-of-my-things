require_relative './item'
require 'securerandom'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date
  attr_reader :id

  def initialize(title, multiplayer, last_played_at)
    super(id = SecureRandom.random_number(1000), title, publish_date)
    @id = id
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && (Date.today.year - @last_played_at.year) > 2
  end
end
# id = SecureRandom.random_number(1000), 