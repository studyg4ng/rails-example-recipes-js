class Recipe < ActiveRecord::Base
  has_many :contains, dependent: :destroy
  has_many :ingredients, through: :contains

  validates :name,         length: { minimum:  2 }
  validates :instructions, length: { minimum: 20 }
  validates :difficulty,   inclusion: { in: 1..5 }
  validates :grade,        inclusion: { in: 1..5 }

  def self.fuzzy_find_by_name( s )
    includes(:ingredients).where(arel_table[:name].matches("%#{s}%"))
  end

  def self.find_by_ingredients( wanted_ingredients )
    # ids have to be integers, have to be uniq, cannot be 0
    ingredient_ids = wanted_ingredients.map(&:to_i).uniq.keep_if{|id| id > 0 }

    no_of_ingredients = ingredient_ids.length

    # turn into a string, separated by commas
    ingredient_ids_csv = ingredient_ids.join(",")

    # find recipe who contain ALL the specified ingredients
    recipe_ids = Contain.includes(:ingredients).find_by_sql(<<-END_SQL).map{|r| r.recipe_id}
      SELECT recipe_id, count(recipe_id) 
      FROM contains  
      WHERE ingredient_id IN ( #{ingredient_ids_csv} ) 
      GROUP BY recipe_id 
      HAVING count(recipe_id) = #{no_of_ingredients}
    END_SQL

    Recipe.find( recipe_ids )
  end
end
