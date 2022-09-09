class Cart
  attr_accessor :checkout, :goods

  def initialize
    @goods = []
  end

  def checkout
    total_sum = 0
    @goods.each do |good| x = good.price
    total_sum += x
    end
    total_sum
  end
end
