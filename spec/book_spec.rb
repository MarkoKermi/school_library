require_relative '../student'
require_relative '../rental'
require_relative '../book'

RSpec.describe Rental do
  let(:person) { Person.new(name: 'John Doe') }
  let(:book) { Book.new(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald') }
  let(:date) { '2022-01-01' }
  let(:rental) { Rental.new(date: date, book: book, person: person) }

  describe '#initialize' do
    it 'sets the date' do
      expect(rental.date).to eq(date)
    end

    it 'sets the person' do
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end

    it 'sets the book' do
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
  end

  describe '#to_json_custom' do
    let(:expected_json) do
      {
        JSON.create_id => 'Rental',
        'date' => date,
        'book' => book.to_json_custom,
        'person' => person.to_json_custom
      }.to_json
    end

    it 'returns the expected JSON representation' do
      expect(rental.to_json_custom).to eq(expected_json)
    end
  end
end
