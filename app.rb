require_relative 'item'
require_relative 'music_album'
require_relative 'genre'
require_relative 'book'
require_relative 'label'

class App
  def initialize
    @music_albums = []
    @load_genres = []
    @books = []
    @labels = []
  end

  def option_selector(user_input)
    case user_input
    when '1'
      list_books
    when '2'
      list_music_albums
    when '3'
      puts 'list all games method here'
    when '4'
      list_genres
    when '5'
      list_labels
    when '6'
      puts 'list author methods here'
    when '7'
      add_book
    when '8'
      add_music_album
    when '9'
      puts 'add game method here'
    end
  end

  def list_music_albums
    puts 'Music Albums'
    @music_albums.each do |music_album|
      puts "Name: #{music_album.name}, Publish Date: #{music_album.publish_date}, On Spotify: #{music_album.on_spotify}"
    end
  end

  def list_genres
    puts 'Genres:'
    @load_genres.each do |genre|
      puts "Genre Name: #{genre.name}"
    end
  end

  def add_music_album
    puts 'Album Name: '
    name = gets.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    puts 'Is it available on Spotify? Y/N'
    on_spotify = gets.chomp.downcase == 'y' || false

    @music_albums.push(MusicAlbum.new(name, publish_date, on_spotify))
    puts 'Music album created'
  end

  def add_book
    print 'Please, enter the book title: '
    title = gets.chomp

    print 'Please, enter the book publisher: '
    publisher = gets.chomp

    print 'Please, enter the book cover state: '
    cover_state = gets.chomp

    print 'Published Date [Enter date in format (yyyy-mm-dd)]: '
    publish_date = gets.chomp
    return unless publish_date

    @books.push(Book.new(title, publisher, cover_state, publish_date))
    puts 'Book created successfully'
  end

  def list_books
    puts 'There are no books yet! Please add books.' if @books.empty?
    @books.each do |book|
      puts "Name: #{book.name}, Publish Date: #{book.published_date}, cover_state: #{book.cover_state}"
    end
  end

  def list_labels
    puts 'There are no labels yet!' if @labels.empty?
    @labels.each do |label|
      puts "ID: #{label['id']}, Title: #{label['title']}, Color: #{label['color']}"
    end
  end
end
