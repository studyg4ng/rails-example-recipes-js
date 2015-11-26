class Ingredient < ActiveRecord::Base
  has_many :contains, dependent: :destroy
  has_many :recipes,  through:   :contains

  validates :name,         length: { minimum:  2 }

  default_scope { order('name') }
end
