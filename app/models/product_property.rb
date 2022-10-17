class ProductProperty < ApplicationRecord
  belongs_to :product
  belongs_to :property
  accepts_nested_attributes_for :property

  validates :value, presence: true, length: { maximum: 255 }
end
