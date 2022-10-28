require_relative '../classes/author'
require_relative '../classes/game'

author1 = Author.new('Erick', 'Johnson')
author2 = Author.new('Tom', 'Cadwell')

describe 'test Author constructor' do
  it 'take parameter and return an object' do
    expect(author1.instance_of?(Author)).to eq(true)
    expect(author2.instance_of?(Author)).to eq(true)
  end

  it 'Author first_name parameter should be correct' do
    expect(author1.first_name).to eq('Erick')
    expect(author2.first_name).to eq('Tom')
  end

  it 'Author last_name parameter should be correct' do
    expect(author1.last_name).to eq('Johnson')
    expect(author2.last_name).to eq('Cadwell')
  end

  it 'author object should have an id' do
    expect(author1.id.nil?).to eq(false)
    expect(author2.id.nil?).to eq(false)
  end

  it 'author object should have an empty items array' do
    expect(author1.items.empty?).to eq(true)
    expect(author2.items.empty?).to eq(true)
  end
end

describe 'test if Author add_item method' do
  it 'item is included in items array' do
    game1 = Game.new('dota', '2010-10-05', true, '2020-10-26')
    game2 = Game.new('Lol', '2015-10-05', true, '2022-10-26')
    author1.add_item(game1)
    author2.add_item(game2)
    expect(author1.items.length).to eq(1)
    expect(author2.items.length).to eq(1)
  end
end
