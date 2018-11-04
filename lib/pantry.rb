class Pantry
  attr_reader :stock, :shopping_list, :cookbook
  def initialize
    @stock = Hash.new(0)
    @shopping_list = Hash.new(0)
    @cookbook = Hash.new(0)
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

  def add_to_cookbook(recipe)
    @cookbook[recipe.name] = recipe
  end

  def what_can_i_make
    possible_dishes = []
    @cookbook.each do |recipe_name, recipe_object|
      recipe_object.ingredients.each do |ingredient_name, ingredient_amount|
        @stock.each do |stock_name, stock_amount|
          if stock_name == ingredient_name && stock_amount > ingredient_amount
            possible_dishes << recipe_name
          end
        end
      end
    end
    possible_dishes.uniq
  end

  def how_many_can_i_make
    quantity_to_make = {}
    what_can_i_make.each do |recipe_name|
      @cookbook[recipe_name].ingredients.each do |ingredient_name, ingredient_amount|
        @stock.map do |stock_name, stock_amount|
          if stock_name == ingredient_name
            possible_amount = stock_amount / ingredient_amount
            quantity_to_make[recipe_name] = possible_amount
          end
        end
      end
    end
    quantity_to_make
  end
end
