require_relative './classes/item'

item1 = Item.new('2022-10-20')
p item1
item2 = Item.new('2012-10-20')
p item2

item1.move_to_archive
puts item1.archived
item2.move_to_archive
puts item2.archived
