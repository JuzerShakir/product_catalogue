class Product < ApplicationRecord
  has_many :product_properties, dependent: :destroy
  accepts_nested_attributes_for :product_properties, allow_destroy: true

  has_many :properties, through: :product_properties

  belongs_to :user

  validates :name, presence: true, uniqueness: true, length: { maximum: 1024 }

  validates :upc, uniqueness: true, format: { with: /\A\d{12,13}\z|\A\d{10}\z/, message: "length must be 10, 12 or 13"}

  validates :available_on,
                  inclusion: { in: (Date.tomorrow..), message: "must be in future" }
end