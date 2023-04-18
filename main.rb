require_relative 'refactor'

def main
  puts "Welcome to School library App\n"
  refactor = Refactor.new
  loop do
    refactor.display_selection
    option = gets.chomp.to_i
    case option
    when 1..6
      refactor.items(option)
    when 7
      puts 'Thank you for using this app!'
      at_exit do
        puts 'save all the things!!'
      end
    

      break
    else
      puts 'Ivalid Option.Please Try again.'
      redo
    end
  end
end

main
