class Category < ApplicationRecord
  belongs_to :vertical
  has_many :courses
  validates :name, presence: true, uniqueness: true
  validate :name_uniqueness_across_models

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :vertical
  has_many :courses
  validates :name, presence: true, uniqueness: true

  private

  def name_uniqueness_across_models
    if Vertical.exists?(name: name)
      errors.add(:name, 'must be unique across Vertical and Category')
    end
  end
end
