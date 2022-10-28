require_relative '../classes/source'
require_relative '../classes/movie'

source1 = Source.new('Online Shop')

describe 'test Source constructor ' do
  it 'takes one parameter and returns a Source object' do
    expect(source1.instance_of?(Source)).to eq(true)
  end
  it 'Source name parameter should be Online Shop' do
    expect(source1.name).to eq('Online Shop')
  end
  it 'Source object should have an id' do
    expect(source1.id.nil?).to eq(false)
  end
  it 'Source object should have an empty items array' do
    expect(source1.items.empty?).to eq(true)
  end
end

describe 'test Source add_item method ' do
  it 'item is included in items arrray' do
    movie1 = Movie.new('Gladiator', '2020-10-13', false)
    source1.add_item(movie1)
    expect(source1.items.length).to eq(1)
  end
end
