require 'pry'
class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients_hash(ingredients_required)
    ingredient_hash = {}
    ingredient_collect = []
    ingredients_required.each do |ingredient, amount|
      ingredient_hash[:ingredient] = ingredient.name
      ingredient_hash[:amount] = amount
      ingredient_collect << ingredient_hash
    end
    ingredient_collect
  end

  def details_hash(recipe)
    details_summary = {}
    details_summary[:ingredients] = ingredients_hash(recipe.ingredients_required)
    details_summary[:total_calories] = recipe.total_calories
    details_summary
  end

  def summary
    summaries = []
    @recipes.each_with_object({}) do |recipe, hash|
      hash[:name] = recipe.name
      hash[:details] = details_hash(recipe)
      summaries << hash
    end
    summaries
  end
end
