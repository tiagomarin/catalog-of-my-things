require_relative './classes/game'
require_relative './classes/author'

game1 = Game.new('dota', 'multiplayer', '2020-10-26')
game2 = Game.new('Lol', 'multiplayer', '2022-10-26')
p game1
p game2
author1 = Author.new('Erick', 'Johnson')
author2 = Author.new('Tom', 'Cadwell')
p author1
p author2
