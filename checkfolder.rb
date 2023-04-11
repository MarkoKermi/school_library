require_relative './person'
require_relative './decorator'

person = Person.new(age: 22, name: 'maximilianus')
puts person.correct_name
capitalized_person = Capitalize.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = Trimmer.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
