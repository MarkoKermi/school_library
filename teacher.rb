require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age: '', name: '', specialization: '', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
