class Library
  attr_accessor :shelves

  def initialize shelves
    @shelves = shelves
  end

  def report
    @shelves.each_with_index do |shelf, i|
      puts "Shelf ##{i}"
      shelf.report
      puts
    end
  end
end

class Shelf
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
  end

  def remove_book(book)
    @books.delete(book)
  end

  def report
    @books.each do |book|
      puts book
    end
  end
end


class Book
  attr_accessor :genre, :title, :shelf

  def initialize genre, title, shelf
    @genre = genre
    @title = title
    enshelf(shelf)
  end

  def to_s
    "#{@genre} novel #{@title} is highly recommended."
  end

  def enshelf(shelf)
    shelf.add_book(self)
    @shelf = shelf
  end

  def unshelf
    @shelf.remove_book(self)
    @shelf = nil
  end
end

#Make a shelf
shelf_A = Shelf.new
shelf_B = Shelf.new
shelf_C = Shelf.new

#Make Book instances:
  Book.new("HORROR", "Swan Song", shelf_A)
  Book.new("HORROR", "Horns", shelf_A)
  Book.new("SciFi", "Neuromancer", shelf_B)
  dune = Book.new("SciFi", "DUNE", shelf_B)
  Book.new("MYSTERY", "Trace", shelf_C)
  Book.new("MYSTERY", "Mike Hammer", shelf_C)

#define that the shelves contain books
shelf_B.report
dune.unshelf
#puts lolita on the shelf
puts
shelf_B.report
#is lolita on the shelf?
puts dune.shelf.inspect
p dune.shelf
puts dune
p dune
# Added lolita back on the shelf
puts dune.enshelf(shelf_B)
puts
shelf_A.report
puts
#create library and put shelves in it
library = Library.new([shelf_A, shelf_B, shelf_C])
puts
library.report
