require 'faker'
require 'open-uri'

Cocktail.destroy_all

9.times do
  cocktail = Cocktail.new(name: Faker::Beer.name)
  cocktail.save
end

9.times do
  dose = Dose.new(description: Faker::Beer.alcohol)
  dose.save
end


list = JSON.parse(open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
list['drinks'].each { |hash| Ingredient.create(name: hash['strIngredient1'].capitalize) }
