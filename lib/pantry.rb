class Pantry
  attr_reader :stock
  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(food)
    @stock[food]
  end

  def restock(food, amount)
    @stock[food] += amount
  end
end
