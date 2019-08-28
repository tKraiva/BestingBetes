class CreateFoodJournals < ActiveRecord::Migration[5.0]
  def change
    create_table :food_journals do |t|
      t.text :title
      t.text :description
      t.integer :before_sugar_lvl
      t.integer :after_sugar_lvl

      t.timestamps
    end
  end
end
