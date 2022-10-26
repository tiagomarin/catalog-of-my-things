require_relative './classes/book'
require_relative './classes/label'

book01 = Book.new('Once Uppon a Time', '2000-09-18', 'Marvel', 'good')
book02 = Book.new('The Great Wolf', '2022-03-18', 'Klaus', 'bad')
label01 = Label.new('Indy', 'orange')
label02 = Label.new('Romance', 'blue')

puts 'OBJECTS:'
pp book01
pp book02
puts ''

puts 'BOOK TITLES:'
pp book01.title
pp book02.title
puts ''

label01.add_item(book01)
label02.add_item(book02)

puts 'BOOK TITLES INSIDE EACH LABEL:'
puts ''
print "'#{label01.title}' has the following item:  "
pp label01.items[0].title
puts ''
print "'#{label01.title}' has the following item:  "
pp label02.items[0].title
puts ''

puts 'LABELS IN EACH BOOK: '
puts " #{book01.label.title} - #{book01.label.color}"
puts " #{book02.label.title} - #{book02.label.color}"
