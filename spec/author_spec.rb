require_relative '../author'
require_relative '../item'

describe Author do
  context 'It will test the Author and add_to_item' do
    author = Author.new('Anindya', 'Hazra')
    it 'Instance of a new Author' do
      expect(author).to be_an_instance_of Author
    end
    it 'It will give List of items' do
      expect(author.items.class).to eql Array
    end
    it 'Give the Correct First Name' do
      expect(author.first_name).to eql 'Anindya'
    end
    it 'Give the Correct Last Name' do
      expect(author.last_name).to eql 'Hazra'
    end
  end
end
