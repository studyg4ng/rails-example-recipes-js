class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :difficulty
      t.integer :grade
      t.integer :quantity
      t.integer :minutes
      t.text :instructions

      t.timestamps null: false
    end
  end
end
