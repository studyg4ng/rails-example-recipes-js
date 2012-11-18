class CreateContains < ActiveRecord::Migration
  def change
    create_table :contains do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.integer :amount
      t.string :unit

      t.timestamps
    end
  end
end
