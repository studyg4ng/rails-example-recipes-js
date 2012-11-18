class Ingredient < ActiveRecord::Base
  has_many :contains, :dependent => :destroy
  has_many :recipes, :through => :contains
  attr_accessible :name
end
