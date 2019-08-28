class FoodJournal < ApplicationRecord
    belongs_to :user, optional: true
    
    validates :title, presence: true
    validates :description, presence: true
    validates :before_sugar_lvl , presence: true
    validates :after_sugar_lvl, presence: true

end
