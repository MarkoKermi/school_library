require './json_functionality'
class Book
  include JsonFunctionality
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title: '', author: '')
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end

  def create_object
    { title: @title, author: @author }
  end
end
