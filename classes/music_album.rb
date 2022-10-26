require_relative './item'
require 'securerandom'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(title, date, on_spotify, id = SecureRandom.random_number(1000))
    super(title, date, id)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    @on_spotify && super
  end
end
