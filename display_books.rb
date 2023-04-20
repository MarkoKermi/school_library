class DisplayBooks
  def self.display_all_books(all_books, print_index: false)
    if all_books.empty?
      puts 'No Books Present in Library. Create Books'
    else
      puts '==========================================================='
      if print_index
        all_books.each_with_index { |book, index| book_display(book, index: index) }
      else
        all_books.each { |book| book_display(book) }
      end
      puts '==========================================================='
    end
  end

  def self.book_display(book, index: '')
    print "#{index}." unless index == ''
    puts " Title: \"#{book.title}\", Author: #{book.author}"
  end
end
