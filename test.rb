require_relative './classes/movie'

movie1 = Movie.new('Gladiator', '2020-10-13', false)
p movie1

movie2 = Movie.new('Trip to the moon','1900-05-24', true)
p movie2

puts movie1.archived
puts movie2.archived

puts 'after'
movie1.move_to_archive
movie2.move_to_archive
p movie1.archived
p movie2.archived