require './book'
require './person'
require './student'
require './teacher'
require './rental'
require './handle_data'
require 'json'

require './display_persons'
require './create_person'
require './create_book'
require './display_books'
require './create_rental'

class SchoolApp
  def initialize
    @people = []
    @rentals = []
    @person_controller = CreatePerson.new
    @book_controller = CreateBook.new
    @rental_controller = CreateRental.new
  end

  def welcome
    puts 'Welcome to School Library App!'
  end

  def book_creation
    @book_controller.create_new_book
  end

  def list_of_books
    DisplayBooks.display_all_books(@book_controller.all_books)
  end

  def add_person_info
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp
    @person_controller.create_person(person_type: person_type, name: name, age: age)
  end

  def list_of_people
    DisplayPersons.display_all_persons(@person_controller.all_persons)
  end

  def rental_creation
    puts 'Select a book from the following list by number'
    DisplayBooks.display_all_books(@book_controller.all_books, print_index: true)

    book_index = gets.chomp.to_i
    book = @book_controller.all_books[book_index]

    puts 'Select a person from following list by number (not ID)'
    DisplayPersons.display_all_persons(@person_controller.all_persons, print_index: true)

    person_index = gets.chomp.to_i
    person = @person_controller.all_persons[person_index]

    print 'Enter Rental Date: '
    date = gets.chomp

    @rental_controller.create_new_rental(date: date, book: book, person: person)
  end

  def list_of_rentals_person_id
    print 'Enter ID of person: '
    id = gets.chomp.to_i
    puts '================================================================'
    puts 'Rentals: '
    @rental_controller.all_rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
    puts '================================================================'
  end

  def exit
    @person_controller.save_to_file
    @book_controller.save_to_file
    @rental_controller.save_to_file
  end
end
