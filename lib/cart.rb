class Cart
  attr_accessor :checkout, :goods

  def initialize
    @goods = []
  end

  def checkout
    total_sum = 0
    @goods.each do |good|
    total_sum += good.price
    end
    total_sum
  end
end
