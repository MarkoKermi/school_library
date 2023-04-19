require './book'
require './person'
require './student'
require './teacher'
require './rental'
require './handle_data'
require 'json'
require 'pry'
require './display_persons'
require './create_person'

class SchoolApp
  def initialize
    @books_file = HandleData.new('books')
    @people = []
    @rentals = []
    # @books = @books_file.read.map{ |arr| Book.new(arr['title'], arr['author']) }
    @person = CreatePerson.new
    @display_persons = Display_Persons.new(@person)
  end

  def welcome
    puts 'Welcome to School Library App!'
  end

  def list_of_books
    if @books.empty?
      puts 'There is no books in the list'
    else
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def person_display(person)
    print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    puts ", Specialization: #{person.specialization}" if person.instance_of?(Teacher)
    puts ", Classroom: #{person.classroom}" if person.instance_of?(Student)
  end

  def list_of_people
    @display_persons.display_all_persons
  end

  def add_person_info
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    @person.create_person(person_type, age, name)
  end

  # def create_person(person_type, age, name)
  #   case person_type
  #   when '1'
  #     print 'Has parent permission? [Y/N]: '
  #     parent_permission = gets.chomp.downcase == 'y'
  #     print 'What is the student\'s classroom? '
  #     classroom = gets.chomp
  #     @people.push(Student.new(age, name, classroom, parent_permission: parent_permission))
  #   when '2'
  #     print 'Specialization: '
  #     specialization = gets.chomp
  #     @people.push(Teacher.new(age, name, specialization))
  #   else
  #     puts 'Invalid option'
  #     add_person_info
  #   end

  #   puts 'Person was created successfully'
  # end

  def rental_creation
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) #{book.title}, #{book.author}" }

    index_book = gets.chomp.to_i

    puts 'Select a person from following list by number (not ID)'
    @people.each_with_index do |person, index|
      print "#{index}) "
      person_display(person)
    end

    index_person = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @books[index_book], @people[index_person]))
    puts 'Rental created successfully'
  end

  def list_of_rentals_person_id
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  def book_creation
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def exit 
    @person.save_to_file
    # @books_file.write(@books.map(&:create_object))
  end
end
