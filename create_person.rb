require './person'
require './student'
require './teacher'


class CreatePerson
  attr_accessor:all_persons

	def initialize
		@all_persons = []
	end
	
	def create_person(person_type, age, name)
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      print 'What is the student\'s classroom? '
      classroom = gets.chomp
      @all_persons.push(Student.new(age, name, classroom, parent_permission: parent_permission))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @all_persons.push(Teacher.new(age, name, specialization))
    else
      puts 'Invalid option'
      add_person_info
    end

    puts 'Person was created successfully'
  end

	def get_all_persons
	   @@all_persons
	end

end
