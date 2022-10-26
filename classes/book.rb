require_relative './item'
require 'securerandom'
require 'terminal-table'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(title, publish_date, publisher, cover_state, id = SecureRandom.random_number(1000))
    super(title, publish_date, id)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    @cover_state == 'bad' || super
  end
end
