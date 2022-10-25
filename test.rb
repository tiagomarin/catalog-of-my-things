require_relative './classes/movie'
require_relative './classes/source'

movie1 = Movie.new('Gladiator', '2020-10-13', false)
movie2 = Movie.new('Trip to the moon','1900-05-24', true)
puts '***original movie sources***'
puts movie1.source
puts movie2.source

movie1.move_to_archive
movie2.move_to_archive

source1 = Source.new('Online shop')
puts '***create source***'
puts source1

source1.add_item(movie1)
movie2.add_source(source1)

puts '***check sources***'
puts source1.items
puts movie1.source.name
puts movie2.source.name