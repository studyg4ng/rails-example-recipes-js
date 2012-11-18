class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :name
      t.integer :difficulty
      t.integer :grade
      t.integer :quantity
      t.integer :minutes
      t.text :instructions

      t.timestamps
    end
  end
  def down
    drop_table :recipes
  end
end
