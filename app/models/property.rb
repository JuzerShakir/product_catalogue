class Property < ApplicationRecord
    has_many :product_properties
    has_many :products, through: :product_properties

    validates :name, presence: true, uniqueness: true, length: { minimum: 1, maximum: 255 }
end
