require_relative '../classes/movie'

movie1 = Movie.new('Gladiator', '2020-10-13', false)
movie2 = Movie.new('Trip to the moon', '1900-05-24', true)

describe 'test Movie constructor ' do
  it 'takes three parameter and returns a Movie object' do
    expect(movie1.instance_of?(Movie)).to eq(true)
    expect(movie2.instance_of?(Movie)).to eq(true)
  end
  it 'Movie title parameter should be correct' do
    expect(movie1.title).to eq('Gladiator')
    expect(movie2.title).to eq('Trip to the moon')
  end
  it 'movie object should have an id' do
    expect(movie1.id.nil?).to eq(false)
    expect(movie2.id.nil?).to eq(false)
  end
  it 'movie object should have a date' do
    expect(movie1.publish_date).to eq('2020-10-13')
    expect(movie2.publish_date).to eq('1900-05-24')
  end
  it 'movie object should have a silent paramenter' do
    expect(movie1.silent).to eq(false)
    expect(movie2.silent).to eq(true)
  end
end

describe 'test Movie can_be_arquived method ' do
  it "return true when parent's method returns true OR if silent equals true, else return false" do
    expect(movie1.can_be_archived?).to eq(false)
    expect(movie2.can_be_archived?).to eq(true)
  end
end
