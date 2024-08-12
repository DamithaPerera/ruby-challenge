class Course < ApplicationRecord
  belongs_to :category
  validates :name, presence: true

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :category
  validates :name, presence: true
end
