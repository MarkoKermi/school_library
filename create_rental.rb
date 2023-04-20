require './rental'
require './rentals_addition'
class CreateRental
  attr_accessor :all_rentals

  def initialize
    @all_rentals = []
    populate_rentals_from_file
  end

  def populate_rentals_from_file
    raw_data = HandleData.read('rentals')
    raw_data.each do |rental_string|
      # rental = Rental.new()
      # rental.from_json(rental_string)
      rental = JSON.parse(rental_string, create_additions: true)
      @all_rentals.push(rental)
    end
  end

  def create_new_rental(date: '', book: '', person: '')
    rental = Rental.new(date: date, book: book, person: person)
    @all_rentals.push(rental)
    puts 'Rental created successfully'
  end

  def save_to_file
    prepared_data = @all_rentals.map do |rental|
      rental.to_json_custom
    end
    HandleData.write('rentals', prepared_data)
  end
end
