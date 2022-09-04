if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

film = Film.new(title: 'Leon', director: 'Luc Besson', price: 40, year: 1994, amount: 100)
film.update(amount: 5)

book = Book.new(title: 'Harry Potter', genre: 'Fantasy', amount: 7, author: 'J. K. Eowling', price: 160)
book.update(author: '	J. K. Rowling', price: 120)

puts film
puts book
