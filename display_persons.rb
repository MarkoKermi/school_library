require './person'
require './student'
require './teacher'

class DisplayPersons
  def self.display_all_persons(all_persons, print_index: false)
    if all_persons.empty?
      puts '<<>> No people found. Please add Teachers or Students. <<>>'
    else
      puts '==========================================================='
      if print_index
        all_persons.each_with_index { |person, index| person_display(person, index: index) }
      else
        all_persons.each { |person| person_display(person) }
      end
      puts '==========================================================='
    end
  end

  def self.person_display(person, index: '')
    print "#{index}. " unless index == ''
    print "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    puts ", Specialization: #{person.specialization}" if person.instance_of?(Teacher)
    puts ", Classroom: #{person.classroom}" if person.instance_of?(Student)
  end
end
