require_relative './item'

class Movie < Item
  attr_accessor :silent

  def initialize(title, date, silent)
    super(title, date)
    @silent = silent
  end

  def can_be_archived?
    @silent || super
  end
end
