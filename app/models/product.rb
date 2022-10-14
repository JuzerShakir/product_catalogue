class Product < ApplicationRecord
  has_many :product_properties
  accepts_nested_attributes_for :product_properties, allow_destroy: true

  has_many :properties, through: :product_properties
  accepts_nested_attributes_for :properties, allow_destroy: true

  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { maximum: 1024 }

  validates :upc, presence: true, uniqueness: true, format: { with: /\A\d{12,13}$|^\d{10}\z/, message: "is invalid"}

  validates :available_on, presence: true
end