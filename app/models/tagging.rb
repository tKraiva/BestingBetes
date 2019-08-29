class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :food_journal
 

   validates(:tag_id, uniqueness: { scope: :food_journal_id })
end
