require_relative 'app'

class Refactor
  attr_reader :app

  def initialize
    @app = SchoolApp.new
  end

  def items(option)
    case option
    when 1
      @app.list_of_books
    when 2
      @app.list_of_people
    when 3
      @app.add_person_info
    when 4
      @app.book_creation
    when 5
      @app.rental_creation
    when 6
      @app.list_of_rentals_person_id
    end
  end

  def display_selection
    puts "Please choose an option by entering a number from below:\n"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
  end
end
