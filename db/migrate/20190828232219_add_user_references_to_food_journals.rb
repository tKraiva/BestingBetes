class AddUserReferencesToFoodJournals < ActiveRecord::Migration[5.0]
  def change
    add_reference :food_journals, :user, foreign_key: true
  end
end
