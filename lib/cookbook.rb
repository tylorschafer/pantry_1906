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
    @recipes.each_with_object({}) do |recipe, hash|
      hash[:name] = recipe.name
      hash[:details] = recipe.ingredients_required.each_with_object({}) do |ingredient, hash_2|
        hash_2[:ingredient] = ingredient.name
        hash_2[:amount] = ingredient.unit
        end
      hash[:total_calories] = recipe.total_calories
    end
  end
end
