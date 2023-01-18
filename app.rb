require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative'author'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
    @games = []
    list_of_books_stored
    list_of_labels_stored
    lst_of_game_stored
  end

  def menu
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
      select(action)
    elsif action == 10
      puts 'Thanks for visiting our App'
    else
      menu
    end
  end

  def select(action)
    case action
    when 1
      list_of_all_books
    when 2
      list_of_all_music_albums
    when 3
      list_of_all_games
    when 4
      list_of_all_genres
    when 5
      list_of_all_labels
    when 6
      list_of_all_authors
    when 7
      create_a_book
    when 8
      create_a_music_album
    when 9
      create_a_game
    end
  end

  def create_a_book
    puts "\nEnter Publisher Name:\n"
    publisher = gets.chomp
    puts "\nWhat is the state of the Cover?\n"
    cover = gets.chomp
    puts "\nGive date of publication in dd/mm/yyyy format \n"
    date = gets.chomp
    book = Book.new(publisher, cover, date)
    @books << book
    puts "\nAdd a label? ---- Enter 1 for 'YES' and 2 for 'NO'\n"
    option = gets.chomp.to_i
    if option == 1
      puts "\nEnter title of the Book label\n"
      label_title = gets.chomp
      puts "\nEnter color of the Book label\n"
      label_color = gets.chomp
      label = Label.new(label_title, label_color)
      @labels << label
    end
    save_all_labels_books
  end

  def save_all_labels_books
    bookjson = []
    @books.each do |book|
      bookjson << { publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date }
    end
    booksjson = JSON.generate(bookjson)
    File.write('books.json', booksjson)
    labeljson = []
    @labels.each do |label|
      labeljson << { title: label.title, color: label.color }
    end
    labelsjson = JSON.generate(labeljson)
    File.write('labels.json', labelsjson)
    #    menu
  end

  def list_of_books_stored
    if File.exist?('books.json') && !File.zero?('books.json')
      bookfile = File.open('books.json')
      bookjson = bookfile.read
      JSON.parse(bookjson).map do |book|
        booksjson = Book.new(book['publisher'], book['cover_state'], book['publish_date'])
        @books << booksjson
      end
      bookfile.close
    else
      File.new('books.json', 'w')
    end
  end

  # def list_of_games_stored
  #   if File.exist?('games.json') && !File.zero?('games.json')
  #     gamefile = File.open('games.json')
  #     gamejson = gamefile.read
  #     JSON.parse(gamejson).map do |game|
  #       gamesjson = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])
  #       @games << gamesjson
  #     end
  #     gamefile.close
  #   else
  #     File.new('games.json', 'w')
  #   end
  # end

  def list_of_all_books
    if @books.empty?
      puts "\n No books are available"
    else
      @books.each do |book|
        puts "\nPublisher: #{book.publisher} | Cover: #{book.cover_state} | Date of Publication: #{book.publish_date}\n"
      end
    end
    #    menu
  end

  def list_of_all_labels
    if @labels.empty?
      puts "\n No labels are available"
    else
      @labels.each { |label| puts "\nLabel name: #{label.title}| color: #{label.color}\n" }
    end
    #    menu
  end

  def list_of_all_games
    if @games.empty?
      puts "\n No games are available"
    else
      @games.each do |game|
        puts "\nMultiplayer: #{game.multiplayer}| Last played at: #{game.last_played_at}| Date of Publication: #{game.publish_date}\n"
      end
    end
  end

  def list_of_all_authors
    if @authors.empty?
      puts "\n No authors are available"
    else
      @authors.each { |author| puts "\nFirst Name: #{author.first_name}| Last Name: #{author.last_name}\n" }
    end
  end

  def create_a_game
    puts "\nEnter Multiplayer:\n"
    multiplayer = gets.chomp
    puts "\nEnter Last played at:\n"
    last_played_at = gets.chomp
    puts "\nGive date of publication in dd/mm/yyyy format \n"
    publish_date = gets.chomp
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games << game
    puts "\nWant to add a game? ---- Enter 1 for 'YES' and 2 for 'NO'\n"
    option = gets.chomp.to_i
    if option == 1
      puts "\nEnter the First Name of the Author:\n"
      first_name = gets.chomp
      puts "\nEnter the Last Name of the Author:\n"
      last_name = gets.chomp
      author = Author.new(first_name, last_name)
      @authors << author  
    end
    # save_all_authors_games
  end

  def list_of_labels_stored
    if File.exist?('labels.json') && !File.zero?('labels.json')
      labelsfile = File.open('labels.json')
      labeljson = labelsfile.read
      JSON.parse(labeljson).map do |label|
        labelsjson = Label.new(label['title'], label['color'])
        @labels << labelsjson
      end
      labelsfile.close
    else
      File.new('labels.json', 'w')
    end
  end
end
