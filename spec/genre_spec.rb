require_relative '../classes/genre'
require_relative '../classes/music_album'

genre01 = Genre.new('Electronic')
genre02 = Genre.new('Alternative')

describe 'test Genre constructor' do
  it 'takes one parameter and return a Genre instance' do
    expect(genre01.instance_of?(Genre)).to eq(true)
  end
  it 'instance name should be correct' do
    expect(genre01.name).to eq('Electronic')
    expect(genre02.name).to eq('Alternative')
  end
  it 'instance should have an id' do
    expect(genre01.id.nil?).to eq(false)
  end
  it 'instance should have and empty items array' do
    expect(genre01.items.empty?).to eq(true)
  end
end

describe 'test Genre add_item method' do
  it 'item is included in items array' do
    album01 = MusicAlbum.new('Music', '2000-09-18', true)
    album02 = MusicAlbum.new('Motomami', '2022-03-18', true)
    genre01.add_item(album01)
    genre02.add_item(album02)
    expect(genre01.items.length).to eq(1)
    expect(genre02.items.length).to eq(1)
  end
end
