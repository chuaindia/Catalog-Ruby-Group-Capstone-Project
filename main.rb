require_relative 'app'

class Main
  def start
    puts "
      1 - List of all books
      2 - List of all music albums
      3 - List of all games
      4 - List of all genres
      5 - List of all labels
      6 - List of all authors
      7 - create a book
      8 - create a music album
      9 - create a game
      10 - Exit
	  "
    puts 'Put an option : '
    action = gets.chomp.to_i
    if action < 10 && action.positive?
      starting(action)
    elsif action == 10
      puts 'Thanks for visiting our app'
    else
      start
    end
  end

  def starting(action)
    app = App.new
    case action
    when 1
      app.list_of_all_books
    when 2
      app.list_of_all_music_albums
    when 3
      app.list_of_all_games
    when 4
      app.list_of_all_genres
    when 5
      app.list_of_all_labels
    when 6
      app.list_of_all_authors
    when 7
      app.create_a_book
    when 8
      app.create_a_music_album
    when 9
      app.create_a_game
    end
  end
end

Main.new.start
