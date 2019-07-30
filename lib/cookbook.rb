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
    ingredient_collect = []
    ingredients_required.each do |ingredient, amount|
      ingredient_hash = {}
      ingredient_hash[:ingredient] = ingredient.name
      ingredient_hash[:amount] = "#{amount} #{ingredient.unit}"
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
    @recipes.map do |recipe, hash|
      summary_hash = {}
      summary_hash[:name] = recipe.name
      summary_hash[:details] = details_hash(recipe)
      summaries << summary_hash
    end
    summaries
  end
end
