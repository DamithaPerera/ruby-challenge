class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses
  validates :name, presence: true, uniqueness: true
end
