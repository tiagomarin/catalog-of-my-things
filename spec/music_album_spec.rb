require_relative '../classes/music_album'

album01 = MusicAlbum.new('Discovery', '2001-03-12', true)
album02 = MusicAlbum.new('Motomami', '2022-03-18', true)

describe 'test MusicAlbum constructor' do
  it 'takes three parameters and return a MusicAlbum instance' do
    expect(album01.instance_of?(MusicAlbum)).to eq(true)
    expect(album02.instance_of?(MusicAlbum)).to eq(true)
  end
  it 'instance title property should be correct' do
    expect(album01.title).to eq('Discovery')
    expect(album02.title).to eq('Motomami')
  end
  it 'instance date property should be correct' do
    expect(album01.publish_date).to eq('2001-03-12')
    expect(album02.publish_date).to eq('2022-03-18')
  end
  it 'instance should have and id' do
    expect(album01.id.nil?).to eq(false)
    expect(album02.id.nil?).to eq(false)
  end
  it 'instance on_spotify property should be correct' do
    expect(album01.on_spotify).to eq(true)
    expect(album02.on_spotify).to eq(true)
  end
end

describe 'test MusicAlbum can_be_archived? method' do
  it 'should return true if parent\'s method returns true AND if on_spotify equals true' do
    expect(album01.can_be_archived?).to eq(true)
    expect(album02.can_be_archived?).to eq(false)
  end
end
