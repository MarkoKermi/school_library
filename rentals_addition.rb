# require './person.rb'
# require './book.rb'

# class Rentals

# 	def to_json(*args)
# 	{
# 		JSON.create_id => self.class.name,
# 		'date' => date,
# 		'book' => book.to_json_custom,
# 		'person'=> person.to_json_custom
# 	}.to_json(*args)
# end

#  def self.json_create(object)
# 	person_string = object['person']
# 	person=Person.new()
# 	person.from_json(person_string)
# 	book_string = object['book']
# 	book = Book.new()
# 	book.from_json(book_string)
# 	date = object['date']
# 	new(date:date, person:person,book:book)
#  end
# end
