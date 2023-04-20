require './file_storage'
require './book'

class CreateBook
  attr_accessor :all_books

  def initialize
    @all_books = []
    populate_books_from_file
  end

  def populate_books_from_file
    raw_data = HandleData.read('books')

    raw_data.each do |book_string|
      book = Book.new
      book.from_json(book_string)
      @all_books.push(book)
    end
  end

  def create_new_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @all_books.push(Book.new(title: title, author: author))
    puts 'Book created successfully'
  end

  def save_to_file
    prepared_data = @all_books.map(&:to_json_custom)
    HandleData.write('books', prepared_data)
  end
end
