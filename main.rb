if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [$stdin, $stdout].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/disk'
require_relative 'lib/product_collection'
require_relative 'lib/cart'
require 'byebug'

collection = ProductCollection.from_dir(File.join(__dir__, 'data'))
collection.sort!(by: :amount, order: :asc)

puts 'What would you like to buy?'

user_choice = nil
cart = Cart.new

until user_choice == 0
  collection.products.each.with_index(1) do |product, index|
    puts "#{index}. #{product}"
  end
  puts '0. Exit'

  user_choice = $stdin.gets.to_i

  while user_choice >= collection.products.size + 1
    puts "Choose correct option"
    user_choice = $stdin.gets.to_i
  end
  collection.cls

  next if user_choice.zero?

  puts "You have chosen: #{collection.products[user_choice - 1]}"
  puts '-------------------------------------------------------'
  cart.goods << collection.products[user_choice - 1]
end

puts 'You cart:'
cart.goods.each.with_index(1) { |elem, index| puts "#{index}. #{elem}" }
puts
puts "Total amount: #{cart.checkout} USD"
