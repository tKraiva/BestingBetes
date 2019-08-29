class FoodJournal < ApplicationRecord
    belongs_to :user, optional: true
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    validates :title, presence: true
    validates :description, presence: true
    validates :before_sugar_lvl , presence: true
    validates :after_sugar_lvl, presence: true

    def tag_names
        self.tags.map{ |t| t.name }.join(",")
      end
    
       # Appending = at the end of a method name, allows to implement
      # a "setter". A setter is a method that is assignable.
      # Example:
      # p.tag_names = "stuff,yo"
      # The code in the example above would call the method we wrote
      # below where the value on the right-hand side of the = would
      # become the argument to the method.
      # This is similar to implementing an `attr_writer`.
      def tag_names=(rhs)
        self.tags = rhs.strip.split(/\s*,\s*/).map do |tag_name|
          Tag.find_or_initialize_by(name: tag_name)
        end
      end

end
