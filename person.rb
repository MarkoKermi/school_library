require './nameable'
require './json_functionality'

class Person < Nameable
  include JsonFunctionality
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age: '', name: '', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.person = self
  end

  private

  def of_age?
    @age >= 18
  end
end

# pers = Person.new(name:'Namely Name McNamerson ', age:'20')
# json_string =  pers.to_json

# puts json_string.class
# pers1 = Person.new()
# pers1.from_json(json_string)

# puts pers1.instance_variables
