require_relative '../classes/label'
require_relative '../classes/book'

label1 = Label.new('Indy', 'orange')

describe 'test Label constructor ' do
  it 'takes two parameter and returns a Label object' do
    expect(label1.instance_of?(Label)).to eq(true)
  end
  it 'label title parameter should be Indy' do
    expect(label1.title).to eq('Indy')
  end
  it 'label color parameter should be orange' do
    expect(label1.color).to eq('orange')
  end
  it 'label object should have an id' do
    expect(label1.id.nil?).to eq(false)
  end
  it 'label object should have an empty items array' do
    expect(label1.items.empty?).to eq(true)
  end
end

describe 'test Label add_item method ' do
  it 'item is included in items arrray' do
    book1 = Book.new('Once Uppon a Time', '2000-09-18', 'Marvel', 'good')
    label1.add_item(book1)
    expect(label1.items.length).to eq(1)
  end
end
