class Pantry
  attr_reader :stock, :shopping_list
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
  end

  def stock_check(food)
    @stock[food]
  end

  def restock(food, amount)
    @stock[food] += amount
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.map do |ingredient, amount|
      @shopping_list[ingredient] += amount
    end
  end

  def print_shopping_list
    @shopping_list.map do |k,v|
      "* #{k}: #{v}\n"
    end.join('').chomp("\n")
  end
end
