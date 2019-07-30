class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.map {|key, value| key}
  end

  def amount_required(ingredient)
    @ingredients_required[ingredient]
  end

  def total_calories
    @ingredients_required.sum {|ingredient, amount| ingredient.calories * amount}
  end

end
