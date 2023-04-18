require './person'
require './student'
require './teacher'


class Display_Persons
	
	attr_accessor:person_object

	def initialize(person_object)
		@person_object = person_object
	
	end

	def display_all_persons
    if @person_object.all_persons.empty?
      puts 'There is no people found'
    else
      @person_object.all_persons.each { |person| person_display(person) }
    end
  end
  def person_display(person)
    print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    puts ", Specialization: #{person.specialization}" if person.instance_of?(Teacher)
    puts ", Classroom: #{person.classroom}" if person.instance_of?(Student)
  end
end