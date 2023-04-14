require './book'
require './person'
require './student'
require './teacher'
require './rental'

class SchoolApp
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def welcome
    puts 'Welcome to School Library App!'
  end

  def menu
    puts 'Please choose an option by entering a number: '
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
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
    if @people.empty?
      puts 'There is no people found'
    else
      @people.each { |person| person_display(person) }
    end
  end

  def add_person_info
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    create_person(person_type, age, name)
  end

  def create_person(person_type, age, name)
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      print 'What is the student\'s classroom? '
      classroom = gets.chomp
      @people.push(Student.new(age, name, classroom, parent_permission: parent_permission))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age, name, specialization))
    else
      puts 'Invalid option'
      add_person_info
    end

    puts 'Person was created successfully'
  end

  def book_creation
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

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

  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/CyclomaticComplexity
  def run
    welcome

    loop do
      menu
      option = gets.chomp

      case option
      when '1'
        list_of_books
      when '2'
        list_of_people
      when '3'
        add_person_info
      when '4'
        book_creation
      when '5'
        rental_creation
      when '6'
        list_of_rentals_person_id
      when '7', 'q', 'quit'
        break
      end
    end
    puts 'Thank you for using this app!'
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/CyclomaticComplexity
end
