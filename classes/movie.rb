require_relative './item'
require 'securerandom'

class Movie < Item
  attr_accessor :silent

  def initialize(title, date, silent, id = SecureRandom.uuid)
    super(title, date, id)
    @silent = silent
  end

  def can_be_archived?
    @silent || super
  end
end
