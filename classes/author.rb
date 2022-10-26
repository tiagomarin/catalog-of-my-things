require 'securerandom'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name, id = SecureRandom.random_number(1000))
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end
end