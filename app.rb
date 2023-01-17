class App
  def options
    puts "
      1 - List of all books
      2 - List of all music albums
      3 - List of all movies
      4 - List of all games
      5 - List of all genres
      6 - List of all labels
      7 - List of all authors
      8 - List of all sources
      9 - create a book
      10 - create a music album
      11 - create a movie
      12 - create a game
      13 - Exit
	  "
    puts 'Put an option : '
  end

  def choose_options
    options
    input = gets.chomp.to_i
    case input
    when 1
      puts 'List of all books:-'
    when 2
      puts 'List of all music albums:-'
    when 3
      puts 'List of all movies:-'
    when 4
      puts 'List of all games:-'
    when 5
      puts 'List of all genres:-'
    when 6
      puts 'List of all labels:-'
    when 7
      puts 'List of all authors:-'
    when 8
      puts 'List of all sources:-'
    when 9
      puts 'create a book:-'
    when 10
      puts 'create a music album:-'
    when 11
      puts 'create a movie:'
    when 12
      puts 'create a game:'
    when 13
      puts 'Thanks for using our app'
      exit
    else
      'Put an option between 1 to 13'
    end
  end
end
