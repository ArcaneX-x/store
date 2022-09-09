class ProductCollection
  attr_reader :products

  PRODUCT_TYPES = {
    book: {dir: 'books', klass: Book},
    movie: {dir: 'movies', klass: Film},
    disk: {dir: 'cd', klass: Disk}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each_value do |hash|

    product_dir = hash[:dir]
    product_class = hash[:klass]

    Dir[File.join(dir_path, product_dir, '*.txt')].each do |path|
        products  << product_class.from_file(path)
      end
    end
    self.new(products)
  end

  def sort!(parameters)
    case parameters[:by]
    when :title
      @products.sort_by!(&:title)
    when :price
      @products.sort_by!(&:price)
    when :amount
      @products.sort_by!(&:amount)
    end

    @products.reverse! if parameters[:order] == :asc
    self
  end

  def cls
    system('clear') || system('cls')
  end
end
