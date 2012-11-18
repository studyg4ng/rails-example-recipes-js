class Recipe < ActiveRecord::Base
  has_many :contains, :dependent => :destroy
  has_many :ingredients, :through => :contains
  attr_accessible :name, :instructions, :difficulty, :grade, :minutes, :quantity, :ingredient_ids

  validates :name,         :length    => { :minimum => 2 }
  validates :instructions, :length    => { :minimum => 20 }
  validates :difficulty,   :inclusion => { :in => 1..5 }
  validates :grade,        :inclusion => { :in => 1..5 }
end
