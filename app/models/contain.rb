class Contain < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  attr_accessible :amount, :unit, :recipe_id, :ingredient_id
end
