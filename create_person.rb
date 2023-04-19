require './person'
require './student'
require './teacher'
require './file_storage.rb'
require 'pry'
class CreatePerson
  attr_accessor:all_persons

	def initialize
    @all_persons = []
		create_person_objects
	end

  def create_person_objects
    raw_data = HandleData.read('persons')

    persons = raw_data.map{|obj| 
      puts obj
      if obj.respond_to?(:specialization)
      @all_persons.push(Teacher.new(obj.age, obj.name,obj.specialization,obj.parent_permission))
      else
      @all_persons.push(Student.new(age:obj["age"], name:obj['name'],classroom:obj['classroom'], parent_permission:obj['parent_permission']))
      end
      }
     
  end
	
	def create_person(person_type, age, name)
    puts @all_persons.class
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      input= gets.chomp.downcase == 'y'
      if input == 'y'
        pp = true
      else
        pp= false
      end
      print 'What is the student\'s classroom? '
      classroom = gets.chomp
      new_student = Student.new(age:age, name:name, classroom:classroom, parent_permission:pp)
      puts new_student.age
      @all_persons.push(new_student)
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
	   @all_persons
	end

  def save_to_file
    # binding.pry
    prepared_data = @all_persons.map { |person| 
      
      {age:person.age,name:person.name,classroom:person.classroom,parent_permission:person.parent_permission} }
   
    HandleData.write('persons',prepared_data)
  end

end
