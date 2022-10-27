require_relative './classes/game'
require_relative './classes/author'

game1 = Game.new('dota', '2010-10-05', true, '2020-10-26')
game2 = Game.new('Lol', '2015-10-05', true, '2022-10-26')
p game1.can_be_archived?
p game2.can_be_archived?
author1 = Author.new('Erick', 'Johnson')
author2 = Author.new('Tom', 'Cadwell')
p author1.add_item(game1)
p author2.add_item(game2)
p author1.items
