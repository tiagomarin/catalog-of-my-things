require_relative '../classes/book'
require_relative '../classes/label'

book1 = Book.new('Once Uppon a Time', '2000-09-18', 'Marvel', 'good')
book2 = Book.new('The Great Wolf', '2022-03-18', 'Klaus', 'bad')
label1 = Label.new('Indy', 'orange')
label2 = Label.new('Romance', 'blue')

describe 'test book constructor ' do
  it 'takes three parameter and returns a book object' do
    expect(book1.instance_of?(Book)).to eq(true)
    expect(book2.instance_of?(Book)).to eq(true)
  end
  it 'book title parameter should be correct' do
    expect(book1.title).to eq('Once Uppon a Time')
    expect(book2.title).to eq('The Great Wolf')
  end
  it 'book object should have an id' do
    expect(book1.id.nil?).to eq(false)
    expect(book2.id.nil?).to eq(false)
  end
  it 'book object should have a date' do
    expect(book1.publish_date).to eq('2000-09-18')
    expect(book2.publish_date).to eq('2022-03-18')
  end
  it 'book object should a correct cover_state paramenter' do
    expect(book1.cover_state).to eq('good')
    expect(book2.cover_state).to eq('bad')
  end
end

describe 'test book can_be_arquived method ' do
  it "return true when parent's method returns true OR if cover_state is true, else return false" do
    expect(book1.can_be_archived?).to eq(true) # publish date older than 10 years
    expect(book2.can_be_archived?).to eq(true) # cover condition bad
  end
end
