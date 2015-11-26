class CreateContains < ActiveRecord::Migration
  def change
    create_table :contains do |t|
      t.references :recipe, index: true
      t.references :ingredient, index: true
      t.integer :amount
      t.string :unit

      t.timestamps null: false
    end
    add_foreign_key :contains, :recipes
    add_foreign_key :contains, :ingredients
  end
end
