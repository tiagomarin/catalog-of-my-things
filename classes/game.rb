require_relative './item'
require 'securerandom'

class Game < Item
  attr_accessor :multiplayer, :last_played_at
  attr_reader :id

  def initialize(title, date, multiplayer, last_played_at, id = SecureRandom.random_number(1000))
    super(title, date, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end
end
