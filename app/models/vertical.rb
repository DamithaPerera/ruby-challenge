class Vertical < ApplicationRecord
    has_many :categories
    validates :name, presence: true, uniqueness: true
    validate :name_uniqueness_across_models

    private
  
    def name_uniqueness_across_models
      if Category.exists?(name: name)
        errors.add(:name, 'must be unique across Vertical and Category')
      end
    end
end
