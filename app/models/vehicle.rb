class Vehicle < ApplicationRecord
  validates :description, length: { minimum: 3 }
  belongs_to :model_variant
end
