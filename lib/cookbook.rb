require 'pry'
class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def method_name

  end

  def summary
    summaries = []
    @recipes.each_with_object({}) do |recipe, hash|
      details_hash = {}
      ingredients_hash = {}
      hash[:name] = recipe.name
      hash[:details] = details_hash[:ingredients] = recipe
        .ingredients_required.map do |ingredient, amount|
          ingredients_hash[:ingredient] = ingredient.name
          ingredients_hash[:amount] = amount
        end
      details_hash[:total_calories] = recipe.total_calories
      summaries << hash
    end
    summaries
  end
end
