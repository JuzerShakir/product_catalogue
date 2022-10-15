class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property
  accepts_nested_attributes_for :property

  validates :value, presence: true, length: { minimum: 1, maximum: 255 }
end
