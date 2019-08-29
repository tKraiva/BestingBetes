class CreateTaggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :tag, foreign_key: true
      t.references :food_journal, foreign_key: true

      t.timestamps
    end
  end
end
