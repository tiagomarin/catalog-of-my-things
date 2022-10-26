require_relative './classes/music_album'
require_relative './classes/genre'
require 'pry'

album01 = MusicAlbum.new('Music', '2000-09-18', true)
album02 = MusicAlbum.new('Motomami', '2022-03-18', true)
genre01 = Genre.new('Alternative')
genre02 = Genre.new('Pop')
binding.pry
p album01
