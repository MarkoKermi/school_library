require './person'
require './student'
require './teacher'
require './file_storage'
require 'pry'

class CreatePerson
  attr_accessor :all_persons

  def initialize
    @all_persons = []
    create_person_objects
  end

  def create_person_objects
    raw_data = HandleData.read('persons')

    raw_data.each do |obj|
      if obj.include?('specialization')
        teacher = Teacher.new
        teacher.from_json(obj)
        @all_persons.push(teacher)

      else
        student = Student.new
        student.from_json(obj)
        @all_persons.push(student)

      end
    end
  end

  def create_person(person_type:, name:, age:)
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      input = gets.chomp.downcase == 'y'
      pp = input == 'y'
      print 'What is the student\'s classroom? '
      classroom = gets.chomp
      new_student = Student.new(age: age, name: name, classroom: classroom, parent_permission: pp)
      puts new_student.age
      @all_persons.push(new_student)
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      @all_persons.push(Teacher.new(age: age, name: name, specialization: specialization))
    else
      puts 'Invalid option'
      add_person_info
    end

    puts 'Person was created successfully'
  end

  def save_to_file
    prepared_data = @all_persons.map(&:to_json_custom)
    HandleData.write('persons', prepared_data)
  end
end
