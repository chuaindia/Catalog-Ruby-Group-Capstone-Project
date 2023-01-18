require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'

require 'json'

class App
  def initialize
    @books = []
    @labels = []
    @music = []
    @genre = []
    list_of_books_stored
    list_of_labels_stored
    list_of_albums_stored
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

  def create_a_music_album
    puts "\nEnter if its on spotify Name:\n"
    on_spotify = gets.chomp
    puts "\nWhat is the release date?\n"
    on_publish_date = gets.chomp
    music = MusicAlbum.new(on_spotify,on_publish_date)
    @music << music
    puts "\nAdd a genre? ---- Enter 1 for 'YES' and 2 for 'NO'\n"
    option = gets.chomp.to_i
    if option == 1
      puts "\nEnter name of the genre\n"
      name = gets.chomp
      genre = Genre.new(name)
      @genre << genre
    end
    save_all_albums_genres
  end

  def save_all_albums_genres
    albumjson = []
    @music.each do |albums|
      albumjson << { on_spotify: albums.on_spotify, publish_date: albums.publish_date }
    end
    albumsJson = JSON.generate(albumjson)
    File.write('albums.json', albumsJson)
    genreJson = []
    @genre.each do |genre|
      genreJson << { name: genre.name }
    end
    genresJson = JSON.generate(genreJson)
    File.write('genre.json', genresJson)
    #    menu
  end

  def list_of_albums_stored
    if File.exist?('albums.json') && !File.zero?('albums.json')
      albumFile = File.open('albums.json')
      albumJson = albumFile.read
      JSON.parse(albumJson).map do |album|
        albumsJson = MusicAlbum.new(album['on_spotify'], album['publish_date'])
        @music << albumsJson
      end
      albumFile.close
    else
      File.new('albums.json', 'w')
    end
  end

  def list_of_all_music_albums
    if @music.empty?
      puts "\n No album are available"
    else
      @music.each do |album|
        puts "\n on_spotify: #{album.on_spotify} | Publish date: #{album.publish_date}\n"
      end
    end
    #    menu
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
