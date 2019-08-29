class AddImageToFoodJournal < ActiveRecord::Migration[5.0]
  def change
    add_column :food_journals, :image, :string
  end
end
