class ModelVariant < ApplicationRecord
  validates :name, presence: true
  belongs_to :model
end
